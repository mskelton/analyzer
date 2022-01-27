typedef enum ENUM_ORDER_PROPERTY_INTEGER {
  /**
   * Order ticket. Unique number assigned to each order
   */
  ORDER_TICKET,
  /**
   * Order setup time
   */
  ORDER_TIME_SETUP,
  /**
   * Order type
   */
  ORDER_TYPE,
  /**
   * Order state
   */
  ORDER_STATE,
  /**
   * Order expiration time
   */
  ORDER_TIME_EXPIRATION,
  /**
   * Order execution or cancellation time
   */
  ORDER_TIME_DONE,
  /**
   * The time of placing an order for execution in milliseconds since 01.01.1970
   */
  ORDER_TIME_SETUP_MSC,
  /**
   * Order execution/cancellation time in milliseconds since 01.01.1970
   */
  ORDER_TIME_DONE_MSC,
  /**
   * Order filling type
   */
  ORDER_TYPE_FILLING,
  /**
   * Order lifetime
   */
  ORDER_TYPE_TIME,
  /**
   * ID of an Expert Advisor that has placed the order (designed to ensure that
   * each Expert Advisor places its own unique number)
   */
  ORDER_MAGIC,
  /**
   * The reason or source for placing an order
   */
  ORDER_REASON,
  /**
   * Position identifier that is set to an order as soon as it is executed. Each
   * executed order results in a deal that opens or modifies an already existing
   * position. The identifier of exactly this position is set to the executed
   * order at this moment.
   */
  ORDER_POSITION_ID,
  /**
   * Identifier of an opposite position used for closing by order
   *  ORDER_TYPE_CLOSE_BY
   */
  ORDER_POSITION_BY_ID,
} ENUM_ORDER_PROPERTY_INTEGER;

typedef enum ENUM_ORDER_PROPERTY_DOUBLE {
  /**
   * Order initial volume
   */
  ORDER_VOLUME_INITIAL,
  /**
   * Order current volume
   */
  ORDER_VOLUME_CURRENT,
  /**
   * Price specified in the order
   */
  ORDER_PRICE_OPEN,
  /**
   * Stop Loss value
   */
  ORDER_SL,
  /**
   * Take Profit value
   */
  ORDER_TP,
  /**
   * The current price of the order symbol
   */
  ORDER_PRICE_CURRENT,
  /**
   * The Limit order price for the StopLimit order
   */
  ORDER_PRICE_STOPLIMIT,
} ENUM_ORDER_PROPERTY_DOUBLE;

typedef enum ENUM_ORDER_PROPERTY_STRING {
  /**
   * Symbol of the order
   */
  ORDER_SYMBOL,
  /**
   * Order comment
   */
  ORDER_COMMENT,
  /**
   * Order identifier in an external trading system (on the Exchange)
   */
  ORDER_EXTERNAL_ID,
} ENUM_ORDER_PROPERTY_STRING;

typedef enum ENUM_ORDER_TYPE {
  /**
   * Market Buy order
   */
  ORDER_TYPE_BUY,
  /**
   * Market Sell order
   */
  ORDER_TYPE_SELL,
  /**
   * Buy Limit pending order
   */
  ORDER_TYPE_BUY_LIMIT,
  /**
   * Sell Limit pending order
   */
  ORDER_TYPE_SELL_LIMIT,
  /**
   * Buy Stop pending order
   */
  ORDER_TYPE_BUY_STOP,
  /**
   * Sell Stop pending order
   */
  ORDER_TYPE_SELL_STOP,
  /**
   * Upon reaching the order price, a pending Buy Limit order is placed at the
   * StopLimit price
   */
  ORDER_TYPE_BUY_STOP_LIMIT,
  /**
   * Upon reaching the order price, a pending Sell Limit order is placed at the
   * StopLimit price
   */
  ORDER_TYPE_SELL_STOP_LIMIT,
  /**
   * Order to close a position by an opposite one
   */
  ORDER_TYPE_CLOSE_BY,
} ENUM_ORDER_TYPE;

