/**
  ******************************************************************************
  * @file           : mt_port.h
  * @brief          : Additional porting data
  * @author         : MicroTechnics (microtechnics.ru)
  ******************************************************************************
  */

#ifndef MT_PORT_H
#define MT_PORT_H



/* Includes ------------------------------------------------------------------*/

//#include "stm32f1xx_hal.h"
#include "mt_port.h"


/* Declarations and definitions ----------------------------------------------*/

#define DE_ON  GPIOD->BSRR |= GPIO_BSRR_BR7
#define DE_OFF GPIOD->BSRR |= GPIO_BSRR_BS7


#define LED_13_ON  GPIOE->BSRR |= GPIO_BSRR_BR13
#define LED_13_OFF GPIOE->BSRR |= GPIO_BSRR_BS13

#define LED_14_ON  GPIOE->BSRR |= GPIO_BSRR_BR14
#define LED_14_OFF GPIOE->BSRR |= GPIO_BSRR_BS14

#define LED_15_ON  GPIOE->BSRR |= GPIO_BSRR_BR15
#define LED_15_OFF GPIOE->BSRR |= GPIO_BSRR_BS15

/* Functions -----------------------------------------------------------------*/

//extern void MT_PORT_SetTimerModule(TIM_HandleTypeDef* timer);
//extern void MT_PORT_SetUartModule(UART_HandleTypeDef* uart);



#endif // #ifndef MT_PORT_H
