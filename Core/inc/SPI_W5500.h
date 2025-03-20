/*
 * SPI.h
 *
 *  Created on: 12 мар. 2025 г.
 *      Author: ganibllo
 */

#ifndef INC_SPI_W5500_H_
#define INC_SPI_W5500_H_

#include "w5500.h"

#define CS_LOW  GPIOE->BSRR |= GPIO_BSRR_BR7;
#define CS_HIGH GPIOE->BSRR |= GPIO_BSRR_BS7;

#define RST_OFF  GPIOE->BSRR |= GPIO_BSRR_BR9;
#define RST_ON	 GPIOE->BSRR |= GPIO_BSRR_BS9;

#endif /* INC_SPI_W5500_H_ */
