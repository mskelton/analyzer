#include "Include/enums/economic_calendar.mqh"
#include "Include/types/data_types.mqh"

struct MqlCalendarCountry {
  /**
   * Country ID (ISO 3166-1)
   */
  ulong id;
  /**
   * Country text name (in the current terminal encoding)
   */
  string name;
  /**
   * Country code name (ISO 3166-1 alpha-2)
   */
  string code;
  /**
   * Country currency code
   */
  string currency;
  /**
   * Country currency symbol
   */
  string currency_symbol;
  /**
   * Country name used in the mql5.com website URL
   */
  string url_name;
};

struct MqlCalendarEvent {
  /**
   * Event ID
   */
  ulong id;
  /**
   * Event type from the ENUM_CALENDAR_EVENT_TYPE enumeration
   */
  ENUM_CALENDAR_EVENT_TYPE type;
  /**
   * Sector an event is related to
   */
  ENUM_CALENDAR_EVENT_SECTOR sector;
  /**
   * Event frequency
   */
  ENUM_CALENDAR_EVENT_FREQUENCY frequency;
  /**
   * Event time mode
   */
  ENUM_CALENDAR_EVENT_TIMEMODE time_mode;
  /**
   * Country ID
   */
  ulong country_id;
  /**
   * Economic indicator value's unit of measure
   */
  ENUM_CALENDAR_EVENT_UNIT unit;
  /**
   * Event importance
   */
  ENUM_CALENDAR_EVENT_IMPORTANCE importance;
  /**
   * Economic indicator value multiplier
   */
  ENUM_CALENDAR_EVENT_MULTIPLIER multiplier;
  /**
   * Number of decimal places
   */
  uint digits;
  /**
   * URL of a source where an event is published
   */
  string source_url;
  /**
   * Event code
   */
  string event_code;
  /**
   * Event text name in the terminal language (in the current terminal encoding)
   */
  string name;
};

struct MqlCalendarValue {
  /**
   * Value ID
   */
  ulong id;
  /**
   * Event ID
   */
  ulong event_id;
  /**
   * Event time and date
   */
  datetime time;
  /**
   * Event report period
   */
  datetime period;
  /**
   * Released indicator's revision in relation to a report period
   */
  int revision;
  /**
   * Indicator's actual value
   */
  long actual_value;
  /**
   * Indicator's previous value
   */
  long prev_value;
  /**
   * Indicator's revised previous value
   */
  long revised_prev_value;
  /**
   * Indicator's forecast value
   */
  long forecast_value;
  /**
   * Potential impact on an exchange rate
   */
  ENUM_CALENDAR_EVENT_IMPACT impact_type;
};
