/*
 * main.c
 *
 *  Created on: Mar 11, 2025
 *      Author: ganibllo
 */

#include "main.h"
#include "dp83848.h"
#include "mb.h"
#include "mbport.h"
#include "mt_port.h"
#include "rtc.h"
//#include "lwip.h"
/************************************************************************Defines*/
#define LED_15_ON  GPIOE->BSRR |= GPIO_BSRR_BR15
#define LED_15_OFF GPIOE->BSRR |= GPIO_BSRR_BS15

#define DEBOUNCE_CNT_BTN  1
#define REG_HOLDING_START           0x1000
#define REG_HOLDING_NREGS           130
#define REG_INPUT_START             0x1000
#define REG_INPUT_NREGS             4

#define LED_1   GPIO_ODR_OD13
#define LED_2   GPIO_ODR_OD14
#define LED_3   GPIO_ODR_OD15

#define CHECK_OUTPUT_E(LD)  (GPIOE->ODR & LD)
#define CHECK_OUTPUT_B(LD)  (GPIOB->ODR & LD)
#define CHECK_INPUT(LD)     (GPIOB->IDR & LD)

#define WKUP_PIN_ENB		0
#define WAKE_UP_RTC			0
/* ----------------------- Static variables ---------------------------------*/

static USHORT   usRegHoldingStart = REG_HOLDING_START;
static USHORT   usRegHoldingBuf[REG_HOLDING_NREGS];
static USHORT   usRegInputStart = REG_INPUT_START;
static USHORT   usRegInputBuf[REG_INPUT_NREGS];

SemaphoreHandle_t my_sem;
/************************************************************************VARs*****/

uint8_t s1_state = 0;
uint32_t s1_cnt = 0;

uint8_t s2_state = 0;
uint32_t s2_cnt = 0;

uint8_t s3_state = 0;
uint32_t s3_cnt = 0;


uint32_t tim2_ticks = 0;
uint32_t timer_elapsed = 0;


TaskHandle_t xTask1Handle = NULL;
eTaskState TaskState1;

extern rtcCalendar myCalendar;

wiz_NetInfo my_struct_w5500 = { .mac = {0x00, 0x08, 0xdc,0x00, 0xab, 0xcd}, //<-mac should be unique.
                            .ip = {192, 168, 1, 123},
                            .sn = {255,255,255,0},
                            .gw = {192, 168, 1, 1},
                            .dns = {0,0,0,0},
                            .dhcp = NETINFO_STATIC };
/************************************************************************Functions*/
int8_t wizchip_init(uint8_t* txsize, uint8_t* rxsize);
void system_clock_168m_25m_hse(void);
void RTC_DateTime_init(void);
void wizchip_sw_reset(void);
void debug_usart_init(void);
void GPIOe_out_init(void);
void RS_485_init(void);
void RTC_SB_mode(void);
void w5500_init(void);
void RTC_unlock(void);
void SPI_init(void);
void RTC_init(void);
void RTC_lock(void);



void GPIO_RCC_init(void){

  /*Тактирование порта на шине AHB1 */
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOEEN;

}

void vTask1(void* pvParameters){

    static_host_configuration(my_struct_w5500.mac, my_struct_w5500.ip, my_struct_w5500.sn, my_struct_w5500.gw, my_struct_w5500.dns);
	check_cable_presence();
	check_phy_status();
	print_current_host_configuration();
	while(1){
		vTaskDelay(1000);
		USARTx_send_data("vTask1\r\n");
	}
}

void vTaskCheckCable(void* pvParameters){

	int i;
	portTickType xLastWakeTime;
	/* Select either ASCII or RTU Mode. */
	(void) eMBInit(MB_RTU, 0x0A, 0, 38400, MB_PAR_NONE);

	/* Initialize the holding register values before starting the
	 * Modbus stack
	 */
	for (i = 0; i < REG_HOLDING_NREGS; i++) {
		usRegHoldingBuf[i] = (unsigned short) i;
	}
	/* Initialize the input register values before starting the
	 * Modbus stack
	 */
	for (i = 0; i < REG_INPUT_NREGS; i++) {
		usRegInputBuf[i] = (unsigned short) i;
	}

	/* Enable the Modbus Protocol Stack. */
	(void) eMBEnable();
	while (1) {
		/* Call the main polling loop of the Modbus protocol stack. */
		(void) eMBPoll();
		usRegInputBuf[0]++;
		xLastWakeTime = xTaskGetTickCount( );
		usRegInputBuf[1] = ( unsigned portSHORT )( xLastWakeTime >> 16UL );
		usRegInputBuf[2] = ( unsigned portSHORT )( xLastWakeTime & 0xFFFFUL );
		usRegInputBuf[3] = 33;
//		eMBRegInputCB
	}
}

