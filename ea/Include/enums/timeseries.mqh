typedef enum ENUM_SERIES_INFO_INTEGER {
  /**
   * Bars count for the symbol-period for the current moment
   */
  SERIES_BARS_COUNT,
  /**
   * The very first date for the symbol-period for the current moment
   */
  SERIES_FIRSTDATE,
  /**
   * Open time of the last bar of the symbol-period
   */
  SERIES_LASTBAR_DATE,
  /**
   * The very first date in the history of the symbol on the server regardless
   * of the timeframe
   */
  SERIES_SERVER_FIRSTDATE,
  /**
   * The very first date in the history of the symbol in the client terminal,
   * regardless of the timeframe
   */
  SERIES_TERMINAL_FIRSTDATE,
  /**
   * Symbol/period data synchronization flag for the current moment
   */
  SERIES_SYNCHRONIZED,
} ENUM_SERIES_INFO_INTEGER;

typedef enum ENUM_TIMEFRAMES {
  PERIOD_CURRENT,
  PERIOD_M1,
  PERIOD_M2,
  PERIOD_M3,
  PERIOD_M4,
  PERIOD_M5,
  PERIOD_M6,
  PERIOD_M10,
  PERIOD_M12,
  PERIOD_M15,
  PERIOD_M20,
  PERIOD_M30,
  PERIOD_H1,
  PERIOD_H2,
  PERIOD_H3,
  PERIOD_H4,
  PERIOD_H6,
  PERIOD_H8,
  PERIOD_H12,
  PERIOD_D1,
  PERIOD_W1,
  PERIOD_MN1
} ENUM_TIMEFRAMES;

typedef enum ENUM_SERIESMODE {
  /**
   * Opening price
   */
  MODE_OPEN,
  /**
   * Low price
   */
  MODE_LOW,
  /**
   * High price
   */
  MODE_HIGH,
  /**
   * Close price
   */
  MODE_CLOSE,
  /**
   * Tick volume
   */
  MODE_VOLUME,
  /**
   * Real volume
   */
  MODE_REAL_VOLUME,
  /**
   * Spread
   */
  MODE_SPREAD
} ENUM_SERIESMODE;
