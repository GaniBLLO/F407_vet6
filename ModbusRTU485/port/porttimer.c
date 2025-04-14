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

/* ----------------------- Platform includes --------------------------------*/
#include "port.h"



/* ----------------------- Modbus includes ----------------------------------*/
#include "mb.h"
#include "mbport.h"
#include "FreeRTOS.h"
#include "timers.h"

//#include "stm32f1xx_hal.h"



/* ----------------------- Static functions ---------------------------------*/
static void prvvTIMERExpiredISR( void );
void vTimer50RTU( TimerHandle_t xTimer );

xTimerHandle myTimer;


/* ----------------------- Variables ----------------------------------------*/
//extern TIM_HandleTypeDef* modbusTimer;

uint32_t timerPeriod = 0;


/* ----------------------- Start implementation -----------------------------*/

/*----------------------------------------------------------------------------*/
BOOL xMBPortTimersInit(USHORT usTim1Timerout50us)
{
  timerPeriod = usTim1Timerout50us;
  return TRUE;//FALSE?
}

/* --------------------------------------------------------------------------*/
inline void vMBPortTimersEnable()
{
	  /* Enable the timer with the timeout passed to xMBPortTimersInit( ) */
//  timerCounter = 0;
//  HAL_TIM_Base_Start_IT(modbusTimer);
	myTimer = xTimerCreate("RstTimer", pdMS_TO_TICKS(timerPeriod), pdFALSE,(void*)0, vTimer50RTU);
}



/* --------------------------------------------------------------------------*/
inline void vMBPortTimersDisable()
{
	/* Disable any pending timers. */
	xTimerDelete(myTimer, 10);
//  HAL_TIM_Base_Stop_IT(modbusTimer);
}


/* Create an ISR which is called whenever the timer has expired. This function
 * must then call pxMBPortCBTimerExpired( ) to notify the protocol stack that
 * the timer has expired.
 */
/* --------------------------------------------------------------------------*/
static void prvvTIMERExpiredISR(void)
{
    (void)pxMBPortCBTimerExpired();
}


void vTimer50RTU( TimerHandle_t xTimer ){
	prvvTIMERExpiredISR();
}
/* --------------------------------------------------------------------------*/
