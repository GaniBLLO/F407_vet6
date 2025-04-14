/*
 * FreeModbus Libary: BARE Port
 * Copyright (C) 2006 Christian Walter <wolti@sil.at>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * File: $Id$
 */

#include "port.h"

/* ----------------------- Modbus includes ----------------------------------*/
#include "mb.h"
#include "mbport.h"
//#include "stm32f1xx_hal.h"
#include "stm32f4xx.h"
#include "mt_port.h"
#include "usart_dbg.h"

/* ----------------------- Static functions ---------------------------------*/
static void prvvUARTTxReadyISR( void );
static void prvvUARTRxISR( void );



/* ----------------------- Variables ----------------------------------------*/
//extern UART_HandleTypeDef* modbusUart;

uint8_t txByte = 0x00;
uint8_t rxByte = 0x00;

/* ----------------------- Start implementation -----------------------------*/

/*----------------------------------------------------------------------------*/
void vMBPortSerialEnable(BOOL xRxEnable, BOOL xTxEnable)
{
	/* If xRXEnable enable serial receive interrupts. If xTxENable enable
	 * transmitter empty interrupts.
	 */

	if (!xRxEnable) {
		ATOMIC_CLEAR_BIT(USART2->CR1 ,(USART_CR1_RXNEIE | USART_CR1_PEIE));
		ATOMIC_CLEAR_BIT(USART2->CR3, USART_CR3_EIE);
//		NVIC_DisableIRQ(USART1_IRQn);
		DE_ON;
	} else {
		USART2->CR1 |= USART_CR1_RE;
		USART2->CR1 |= USART_CR1_RXNEIE;

		NVIC_SetPriority(USART1_IRQn, 10);
//		NVIC_EnableIRQ(USART1_IRQn);
		DE_OFF;
	}

	if (!xTxEnable) {
		ATOMIC_CLEAR_BIT(USART2->CR1 ,(USART_CR1_TXEIE | USART_CR1_PEIE));
		ATOMIC_CLEAR_BIT(USART2->CR3, USART_CR3_EIE);
//		NVIC_DisableIRQ(USART1_IRQn);
//		HAL_UART_AbortTransmit_IT(modbusUart);
	} else {
		USART2->CR1 |= USART_CR1_TE;
		USART2->CR1 |= USART_CR1_TXEIE;
//		if (READ_BIT(USART2->SR, USART_SR_TC))
			prvvUARTTxReadyISR();
//		}
	}
}



/* --------------------------------------------------------------------------*/
BOOL xMBPortSerialInit(UCHAR ucPORT, ULONG ulBaudRate, UCHAR ucDataBits, eMBParity eParity)
{
    return TRUE;//FALSE?
}



/* --------------------------------------------------------------------------*/
BOOL xMBPortSerialPutByte(CHAR ucByte) {
	/* Put a byte in the UARTs transmit buffer. This function is called
	 * by the protocol stack if pxMBFrameCBTransmitterEmpty( ) has been
	 * called. */
	LED_13_ON;
	USARTx_send_data(&ucByte);
	LED_13_OFF;
//  txByte = ucByte;
//  HAL_UART_Transmit_IT(modbusUart, &txByte, 1);
	return TRUE;
}



/* --------------------------------------------------------------------------*/
BOOL xMBPortSerialGetByte(CHAR *pucByte) {
	/* Return the byte in the UARTs receive buffer. This function is called
	 * by the protocol stack after pxMBFrameCBByteReceived( ) has been called.
	 */
	//Получаем данные с регистра и вносим их в переменную
	uint16_t data = 0;
	data = (uint16_t) (USART1->DR & (uint16_t) 0x01FF);
	return (data ? TRUE : FALSE);
//  HAL_UART_Receive_IT(modbusUart, &rxByte, 1);
//	return TRUE;
}


/* Create an interrupt handler for the transmit buffer empty interrupt
 * (or an equivalent) for your target processor. This function should then
 * call pxMBFrameCBTransmitterEmpty( ) which tells the protocol stack that
 * a new character can be sent. The protocol stack will then call
 * xMBPortSerialPutByte( ) to send the character.
 */
/* --------------------------------------------------------------------------*/
static void prvvUARTTxReadyISR(void)
{
  pxMBFrameCBTransmitterEmpty();
}


/* Create an interrupt handler for the receive interrupt for your target
 * processor. This function should then call pxMBFrameCBByteReceived( ). The
 * protocol stack will then call xMBPortSerialGetByte( ) to retrieve the
 * character.
 */
/* --------------------------------------------------------------------------*/
static void prvvUARTRxISR(void)
{
  pxMBFrameCBByteReceived();
}





/* --------------------------------------------------------------------------*/
void USART1_IRQHandler(void) {

	if (READ_BIT(USART2->SR, USART_SR_RXNE))
		prvvUARTRxISR();
	else
		prvvUARTTxReadyISR();

	//"Сброс" прерывания
	NVIC_ClearPendingIRQ(USART1_IRQn);
}

/* --------------------------------------------------------------------------*/
