typedef enum ENUM_INDICATOR {
  /**
   * Accelerator Oscillator
   */
  IND_AC,
  /**
   * Accumulation/Distribution
   */
  IND_AD,
  /**
   * Average Directional Index
   */
  IND_ADX,
  /**
   * ADX by Welles Wilder
   */
  IND_ADXW,
  /**
   * Alligator
   */
  IND_ALLIGATOR,
  /**
   * Adaptive Moving Average
   */
  IND_AMA,
  /**
   * Awesome Oscillator
   */
  IND_AO,
  /**
   * Average True Range
   */
  IND_ATR,
  /**
   * Bollinger Bands®
   */
  IND_BANDS,
  /**
   * Bears Power
   */
  IND_BEARS,
  /**
   * Bulls Power
   */
  IND_BULLS,
  /**
   * Market Facilitation Index
   */
  IND_BWMFI,
  /**
   * Commodity Channel Index
   */
  IND_CCI,
  /**
   * Chaikin Oscillator
   */
  IND_CHAIKIN,
  /**
   * Custom indicator
   */
  IND_CUSTOM,
  /**
   * Double Exponential Moving Average
   */
  IND_DEMA,
  /**
   * DeMarker
   */
  IND_DEMARKER,
  /**
   * Envelopes
   */
  IND_ENVELOPES,
  /**
   * Force Index
   */
  IND_FORCE,
  /**
   * Fractals
   */
  IND_FRACTALS,
  /**
   * Fractal Adaptive Moving Average
   */
  IND_FRAMA,
  /**
   * Gator Oscillator
   */
  IND_GATOR,
  /**
   * Ichimoku Kinko Hyo
   */
  IND_ICHIMOKU,
  /**
   * Moving Average
   */
  IND_MA,
  /**
   * MACD
   */
  IND_MACD,
  /**
   * Money Flow Index
   */
  IND_MFI,
  /**
   * Momentum
   */
  IND_MOMENTUM,
  /**
   * On Balance Volume
   */
  IND_OBV,
  /**
   * OsMA
   */
  IND_OSMA,
  /**
   * Relative Strength Index
   */
  IND_RSI,
  /**
   * Relative Vigor Index
   */
  IND_RVI,
  /**
   * Parabolic SAR
   */
  IND_SAR,
  /**
   * Standard Deviation
   */
  IND_STDDEV,
  /**
   * Stochastic Oscillator
   */
  IND_STOCHASTIC,
  /**
   * Triple Exponential Moving Average
   */
  IND_TEMA,
  /**
   * Triple Exponential Moving Averages Oscillator
   */
  IND_TRIX,
  /**
   * Variable Index Dynamic Average
   */
  IND_VIDYA,
  /**
   * Volumes
   */
  IND_VOLUMES,
  /**
   * Williams' Percent Range
   */
  IND_WPR,
} ENUM_INDICATOR;

typedef enum ENUM_DATATYPE {
  TYPE_BOOL,
  TYPE_CHAR,
  TYPE_UCHAR,
  TYPE_SHORT,
  TYPE_USHORT,
  TYPE_COLOR,
  TYPE_INT,
  TYPE_UINT,
  TYPE_DATETIME,
  TYPE_LONG,
  TYPE_ULONG,
  TYPE_FLOAT,
  TYPE_DOUBLE,
  TYPE_STRING,
} ENUM_DATATYPE;

typedef enum ENUM_MA_METHOD {
  /**
   * Simple averaging
   */
  MODE_SMA,
  /**
   * Exponential averaging
   */
  MODE_EMA,
  /**
   * Smoothed averaging
   */
  MODE_SMMA,
  /**
   * Linear-weighted averaging
   */
  MODE_LWMA,
} ENUM_MA_METHOD;
