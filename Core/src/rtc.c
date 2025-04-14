#include "rtc.h"

rtcCalendar myCalendar;
/* Initialization of RTC for LSE = 32.768 kHz */
void RTC_init(void) {
  /* Enable PWR module clocking */
  SET_BIT(RCC->APB1ENR, RCC_APB1ENR_PWREN);
  /* Disable backup domain write protection */
  SET_BIT(PWR->CR, PWR_CR_DBP);

  /* Enable LSE */
  SET_BIT(RCC->BDCR, RCC_BDCR_LSEON);
  while (!(RCC->BDCR & RCC_BDCR_LSERDY)) {
  };

  /* Select RTC clocking to LSE: RTCSEL = 01*/
  SET_BIT(RCC->BDCR, RCC_BDCR_RTCSEL_0);
  /* Enable RTC */
  SET_BIT(RCC->BDCR, RCC_BDCR_RTCEN);

  /* Enable backup domain write protection */
  CLEAR_BIT(PWR->CR, PWR_CR_DBP);

  /* Check if calendar is not initialized */
  if (READ_BIT(RTC->ISR, RTC_ISR_INITS) != RTC_ISR_INITS) {
    /* Init RTC calendar */

    myCalendar.date_val.day   = 13;
    myCalendar.date_val.month = 04;
    myCalendar.date_val.year  = 25;
    myCalendar.weekday        = 2;

    myCalendar.time_val.hour   = 21;
    myCalendar.time_val.minute = 30;
    myCalendar.time_val.second = 0;
    myCalendar.time_format_12h = 0;

    RTC_update(&myCalendar);
  }
}

void RTC_update(rtcCalendar* calendar) {
  /* Disable backup domain write protection */
  SET_BIT(PWR->CR, PWR_CR_DBP);

  /* Disable write protection */
  WRITE_REG(RTC->WPR, 0xCA);
  WRITE_REG(RTC->WPR, 0x53);

  /* Enter edit mode */
  SET_BIT(RTC->ISR, RTC_ISR_INIT);
  while (!(RTC->ISR & RTC_ISR_INITF)) {
  };

  /* Setup time */
  uint32_t hour, minute, second, hour_format;
  hour = (((calendar->time_val.hour / 10) << RTC_TR_HT_Pos) & RTC_TR_HT_Msk) |
      (((calendar->time_val.hour % 10) << RTC_TR_HU_Pos) & RTC_TR_HU_Msk);
  minute = (((calendar->time_val.minute / 10) << RTC_TR_MNT_Pos) & RTC_TR_MNT_Msk) |
      (((calendar->time_val.minute % 10) << RTC_TR_MNU_Pos) & RTC_TR_MNU_Msk);
  second = (((calendar->time_val.second / 10) << RTC_TR_ST_Pos) & RTC_TR_ST_Msk) |
      (((calendar->time_val.second % 10) << RTC_TR_SU_Pos) & RTC_TR_SU_Msk);
  hour_format = (calendar->time_format_12h << RTC_TR_PM_Pos) & RTC_TR_PM_Msk;
  WRITE_REG(RTC->TR, (hour | minute | second | hour_format));

  /* Setup date */
  uint32_t year, month, day, weekday;
  year = (((calendar->date_val.year / 10) << RTC_DR_YT_Pos) & RTC_DR_YT_Msk) |
      (((calendar->date_val.year % 10) << RTC_DR_YU_Pos) & RTC_DR_YU_Msk);
  month = (((calendar->date_val.month / 10) << RTC_DR_MT_Pos) & RTC_DR_MT_Msk) |
      (((calendar->date_val.month % 10) << RTC_DR_MU_Pos) & RTC_DR_MU_Msk);
  day = (((calendar->date_val.day / 10) << RTC_DR_DT_Pos) & RTC_DR_DT_Msk) |
      (((calendar->date_val.day % 10) << RTC_DR_DU_Pos) & RTC_DR_DU_Msk);
  weekday = (calendar->weekday << RTC_DR_WDU_Pos) & RTC_DR_WDU_Msk;
  WRITE_REG(RTC->DR, (year | month | day | weekday));

  /* Exit edit mode */
  CLEAR_BIT(RTC->ISR, RTC_ISR_INIT);
  /* Disable write protection */
  WRITE_REG(RTC->WPR, 0xFF);

  /* Enable backup domain write protection */
  CLEAR_BIT(PWR->CR, PWR_CR_DBP);
}

void RTC_get_time(rtcTime* val) {
  /* Wait for sync*/
  while (!(RTC->ISR & RTC_ISR_RSF)) {
  };

  uint32_t time_reg = READ_REG(RTC->TR);
  val->hour = (((time_reg & RTC_TR_HT_Msk) >> RTC_TR_HT_Pos) * 10) + ((time_reg & RTC_TR_HU_Msk) >> RTC_TR_HU_Pos);
  val->minute =
      (((time_reg & RTC_TR_MNT_Msk) >> RTC_TR_MNT_Pos) * 10) + ((time_reg & RTC_TR_MNU_Msk) >> RTC_TR_MNU_Pos);
  val->second = (((time_reg & RTC_TR_ST_Msk) >> RTC_TR_ST_Pos) * 10) + ((time_reg & RTC_TR_SU_Msk) >> RTC_TR_SU_Pos);
}

void RTC_get_date(rtcDate* val) {
  /* Wait for sync*/
  while (!(RTC->ISR & RTC_ISR_RSF)) {
  };

  uint32_t date_reg = READ_REG(RTC->DR);
  val->year = (((date_reg & RTC_DR_YT_Msk) >> RTC_DR_YT_Pos) * 10) + ((date_reg & RTC_DR_YU_Msk) >> RTC_DR_YU_Pos);
  val->month =
      (((date_reg & RTC_DR_MT_Msk) >> RTC_DR_MT_Pos) * 10) + ((date_reg & RTC_DR_MU_Msk) >> RTC_DR_MU_Pos);
  val->day = (((date_reg & RTC_DR_DT_Msk) >> RTC_DR_DT_Pos) * 10) + ((date_reg & RTC_DR_DU_Msk) >> RTC_DR_DU_Pos);
}
