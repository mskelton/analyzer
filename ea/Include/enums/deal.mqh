typedef enum ENUM_DEAL_PROPERTY_INTEGER {
  /**
   * Deal ticket. Unique number assigned to each deal
   */
  DEAL_TICKET,
  /**
   * Deal order number
   */
  DEAL_ORDER,
  /**
   * Deal time
   */
  DEAL_TIME,
  /**
   * The time of a deal execution in milliseconds since 01.01.1970
   */
  DEAL_TIME_MSC,
  /**
   * Deal type
   */
  DEAL_TYPE,
  /**
   * Deal entry - entry in, entry out, reverse
   */
  DEAL_ENTRY,
  /**
   * Deal magic number (see ORDER_MAGIC)
   */
  DEAL_MAGIC,
  /**
   * The reason or source for deal execution
   */
  DEAL_REASON,
  /**
   * Identifier of a position, in the opening, modification or closing of which
   * this deal took part. Each position has a unique identifier that is assigned
   * to all deals executed for the symbol during the entire lifetime of the
   * position.
   */
  DEAL_POSITION_ID,
} ENUM_DEAL_PROPERTY_INTEGER;

typedef enum ENUM_DEAL_PROPERTY_DOUBLE {
  /**
   * Deal volume
   */
  DEAL_VOLUME,
  /**
   * Deal price
   */
  DEAL_PRICE,
  /**
   * Deal commission
   */
  DEAL_COMMISSION,
  /**
   * Cumulative swap on close
   */
  DEAL_SWAP,
  /**
   * Deal profit
   */
  DEAL_PROFIT,
  /**
   * Fee for making a deal charged immediately after performing a deal
   */
  DEAL_FEE,
} ENUM_DEAL_PROPERTY_DOUBLE;

typedef enum ENUM_DEAL_PROPERTY_STRING {
  /**
   * Deal symbol
   */
  DEAL_SYMBOL,
  /**
   * Deal comment
   */
  DEAL_COMMENT,
  /**
   * Deal identifier in an external trading system (on the Exchange)
   */
  DEAL_EXTERNAL_ID,
} ENUM_DEAL_PROPERTY_STRING;

typedef enum ENUM_DEAL_TYPE {
  /**
   * Buy
   */
  DEAL_TYPE_BUY,
  /**
   * Sell
   */
  DEAL_TYPE_SELL,
  /**
   * Balance
   */
  DEAL_TYPE_BALANCE,
  /**
   * Credit
   */
  DEAL_TYPE_CREDIT,
  /**
   * Additional charge
   */
  DEAL_TYPE_CHARGE,
  /**
   * Correction
   */
  DEAL_TYPE_CORRECTION,
  /**
   * Bonus
   */
  DEAL_TYPE_BONUS,
  /**
   * Additional commission
   */
  DEAL_TYPE_COMMISSION,
  /**
   * Daily commission
   */
  DEAL_TYPE_COMMISSION_DAILY,
  /**
   * Monthly commission
   */
  DEAL_TYPE_COMMISSION_MONTHLY,
  /**
   * Daily agent commission
   */
  DEAL_TYPE_COMMISSION_AGENT_DAILY,
  /**
   * Monthly agent commission
   */
  DEAL_TYPE_COMMISSION_AGENT_MONTHLY,
  /**
   * Interest rate
   */
  DEAL_TYPE_INTEREST,
  /**
   * Canceled buy deal. There can be a situation when a previously executed buy
   * deal is canceled. In this case, the type of the previously executed deal
   * (DEAL_TYPE_BUY) is changed to DEAL_TYPE_BUY_CANCELED, and its profit/loss
   * is zeroized. Previously obtained profit/loss is charged/withdrawn using a
   * separated balance operation
   */
  DEAL_TYPE_BUY_CANCELED,
  /**
   * Canceled sell deal. There can be a situation when a previously executed
   * sell deal is canceled. In this case, the type of the previously executed
   * deal (DEAL_TYPE_SELL) is changed to DEAL_TYPE_SELL_CANCELED, and its
   * profit/loss is zeroized. Previously obtained profit/loss is
   * charged/withdrawn using a separated balance operation
   */
  DEAL_TYPE_SELL_CANCELED,
  /**
   * Dividend operations
   */
  DEAL_DIVIDEND,
  /**
   * Franked (non-taxable) dividend operations
   */
  DEAL_DIVIDEND_FRANKED,
  /**
   * Tax charges
   */
  DEAL_TAX,
} ENUM_DEAL_TYPE;

typedef enum ENUM_DEAL_ENTRY {
  /**
   * Entry in
   */
  DEAL_ENTRY_IN,
  /**
   * Entry out
   */
  DEAL_ENTRY_OUT,
  /**
   * Reverse
   */
  DEAL_ENTRY_INOUT,
  /**
   * Close a position by an opposite one
   */
  DEAL_ENTRY_OUT_BY,
} ENUM_DEAL_ENTRY;

typedef enum ENUM_DEAL_REASON {
  /**
   * The deal was executed as a result of activation of an order placed from a
   * desktop terminal
   */
  DEAL_REASON_CLIENT,
  /**
   * The deal was executed as a result of activation of an order placed from a
   * mobile application
   */
  DEAL_REASON_MOBILE,
  /**
   * The deal was executed as a result of activation of an order placed from the
   * web platform
   */
  DEAL_REASON_WEB,
  /**
   * The deal was executed as a result of activation of an order placed from an
   * MQL5 program, i.e. an Expert Advisor or a script
   */
  DEAL_REASON_EXPERT,
  /**
   * The deal was executed as a result of Stop Loss activation
   */
  DEAL_REASON_SL,
  /**
   * The deal was executed as a result of Take Profit activation
   */
  DEAL_REASON_TP,
  /**
   * The deal was executed as a result of the Stop Out event
   */
  DEAL_REASON_SO,
  /**
   * The deal was executed due to a rollover
   */
  DEAL_REASON_ROLLOVER,
  /**
   * The deal was executed after charging the variation margin
   */
  DEAL_REASON_VMARGIN,
  /**
   * The deal was executed after the split (price reduction) of an instrument,
   * which had an open position during split announcement
   */
  DEAL_REASON_SPLIT,
} ENUM_DEAL_REASON;
