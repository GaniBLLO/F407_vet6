#include "stm32f4xx.h"
#include "SPI_W5500.h"


void init_spi_gpio(void){
  
  /*PC3 - MOSI
  Alternative func. = AF7(0111)
  Pull-down*/
  GPIOC->MODER &= ~GPIO_MODER_MODER3;
  GPIOC->MODER |= GPIO_MODER_MODER3_1;
  GPIOC->PUPDR |= GPIO_PUPDR_PUPD3_1;
  GPIOC->AFR[0] |= (0x5 << GPIO_AFRL_AFSEL3_Pos);

  /*PC2 - MISO
  Alternative func. = AF7(0111)
  Pull-down*/
  GPIOC->MODER &= ~GPIO_MODER_MODER2;
  GPIOC->MODER |= GPIO_MODER_MODER2_1;
  GPIOC->PUPDR |= GPIO_PUPDR_PUPD2_1;
  GPIOC->AFR[0] |= (0x5 << GPIO_AFRL_AFSEL2_Pos);

  /*PB10 - SCK
  Alternative func. = AF7(0111)
  Pull-down*/
  GPIOB->MODER &= ~GPIO_MODER_MODER10;
  GPIOB->MODER |= GPIO_MODER_MODER10_1;
  GPIOB->PUPDR |= GPIO_PUPDR_PUPD10_1;
  GPIOB->AFR[1] |= (0x5 << GPIO_AFRH_AFSEL10_Pos);

  /*PE7 - CS
  Output mode
  Push-pull
  Pull-down*/
  GPIOE->MODER |= GPIO_MODER_MODE7_0;
  GPIOE->OTYPER &= ~GPIO_OTYPER_OT7;
  GPIOE->PUPDR |= GPIO_PUPDR_PUPD7_1;
  CS_HIGH;

  /*PE9 - RST
    Output mode
    Push-pull
    Pull-down*/
  GPIOE->MODER |= GPIO_MODER_MODE9_0;
  GPIOE->OTYPER &= ~GPIO_OTYPER_OT9;
  GPIOE->PUPDR |= GPIO_PUPDR_PUPD9_1;
  RST_ON;
}

//MASTER_SPI2
void SPI_init(void){
  
  init_spi_gpio();

  //tick SPI bus & GPIOa
  RCC->APB1ENR |= RCC_APB1ENR_SPI2EN;
  
  //APB1 = 42Mhz => /2 = 21Mhz
  SPI2->CR1 &= ~SPI_CR1_BR;
  SPI2->CR1 |= SPI_CR1_BR_0;
  
  //Second front signal detect
  //SPI2->CR1 |= SPI_CR1_CPHA;
  //SPI2->CR1 |= SPI_CR1_CPOL;
  //Master
  SPI2->CR1 |= SPI_CR1_MSTR;
  //Frame 8 bit
  SPI2->CR1 &= ~SPI_CR1_DFF;
  //Internal CS otput
  SPI2->CR1 |= SPI_CR1_SSM;
  SPI2->CR1 |= SPI_CR1_SSI;

  SPI2->CR1 |= SPI_CR1_SPE;
}


uint8_t SPI_Tx(uint8_t data){

  SPI2->DR = data;
  while((SPI2->SR & SPI_SR_TXE) == 0);
  while((SPI2->SR & SPI_SR_RXNE) == 0);

  return SPI2->DR;
}

void w5500_ChipSelect(void){
	CS_LOW;
}
void w5500_ChipDwSelect(void){
	CS_HIGH;
}

void w5500_SPI_Tx(uint8_t data){
  SPI_Tx(data);
}

uint8_t w5500_SPI_Rx(void){
  return SPI_Tx(0x0);
}


void wizchip_read_burst(uint8_t* buff, uint16_t len)
{
	for (int i = 0; i < len; i++)
	{
		buff[i] = w5500_SPI_Rx();
	}

}

void wizchip_write_burst(uint8_t* data, uint16_t len)
{
	for (int i = 0; i < len; i++)
	{
		w5500_SPI_Tx(data[i]);
	}
}

void w5500_init(void){
	/*the available size of w5500 is 32KB
	  w5500 supports 8 independents sockets simultaneously
	  here 2KB is allocated for
	  each of the transmit and receive buffer of each socket*/
	uint8_t memory_for_each_socket[2][8] = {
		{2, 2, 2, 2, 2, 2, 2, 2},		// receive buffer size
		{2, 2, 2, 2, 2, 2, 2, 2}		// transmit buffer size
	};
	RST_OFF;
	uint8_t temptime = 0xff;
	while(--temptime);
	RST_ON;

	reg_wizchip_cs_cbfunc(w5500_ChipSelect, w5500_ChipDwSelect);
	reg_wizchip_spi_cbfunc(w5500_SPI_Rx, w5500_SPI_Tx);
	reg_wizchip_spiburst_cbfunc(wizchip_read_burst, wizchip_write_burst);

	if (ctlwizchip(CW_INIT_WIZCHIP, (void*)memory_for_each_socket) == -1){
		while(1);
	}

}