eMBErrorCode
eMBRegInputCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs )
{
    eMBErrorCode    eStatus = MB_ENOERR;
    int             iRegIndex;

    if( ( usAddress >= REG_INPUT_START )
        && ( usAddress + usNRegs <= REG_INPUT_START + REG_INPUT_NREGS ) )
    {
        iRegIndex = ( int )( usAddress - usRegInputStart );
        while( usNRegs > 0 )
        {
            *pucRegBuffer++ = ( unsigned char )( usRegInputBuf[iRegIndex] >> 8 );
            *pucRegBuffer++ = ( unsigned char )( usRegInputBuf[iRegIndex] & 0xFF );
            iRegIndex++;
            usNRegs--;
        }
    }
    else
    {
        eStatus = MB_ENOREG;
    }

    return eStatus;
}

eMBErrorCode
eMBRegHoldingCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs, eMBRegisterMode eMode )
{
    eMBErrorCode    eStatus = MB_ENOERR;
    int             iRegIndex;

    if( ( usAddress >= REG_HOLDING_START ) &&
        ( usAddress + usNRegs <= REG_HOLDING_START + REG_HOLDING_NREGS ) )
    {
        iRegIndex = ( int )( usAddress - usRegHoldingStart );
        switch ( eMode )
        {
            /* Pass current register values to the protocol stack. */
        case MB_REG_READ:
            while( usNRegs > 0 )
            {
                *pucRegBuffer++ = ( unsigned char )( usRegHoldingBuf[iRegIndex] >> 8 );
                *pucRegBuffer++ = ( unsigned char )( usRegHoldingBuf[iRegIndex] & 0xFF );
                iRegIndex++;
                usNRegs--;
            }
            break;

            /* Update current register values with new values from the
             * protocol stack. */
        case MB_REG_WRITE:
            while( usNRegs > 0 )
            {
                usRegHoldingBuf[iRegIndex] = *pucRegBuffer++ << 8;
                usRegHoldingBuf[iRegIndex] |= *pucRegBuffer++;
                iRegIndex++;
                usNRegs--;
            }
        }
    }
    else
    {
        eStatus = MB_ENOREG;
    }
    return eStatus;
}


eMBErrorCode
eMBRegCoilsCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNCoils, eMBRegisterMode eMode )
{
    return MB_ENOREG;
}

eMBErrorCode
eMBRegDiscreteCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNDiscrete )
{
    return MB_ENOREG;
}



void TIM6_DAC_IRQHandler(void){
  if(TIM6->SR & TIM_SR_UIF){
    if(READ_BIT(GPIOE->IDR, GPIO_IDR_IDR_10) == 0){
      if(s1_cnt < DEBOUNCE_CNT_BTN){
        s1_cnt++;
        s1_state = 0;
      }else{
        s1_state = 1;
        s1_cnt = 0;
        EXTI->SWIER |= EXTI_SWIER_SWIER10;
      }
    }else{
      s1_state = 0;
      s1_cnt = 0;
    }

    if(READ_BIT(GPIOE->IDR, GPIO_IDR_IDR_11) == 0){
      if(s2_cnt < DEBOUNCE_CNT_BTN){
        s2_cnt++;
        s2_state = 0;
      }else{
        s2_state = 1;
        s2_cnt = 0;
        EXTI->SWIER |= EXTI_SWIER_SWIER11;
      }
    }else{
      s2_state = 0;
      s2_cnt = 0;
    }

    if(READ_BIT(GPIOE->IDR, GPIO_IDR_IDR_12) == 0){
      if(s3_cnt < DEBOUNCE_CNT_BTN){
        s3_cnt++;
        s3_state = 0;
      }else{
        s3_state = 1;
        s3_cnt = 0;
        EXTI->SWIER |= EXTI_SWIER_SWIER12;
      }
    }else{
      s3_state = 0;
      s3_cnt = 0;
    }
    tim2_ticks++;
    timer_elapsed++;
    NVIC_ClearPendingIRQ(TIM6_DAC_IRQn);

    TIM6->SR &= ~TIM_SR_UIF;
    RTC_get_time(&myCalendar.time_val);
//    printf("\r\nHello! The time is %u:%u:%u!",
//    		myCalendar.time_val.hour, myCalendar.time_val.minute, myCalendar.time_val.second);
  }
}

void timer_init(void){
  RCC->APB1ENR |= RCC_APB1ENR_TIM6EN;

  TIM6->CR1 &= ~TIM_CR1_CEN;
  //10 ms = 100Hz
  //1s = 1Hz
  TIM6->PSC = 1343;//7;
  TIM6->ARR = 62499;//59999;

  TIM6->DIER |= TIM_DIER_UIE;

  TIM6->CR1 |= TIM_CR1_CEN;
  NVIC_EnableIRQ(TIM6_DAC_IRQn);
}

