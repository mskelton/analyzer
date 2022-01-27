typedef enum ENUM_APPLIED_PRICE {
  /**
   * Close price
   */
  PRICE_CLOSE,
  /**
   * Open price
   */
  PRICE_OPEN,
  /**
   * The maximum price for the period
   */
  PRICE_HIGH,
  /**
   * The minimum price for the period
   */
  PRICE_LOW,
  /**
   * Median price, (high + low)/2
   */
  PRICE_MEDIAN,
  /**
   * Typical price, (high + low + close)/3
   */
  PRICE_TYPICAL,
  /**
   * Average price, (high + low + close + close)/4
   */
  PRICE_WEIGHTED,
} ENUM_APPLIED_PRICE;

typedef enum ENUM_APPLIED_VOLUME {
  /**
   * Tick volume
   */
  VOLUME_TICK,
  /**
   * Trade volume
   */
  VOLUME_REAL,
} ENUM_APPLIED_VOLUME;

typedef enum ENUM_STO_PRICE {
  /**
   * Calculation is based on Low/High prices
   */
  STO_LOWHIGH,
  /**
   * Calculation is based on Close/Close prices
   */
  STO_CLOSECLOSE,
} ENUM_STO_PRICE;