typedef enum ENUM_ORDER_STATE {
  /**
   * Order checked, but not yet accepted by broker
   */
  ORDER_STATE_STARTED,
  /**
   * Order accepted
   */
  ORDER_STATE_PLACED,
  /**
   * Order canceled by client
   */
  ORDER_STATE_CANCELED,
  /**
   * Order partially executed
   */
  ORDER_STATE_PARTIAL,
  /**
   * Order fully executed
   */
  ORDER_STATE_FILLED,
  /**
   * Order rejected
   */
  ORDER_STATE_REJECTED,
  /**
   * Order expired
   */
  ORDER_STATE_EXPIRED,
  /**
   * Order is being registered (placing to the trading system)
   */
  ORDER_STATE_REQUEST_ADD,
  /**
   * Order is being modified (changing its parameters)
   */
  ORDER_STATE_REQUEST_MODIFY,
  /**
   * Order is being deleted (deleting from the trading system)
   */
  ORDER_STATE_REQUEST_CANCEL,
} ENUM_ORDER_STATE;

typedef enum ENUM_ORDER_TYPE_FILLING {
  /**
   * This filling policy means that an order can be filled only in the specified
   * amount. If the necessary amount of a financial instrument is currently
   * unavailable in the market, the order will not be executed. The required
   * volume can be filled using several offers available on the market at the
   * moment.
   */
  ORDER_FILLING_FOK,
  /**
   * This mode means that a trader agrees to execute a deal with the volume
   * maximally available in the market within that indicated in the order. In
   * case the the entire volume of an order cannot be filled, the available
   * volume of it will be filled, and the remaining volume will be canceled.
   */
  ORDER_FILLING_IOC,
  /**
   * This policy is used only for market orders (ORDER_TYPE_BUY and
   * ORDER_TYPE_SELL), limit and stop limit orders (ORDER_TYPE_BUY_LIMIT,
   * ORDER_TYPE_SELL_LIMIT, ORDER_TYPE_BUY_STOP_LIMIT and
   * ORDER_TYPE_SELL_STOP_LIMIT) and only for the symbols with Market or
   * Exchange execution. In case of partial filling a market or limit order with
   * remaining volume is not canceled but processed further.
   *
   * For the activation of the ORDER_TYPE_BUY_STOP_LIMIT and
   * ORDER_TYPE_SELL_STOP_LIMIT orders, a corresponding limit order
   * ORDER_TYPE_BUY_LIMIT/ORDER_TYPE_SELL_LIMIT with the ORDER_FILLING_RETURN
   * execution type is created.
   */
  ORDER_FILLING_RETURN,
} ENUM_ORDER_TYPE_FILLING;

typedef enum ENUM_ORDER_TYPE_TIME {
  /**
   * Good till cancel order
   */
  ORDER_TIME_GTC,
  /**
   * Good till current trade day order
   */
  ORDER_TIME_DAY,
  /**
   * Good till expired order
   */
  ORDER_TIME_SPECIFIED,
  /**
   * The order will be effective till 23:59:59 of the specified day. If this
   * time is outside a trading session, the order expires in the nearest trading
   * time.
   */
  ORDER_TIME_SPECIFIED_DAY,
} ENUM_ORDER_TYPE_TIME;

typedef enum ENUM_ORDER_REASON {
  /**
   * The order was placed from a desktop terminal
   */
  ORDER_REASON_CLIENT,
  /**
   * The order was placed from a mobile application
   */
  ORDER_REASON_MOBILE,
  /**
   * The order was placed from a web platform
   */
  ORDER_REASON_WEB,
  /**
   * The order was placed from an MQL5-program, i.e. by an Expert Advisor or a
   * script
   */
  ORDER_REASON_EXPERT,
  /**
   * The order was placed as a result of Stop Loss activation
   */
  ORDER_REASON_SL,
  /**
   * The order was placed as a result of Take Profit activation
   */
  ORDER_REASON_TP,
  /**
   * The order was placed as a result of the Stop Out event
   */
  ORDER_REASON_SO,
} ENUM_ORDER_REASON;

typedef enum ENUM_BOOK_TYPE {
  /**
   * Sell order (Offer)
   */
  BOOK_TYPE_SELL,
  /**
   * Buy order (Bid)
   */
  BOOK_TYPE_BUY,
  /**
   * Sell order by Market
   */
  BOOK_TYPE_SELL_MARKET,
  /**
   * Buy order by Market
   */
  BOOK_TYPE_BUY_MARKET,
} ENUM_BOOK_TYPE;