void GPIOe_inp_init(void){
	//GPIOx(E) Input mode |0|0|
	GPIOE->MODER &= ~GPIO_MODER_MODER10;
	GPIOE->MODER &= ~GPIO_MODER_MODER11;
	GPIOE->MODER &= ~GPIO_MODER_MODER12;
}

void toggle_led(void) {
	if (CHECK_OUTPUT_E(LED_1))
		LED_13_ON;
	else
		LED_13_OFF;
}


void EXTI15_10_IRQHandler(void){

	RTC_update(&myCalendar);
	//S1 button
	if (s1_state) {
		switch (CHECK_OUTPUT_E(LED_1)) {
		case LED_1:
			LED_13_ON;
			break;
		case !LED_1:
			LED_13_OFF;
			break;
		default:
			LED_13_OFF;
			break;
		}
		s1_state = 0;
	}

	//S2 button
	if (s2_state) {
		switch (CHECK_OUTPUT_E(LED_2)) {
		case LED_2:
			LED_14_ON;
			break;
		default:
			LED_14_OFF;
			break;
		}
		s2_state = 0;
	}

	//S3 button
	if (s3_state) {
		switch (CHECK_OUTPUT_E(LED_3)) {
		case LED_3:
			LED_15_ON;
			break;
		case !LED_3:
			LED_15_OFF;
			break;
		default:
			LED_15_OFF;
			break;
		}
		s3_state = 0;
	}
	EXTI->PR |= EXTI_PR_PR10;
	EXTI->PR |= EXTI_PR_PR11;
	EXTI->PR |= EXTI_PR_PR12;
}


void IRQ_enable(void) {

	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
	SYSCFG->EXTICR[2] |= SYSCFG_EXTICR3_EXTI10_PE;
	SYSCFG->EXTICR[2] |= SYSCFG_EXTICR3_EXTI11_PE;
	SYSCFG->EXTICR[3] |= SYSCFG_EXTICR4_EXTI12_PE;

	__enable_irq();
//	Enb INTERRUPT! for gpio 10-12
	EXTI->IMR |= EXTI_IMR_MR10;
	EXTI->IMR |= EXTI_IMR_MR11;
	EXTI->IMR |= EXTI_IMR_MR12;
	//Enb INTERRUPT! for gpio 10-12
	EXTI->EMR |= EXTI_EMR_MR10;
	EXTI->EMR |= EXTI_EMR_MR11;
	EXTI->EMR |= EXTI_EMR_MR12;

	//Falling trigger
	EXTI->FTSR |= EXTI_FTSR_TR10;
	EXTI->FTSR |= EXTI_FTSR_TR11;
	EXTI->FTSR |= EXTI_FTSR_TR12;

	//
	EXTI->PR |= EXTI_PR_PR10;
	EXTI->PR |= EXTI_PR_PR11;
	EXTI->PR |= EXTI_PR_PR12;

//	Enb EXTI

	NVIC_EnableIRQ(EXTI15_10_IRQn);

}

/*Standby mode (Cortex®-M4 with FPU core stopped, peripherals kept running)*/
void enter_standby_mode(void){

	RCC->APB1ENR |= RCC_APB1ENR_PWREN;
	//[0] - slep; [1] - deep sleep <-
	SCB->SCR &= ~SCB_SCR_SLEEPDEEP_Msk;
	SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
	//Only event or interrup can wake up processor
	SCB->SCR &= ~SCB_SCR_SEVONPEND_Msk;
	//if my code is empty and programm work in interrupt
	SCB->SCR &= ~SCB_SCR_SLEEPONEXIT_Msk;
	//Clear the SBF Standby Flag (write).
	PWR->CR |= PWR_CR_CSBF;
	//Enter Standby mode when the CPU enters deepsleep.
	PWR->CR |= PWR_CR_PDDS;
	//Clear the WUF Wakeup Flag after 2 System clock cycles
	PWR->CR |= PWR_CR_CWUF;

//WKUP pin (PA0)
#if WKUP_PIN_ENB
	PWR->CSR |= PWR_CSR_EWUP;//only this??!
//	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
//	SYSCFG->EXTICR[0] |= SYSCFG_EXTICR1_EXTI0_PA;
//	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
//	//GPIOx(A) Input mode |0|0|
//	GPIOA->MODER &= ~GPIO_MODER_MODER0;
//	//	Enb INTERRUPT! for gpio 0
//	EXTI->IMR |= EXTI_IMR_MR22;
//	//Enb INTERRUPT! for gpio 0
//	EXTI->EMR |= EXTI_EMR_MR22;
//	//Falling trigger
//	EXTI->FTSR |= EXTI_FTSR_TR22;
//	EXTI->PR |= EXTI_PR_PR0;
#else
	PWR->CSR &= PWR_CSR_EWUP;
#endif

#if WAKE_UP_RTC
	//Enb RTC wake up in Standby mode
	RTC_SB_mode();
	RTC_unlock();
	CLEAR_BIT(RTC->CR, RTC_CR_WUTE);
	while(!(READ_BIT(RTC->ISR, RTC_ISR_WUTWF)));
	RTC->ISR &= ~RTC_ISR_WUTF;
	RTC->CR |= (RTC_CR_WUTIE | RTC_CR_WUTE);
	RTC_lock();
#endif
	__WFI();
}


