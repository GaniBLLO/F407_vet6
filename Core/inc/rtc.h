
/* Usage:
  - Call RTC_init() first before attempting to work with RTC.
  - If need to setup date/time make instance of rtcCalendar and init it with suitable data, then call
  RTC_update(&myCalendar).
*/

#ifndef INC_RTC_H_
#define INC_RTC_H_

#include "stdint.h"
#include "stm32f4xx.h"

#define WFI() asm volatile ("wfi");
#define WFE() asm volatile ("wfe");

typedef struct {
  uint8_t hour;
  uint8_t minute;
  uint8_t second;
} rtcTime;

typedef struct {
  uint8_t day;
  uint8_t month;
  uint8_t year;
} rtcDate;

typedef struct {
  rtcTime time_val;
  rtcDate date_val;
  uint8_t time_format_12h;
  uint8_t weekday;
} rtcCalendar;

extern rtcCalendar myCalendar;

void RTC_init(void);
void RTC_update(rtcCalendar* calendar);
void RTC_get_time(rtcTime * val);
void RTC_get_date(rtcDate* val);

#endif
