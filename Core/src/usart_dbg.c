#include "stm32f4xx.h"

void usart1_init(void) {
  /* Using USART1 on PA9, PA10, tx only in polling mode (no interrupts) */

  /* Enable PORT E clock */
  SET_BIT(RCC->AHB1ENR, RCC_AHB1ENR_GPIOAEN);
  // TX - PD8, AF7
  SET_BIT(GPIOA->MODER, GPIO_MODER_MODE9_1);
  SET_BIT(GPIOA->AFR[1], GPIO_AFRH_AFSEL9_0 | GPIO_AFRH_AFSEL9_1 | GPIO_AFRH_AFSEL9_2);
  // RX - PD9, AF7
  SET_BIT(GPIOA->MODER, GPIO_MODER_MODE10_1);
  SET_BIT(GPIOA->AFR[1], GPIO_AFRH_AFSEL10_0 | GPIO_AFRH_AFSEL10_1 | GPIO_AFRH_AFSEL10_2);

  // Init USART1 module
  SET_BIT(RCC->APB2ENR, RCC_APB2ENR_USART1EN);
  /*TX/RX_baundrate = (84MHz / 16)/115200 = 45.57; 45 = 0x2D; 57 = 0x9*/
  USART1->BRR = 0x2D9;

  // Tx enable
  SET_BIT(USART1->CR1, USART_CR1_TE);
  // 8 bit, no parity, 1 stop
  CLEAR_BIT(USART1->CR1, USART_CR1_M | USART_CR1_PCE);
  CLEAR_BIT(USART1->CR2, USART_CR2_STOP_0 | USART_CR2_STOP_0);
  // enable USART
  
  SET_BIT(USART1->CR1, USART_CR1_UE);
}


void USARTx_send_data(char *buffer){
  
  while(*buffer){
    USART1->DR = (*buffer++ &(uint16_t)0x01FF);
    while(!READ_BIT(USART1->SR, USART_SR_TC));
  }
}
