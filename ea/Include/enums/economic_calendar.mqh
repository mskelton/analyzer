typedef enum ENUM_CALENDAR_EVENT_FREQUENCY {
  /**
   * Release frequency is not set
   */
  CALENDAR_FREQUENCY_NONE,
  /**
   * Released once a week
   */
  CALENDAR_FREQUENCY_WEEK,
  /**
   * Released once a month
   */
  CALENDAR_FREQUENCY_MONTH,
  /**
   * Released once a quarter
   */
  CALENDAR_FREQUENCY_QUARTER,
  /**
   * Released once a year
   */
  CALENDAR_FREQUENCY_YEAR,
  /**
   * Released once a day
   */
  CALENDAR_FREQUENCY_DAY,
} ENUM_CALENDAR_EVENT_FREQUENCY;

typedef enum ENUM_CALENDAR_EVENT_TYPE {
  /**
   * Event (meeting, speech, etc.)
   */
  CALENDAR_TYPE_EVENT,
  /**
   * Indicator
   */
  CALENDAR_TYPE_INDICATOR,
  /**
   * Holiday
   */
  CALENDAR_TYPE_HOLIDAY,
} ENUM_CALENDAR_EVENT_TYPE;

typedef enum ENUM_CALENDAR_EVENT_SECTOR {
  /**
   * Sector is not set
   */
  CALENDAR_SECTOR_NONE,
  /**
   * Market, exchange
   */
  CALENDAR_SECTOR_MARKET,
  /**
   * Gross Domestic Product (GDP)
   */
  CALENDAR_SECTOR_GDP,
  /**
   * Labor market
   */
  CALENDAR_SECTOR_JOBS,
  /**
   * Prices
   */
  CALENDAR_SECTOR_PRICES,
  /**
   * Money
   */
  CALENDAR_SECTOR_MONEY,
  /**
   * Trading
   */
  CALENDAR_SECTOR_TRADE,
  /**
   * Government
   */
  CALENDAR_SECTOR_GOVERNMENT,
  /**
   * Business
   */
  CALENDAR_SECTOR_BUSINESS,
  /**
   * Consumption
   */
  CALENDAR_SECTOR_CONSUMER,
  /**
   * Housing
   */
  CALENDAR_SECTOR_HOUSING,
  /**
   * Taxes
   */
  CALENDAR_SECTOR_TAXES,
  /**
   * Holidays
   */
  CALENDAR_SECTOR_HOLIDAYS,
} ENUM_CALENDAR_EVENT_SECTOR;

typedef enum ENUM_CALENDAR_EVENT_IMPORTANCE {
  CALENDAR_IMPORTANCE_NONE,
  CALENDAR_IMPORTANCE_LOW,
  CALENDAR_IMPORTANCE_MODERATE,
  CALENDAR_IMPORTANCE_HIGH,
} ENUM_CALENDAR_EVENT_IMPORTANCE;

typedef enum ENUM_CALENDAR_EVENT_UNIT {
  /**
   * Measurement unit is not set
   */
  CALENDAR_UNIT_NONE,
  /**
   * Percentage
   */
  CALENDAR_UNIT_PERCENT,
  /**
   * National currency
   */
  CALENDAR_UNIT_CURRENCY,
  /**
   * Hours
   */
  CALENDAR_UNIT_HOUR,
  /**
   * Jobs
   */
  CALENDAR_UNIT_JOB,
  /**
   * Drilling rigs
   */
  CALENDAR_UNIT_RIG,
  /**
   * USD
   */
  CALENDAR_UNIT_USD,
  /**
   * People
   */
  CALENDAR_UNIT_PEOPLE,
  /**
   * Mortgage loans
   */
  CALENDAR_UNIT_MORTGAGE,
  /**
   * Votes
   */
  CALENDAR_UNIT_VOTE,
  /**
   * Barrels
   */
  CALENDAR_UNIT_BARREL,
  /**
   * Cubic feet
   */
  CALENDAR_UNIT_CUBICFEET,
  /**
   * Non-commercial net positions
   */
  CALENDAR_UNIT_POSITION,
  /**
   * Buildings
   */
  CALENDAR_UNIT_BUILDING,
} ENUM_CALENDAR_EVENT_UNIT;

typedef enum ENUM_CALENDAR_EVENT_MULTIPLIER {
  CALENDAR_MULTIPLIER_NONE,
  CALENDAR_MULTIPLIER_THOUSANDS,
  CALENDAR_MULTIPLIER_MILLIONS,
  CALENDAR_MULTIPLIER_BILLIONS,
  CALENDAR_MULTIPLIER_TRILLIONS,
} ENUM_CALENDAR_EVENT_MULTIPLIER;

typedef enum ENUM_CALENDAR_EVENT_IMPACT {
  CALENDAR_IMPACT_NA,
  CALENDAR_IMPACT_POSITIVE,
  CALENDAR_IMPACT_NEGATIVE,
} ENUM_CALENDAR_EVENT_IMPACT;

typedef enum ENUM_CALENDAR_EVENT_TIMEMODE {
  /**
   * Source publishes an exact time of an event
   */
  CALENDAR_TIMEMODE_DATETIME,
  /**
   * Event takes all day
   */
  CALENDAR_TIMEMODE_DATE,
  /**
   * Source publishes no time of an event
   */
  CALENDAR_TIMEMODE_NOTIME,
  /**
   * Source publishes a day of an event rather than its exact time. The time is
   * specified upon the occurrence of the event.
   */
  CALENDAR_TIMEMODE_TENTATIVE,
} ENUM_CALENDAR_EVENT_TIMEMODE;
