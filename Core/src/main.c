/*
 * main.c
 *
 *  Created on: Mar 11, 2025
 *      Author: ganibllo
 */

#include "main.h"
#include "dp83848.h"

/************************************************************************Defines*/
#define LED_15_ON  GPIOE->BSRR |= GPIO_BSRR_BR15
#define LED_15_OFF GPIOE->BSRR |= GPIO_BSRR_BS15
#define DEBOUNCE_CNT_BTN  7

SemaphoreHandle_t my_sem;
/************************************************************************VARs*****/
TaskHandle_t xTask1Handle = NULL;
eTaskState TaskState1;

uint8_t s1_state = 0;
uint32_t s1_cnt = 0;

wiz_NetInfo my_struct_w5500 = { .mac = {0x00, 0x08, 0xdc,0x00, 0xab, 0xcd}, //<-mac should be unique.
                            .ip = {192, 168, 1, 123},
                            .sn = {255,255,255,0},
                            .gw = {192, 168, 1, 1},
                            .dns = {0,0,0,0},
                            .dhcp = NETINFO_STATIC };
/************************************************************************Functions*/
void system_clock_168m_25m_hse(void);
void SPI_init(void);
void wizchip_sw_reset(void);
void w5500_init(void);
int8_t wizchip_init(uint8_t* txsize, uint8_t* rxsize);

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
	xTaskCreate(vTask1, "Task1", configMINIMAL_STACK_SIZE, NULL, 2, &xTask1Handle);
	vTaskDelay(1000);
	vTaskDelete(xTask1Handle);
	while(1){
		vTaskDelay(1000);
		USARTx_send_data("vTaskCheckCable\r\n");
	}
	vTaskDelete(NULL);
}


/************************************************************************MAIN*/
int main(void) {

    system_clock_168m_25m_hse();
    GPIO_RCC_init();
    setbuf(stdout, NULL);
    SPI_init();
    usart1_init();
    w5500_init();

    my_sem = xSemaphoreCreateMutex();
    xTaskCreate(vTaskCheckCable, "vTaskCheckCable", configMINIMAL_STACK_SIZE, NULL, 3, NULL);

	vTaskStartScheduler();
	while (1);
}

/*************************** End of file ****************************/
