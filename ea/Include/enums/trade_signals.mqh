typedef enum ENUM_SIGNAL_BASE_DOUBLE {
  /**
   * Account balance
   */
  SIGNAL_BASE_BALANCE,
  /**
   * Account equity
   */
  SIGNAL_BASE_EQUITY,
  /**
   * Account gain
   */
  SIGNAL_BASE_GAIN,
  /**
   * Account maximum drawdown
   */
  SIGNAL_BASE_MAX_DRAWDOWN,
  /**
   * Signal subscription price
   */
  SIGNAL_BASE_PRICE,
  /**
   * Return on Investment (%)
   */
  SIGNAL_BASE_ROI
} ENUM_SIGNAL_BASE_DOUBLE;

typedef enum ENUM_SIGNAL_BASE_INTEGER {
  /**
   * Publication date (date when it become available for subscription)
   */
  SIGNAL_BASE_DATE_PUBLISHED,
  /**
   * Monitoring starting date
   */
  SIGNAL_BASE_DATE_STARTED,
  /**
   * The date of the last update of the signal's trading statistics
   */
  SIGNAL_BASE_DATE_UPDATED,
  /**
   * Signal ID
   */
  SIGNAL_BASE_ID,
  /**
   * Account leverage
   */
  SIGNAL_BASE_LEVERAGE,
  /**
   * Profit in pips
   */
  SIGNAL_BASE_PIPS,
  /**
   * Position in rating
   */
  SIGNAL_BASE_RATING,
  /**
   * Number of subscribers
   */
  SIGNAL_BASE_SUBSCRIBERS,
  /**
   * Number of trades
   */
  SIGNAL_BASE_TRADES,
  /**
   * Account type (0-real, 1-demo, 2-contest)
   */
  SIGNAL_BASE_TRADE_MODE
} ENUM_SIGNAL_BASE_INTEGER;

typedef enum ENUM_SIGNAL_BASE_STRING {
  /**
   * Author login
   */
  SIGNAL_BASE_AUTHOR_LOGIN,
  /**
   * Broker name (company)
   */
  SIGNAL_BASE_BROKER,
  /**
   * Broker server
   */
  SIGNAL_BASE_BROKER_SERVER,
  /**
   * Signal name
   */
  SIGNAL_BASE_NAME,
  /**
   * Signal base currency
   */
  SIGNAL_BASE_CURRENCY
} ENUM_SIGNAL_BASE_STRING;

typedef enum ENUM_SIGNAL_INFO_DOUBLE {
  /**
   * Equity limit
   */
  SIGNAL_INFO_EQUITY_LIMIT,
  /**
   * Slippage (used when placing market orders in synchronization of positions
   * and copying of trades)
   */
  SIGNAL_INFO_SLIPPAGE,
  /**
   * Maximum percent of deposit used (%), r/o
   */
  SIGNAL_INFO_VOLUME_PERCENT
} ENUM_SIGNAL_INFO_DOUBLE;

typedef enum ENUM_SIGNAL_INFO_INTEGER {
  /**
   * The flag enables synchronization without confirmation dialog
   */
  SIGNAL_INFO_CONFIRMATIONS_DISABLED,
  /**
   * Copy Stop Loss and Take Profit flag
   */
  SIGNAL_INFO_COPY_SLTP,
  /**
   * Deposit percent (%)
   */
  SIGNAL_INFO_DEPOSIT_PERCENT,
  /**
   * Signal id, r/o
   */
  SIGNAL_INFO_ID,
  /**
   * "Copy trades by subscription" permission flag
   */
  SIGNAL_INFO_SUBSCRIPTION_ENABLED,
  /**
   * "Agree to terms of use of Signals service" flag, r/o
   */
  SIGNAL_INFO_TERMS_AGREE,
} ENUM_SIGNAL_INFO_INTEGER;

typedef enum ENUM_SIGNAL_INFO_STRING {
  /**
   * Signal name, r/o
   */
  SIGNAL_INFO_NAME
} ENUM_SIGNAL_INFO_STRING;
