/**
  ******************************************************************************
  * @file           : mt_port.c
  * @brief          : Additional porting data
  * @author         : MicroTechnics (microtechnics.ru)
  ******************************************************************************
  */



/* Includes ------------------------------------------------------------------*/

#include "mt_port.h"
#include "FreeRTOS.h"
#include "task.h"
#include "stm32f4xx.h"

/* Declarations and definitions ----------------------------------------------*/


//static uint32_t lockCounter = 0;
//
//UART_HandleTypeDef* modbusUart;
//TIM_HandleTypeDef* modbusTimer;



/* Functions -----------------------------------------------------------------*/
void GPIOe_out_init(void){

  /*Тактирование порта на шине AHB1 */
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOEEN;

  //GPIOx(E)
  /*01 = Genral output mode*/
  GPIOE->MODER |= GPIO_MODER_MODE13_0;
  GPIOE->MODER |= GPIO_MODER_MODE14_0;
  GPIOE->MODER |= GPIO_MODER_MODE15_0;
  //Disable all LEDs
  LED_13_OFF;
  LED_14_OFF;
  LED_15_OFF;

}

/*----------------------------------------------------------------------------*/
void EnterCriticalSection()
{
	void taskENTER_CRITCAL(void);
	NVIC_DisableIRQ(USART2_IRQn);
//  lockCounter++;
}



/*----------------------------------------------------------------------------*/
void ExitCriticalSection()
{
//  lockCounter--;
	void taskEXIT_CRITCAL(void);
//  if (lockCounter == 0)
//  {
	NVIC_EnableIRQ(USART2_IRQn);
//  }
}



/*----------------------------------------------------------------------------*/
//void MT_PORT_SetTimerModule(TIM_HandleTypeDef* timer)
//{
//  modbusTimer = timer;
//}
//
//
//
///*----------------------------------------------------------------------------*/\
//void MT_PORT_SetUartModule(UART_HandleTypeDef* uart)
//{
//  modbusUart = uart;
//}



/*----------------------------------------------------------------------------*/
