typedef enum ENUM_ACCOUNT_INFO_INTEGER {
  /**
   * Account number
   */
  ACCOUNT_LOGIN,
  /**
   * Account trade mode
   */
  ACCOUNT_TRADE_MODE,
  /**
   * Account leverage
   */
  ACCOUNT_LEVERAGE,
  /**
   * Maximum allowed number of active pending orders
   */
  ACCOUNT_LIMIT_ORDERS,
  /**
   * Mode for setting the minimal allowed margin
   */
  ACCOUNT_MARGIN_SO_MODE,
  /**
   * Allowed trade for the current account
   */
  ACCOUNT_TRADE_ALLOWED,
  /**
   * Allowed trade for an Expert Advisor
   */
  ACCOUNT_TRADE_EXPERT,
  /**
   * Margin calculation mode
   */
  ACCOUNT_MARGIN_MODE,
  /**
   * The number of decimal places in the account currency, which are required
   * for an accurate display of trading results
   */
  ACCOUNT_CURRENCY_DIGITS,
  /**
   * An indication showing that positions can only be closed by FIFO rule. If
   * the property value is set to true, then each symbol positions will be
   * closed in the same order, in which they are opened, starting with the
   * oldest one. In case of an attempt to close positions in a different order,
   * the trader will receive an appropriate error.
   */
  ACCOUNT_FIFO_CLOSE,
} ENUM_ACCOUNT_INFO_INTEGER;

typedef enum ENUM_ACCOUNT_INFO_DOUBLE {
  /**
   * Account balance in the deposit currency
   */
  ACCOUNT_BALANCE,
  /**
   * Account credit in the deposit currency
   */
  ACCOUNT_CREDIT,
  /**
   * Current profit of an account in the deposit currency
   */
  ACCOUNT_PROFIT,
  /**
   * Account equity in the deposit currency
   */
  ACCOUNT_EQUITY,
  /**
   * Account margin used in the deposit currency
   */
  ACCOUNT_MARGIN,
  /**
   * Free margin of an account in the deposit currency
   */
  ACCOUNT_MARGIN_FREE,
  /**
   * Account margin level in percents
   */
  ACCOUNT_MARGIN_LEVEL,
  /**
   * Margin call level. Depending on the set ACCOUNT_MARGIN_SO_MODE is expressed
   * in percents or in the deposit currency
   */
  ACCOUNT_MARGIN_SO_CALL,
  /**
   * Margin stop out level. Depending on the set ACCOUNT_MARGIN_SO_MODE is
   * expressed in percents or in the deposit currency
   */
  ACCOUNT_MARGIN_SO_SO,
  /**
   * Initial margin. The amount reserved on an account to cover the margin of
   * all pending orders
   */
  ACCOUNT_MARGIN_INITIAL,
  /**
   * Maintenance margin. The minimum equity reserved on an account to cover the
   * minimum amount of all open positions
   */
  ACCOUNT_MARGIN_MAINTENANCE,
  /**
   * The current assets of an account
   */
  ACCOUNT_ASSETS,
  /**
   * The current liabilities on an account
   */
  ACCOUNT_LIABILITIES,
  /**
   * The current blocked commission amount on an account
   */
  ACCOUNT_COMMISSION_BLOCKED,
} ENUM_ACCOUNT_INFO_DOUBLE;

typedef enum ENUM_ACCOUNT_INFO_STRING {
  /**
   * Client name
   */
  ACCOUNT_NAME,
  /**
   * Trade server name
   */
  ACCOUNT_SERVER,
  /**
   * Account currency
   */
  ACCOUNT_CURRENCY,
  /**
   * Name of a company that serves the account
   */
  ACCOUNT_COMPANY
} ENUM_ACCOUNT_INFO_STRING;

typedef enum ENUM_ACCOUNT_TRADE_MODE {
  /**
   * Demo account
   */
  ACCOUNT_TRADE_MODE_DEMO,
  /**
   * Contest account
   */
  ACCOUNT_TRADE_MODE_CONTEST,
  /**
   * Real account
   */
  ACCOUNT_TRADE_MODE_REAL,
} ENUM_ACCOUNT_TRADE_MODE;

typedef enum ENUM_ACCOUNT_STOPOUT_MODE {
  /**
   * Account stop out mode in percents
   */
  ACCOUNT_STOPOUT_MODE_PERCENT,
  /**
   * Account stop out mode in money
   */
  ACCOUNT_STOPOUT_MODE_MONEY,
} ENUM_ACCOUNT_STOPOUT_MODE;

typedef enum ENUM_ACCOUNT_MARGIN_MODE {
  /**
   * Used for the OTC markets to interpret positions in the "netting" mode (only
   * one position can exist for one symbol). The margin is calculated based on
   * the symbol type (SYMBOL_TRADE_CALC_MODE).
   */
  ACCOUNT_MARGIN_MODE_RETAIL_NETTING,
  /**
   * Used for the exchange markets. Margin is calculated based on the discounts
   * specified in symbol settings. Discounts are set by the broker, but not less
   * than the values set by the exchange.
   */
  ACCOUNT_MARGIN_MODE_EXCHANGE,
  /**
   * Used for the exchange markets where individual positions are possible
   * (hedging, multiple positions can exist for one symbol). The margin is
   * calculated based on the symbol type (SYMBOL_TRADE_CALC_MODE) taking into
   * account the hedged margin (SYMBOL_MARGIN_HEDGED).
   */
  ACCOUNT_MARGIN_MODE_RETAIL_HEDGING,
} ENUM_ACCOUNT_MARGIN_MODE;