/*Sleep mode (Cortex®-M4 with FPU core stopped, peripherals kept running)*/
void enter_sleep_mode(void){
	//Only event or interrup can wake up processor
	SCB->SCR &= ~SCB_SCR_SEVONPEND_Msk;
	//[0] - slep; [1] - deep sleep <-
	SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
	//
	SCB->SCR &= ~SCB_SCR_SLEEPONEXIT_Msk;
//	SCB->SCR = scr;
	PWR->CR |= (PWR_CR_CWUF | PWR_CR_FPDS | PWR_CR_LPDS);
}

void exit_sleep_mode(void){
}

/*Stop mode (all clocks are stopped)*/
void enter_stop_mode(void){
	LED_15_OFF;
	//Only event or interrup can wake up processor
	SCB->SCR &= ~SCB_SCR_SEVONPEND_Msk;
	//[0] - slep; [1] - deep sleep <-
	SCB->SCR &= ~SCB_SCR_SLEEPDEEP_Msk;
	SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
	//if my code is empty and programm work in interrupt
	SCB->SCR &= ~SCB_SCR_SLEEPONEXIT_Msk;

	PWR->CR |= (PWR_CR_CWUF | PWR_CR_LPDS);
	//Enter Standby mode when the CPU enters deepsleep.
	PWR->CR &= ~PWR_CR_PDDS;
//	PWR->CR &= ~PWR_CR_LPDS;
	//Not disbale flash
	PWR->CR &= ~PWR_CR_FPDS;

	LED_13_OFF;
	LED_14_OFF;
	LED_15_OFF;

	EXTI->PR |= EXTI_PR_PR10;
	EXTI->PR |= EXTI_PR_PR11;
	EXTI->PR |= EXTI_PR_PR12;
	NVIC_ClearPendingIRQ(EXTI15_10_IRQn);
    NVIC_ClearPendingIRQ(TIM6_DAC_IRQn);

#if WAKE_UP_RTC
	//Enb RTC wake up in Standby mode
	RTC_SB_mode();
	RTC_unlock();
	CLEAR_BIT(RTC->CR, RTC_CR_WUTE);
	while(!(READ_BIT(RTC->ISR, RTC_ISR_WUTWF)));
	RTC->ISR &= ~RTC_ISR_WUTF;
	RTC->CR |= (RTC_CR_WUTIE | RTC_CR_WUTE);
	RTC_lock();
#endif
	printf("Enter in Stop mode\r\n");
	__WFI();
}

void exit_stop_mode(void){

	SCB->SCR &= ~SCB_SCR_SLEEPDEEP_Msk;
	PWR->CR |= (PWR_CR_CWUF | PWR_CR_CSBF);
	system_clock_168m_25m_hse();
	GPIO_RCC_init();
    timer_init();
	LED_14_ON;
	printf("Exit from Stop mode\r\n");
}
/************************************************************************MAIN*/
int main(void) {
	int sleep = 0;
    system_clock_168m_25m_hse();
    GPIO_RCC_init();

    debug_usart_init();
    GPIOe_out_init();
    GPIOe_inp_init();
    IRQ_enable();
    timer_init();
    RTC_DateTime_init();

    if (((PWR->CSR)&(PWR_CSR_SBF))){

    	RTC_get_time(&myCalendar.time_val);
    	RTC_get_date(&myCalendar.date_val);
    	RTC_update(&myCalendar);
    	printf("Awake in %02u:%02u:%02u %02u.%02u.%02u!\r\n",
    			myCalendar.time_val.hour, myCalendar.time_val.minute, myCalendar.time_val.second,
				myCalendar.date_val.day, myCalendar.date_val.month, myCalendar.date_val.year);

    	//Clear the WUF Wake-up Flag after 2 System clock cycles
    	PWR->CR |= PWR_CR_CWUF;
    	//Clear the SBF Standby Flag (write).
    	PWR->CR |= PWR_CR_CSBF;
    	LED_14_ON;
    }

	while (1){
		LED_15_ON;
		if(timer_elapsed){
			toggle_led();
			timer_elapsed = 0;
		}
		if(tim2_ticks > 10){
			sleep = 1;
			tim2_ticks = 0;
		}
		if(sleep){
			enter_stop_mode();
			sleep = 0;
			exit_stop_mode();
		}
	}
}

/*************************** End of file ****************************/
