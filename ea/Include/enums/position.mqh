typedef enum ENUM_POSITION_PROPERTY_INTEGER {
  /**
   * Position ticket. Unique number assigned to each newly opened position. It
   * usually matches the ticket of an order used to open the position except
   * when the ticket is changed as a result of service operations on the server,
   * for example, when charging swaps with position re-opening. To find an order
   * used to open a position, apply the POSITION_IDENTIFIER property.  
   *
   * POSITION_TICKET value corresponds to MqlTradeRequest::position.
   */
  POSITION_TICKET,
  /**
   * Position open time
   */
  POSITION_TIME,
  /**
   * Position opening time in milliseconds since 01.01.1970
   */
  POSITION_TIME_MSC,
  /**
   * Position changing time
   */
  POSITION_TIME_UPDATE,
  /**
   * Position changing time in milliseconds since 01.01.1970
   */
  POSITION_TIME_UPDATE_MSC,
  /**
   * Position type
   */
  POSITION_TYPE,
  /**
   * Position magic number (see ORDER_MAGIC)
   */
  POSITION_MAGIC,
  /**
   * Position identifier is a unique number assigned to each re-opened position.
   * It does not change throughout its life cycle and corresponds to the ticket
   * of an order used to open a position.
   *
   * Position identifier is specified in each order (ORDER_POSITION_ID) and deal
   * (DEAL_POSITION_ID) used to open, modify, or close it. Use this property to
   * search for orders and deals related to the position.
   *
   * When reversing a position in netting mode (using a single in/out trade),
   * POSITION_IDENTIFIER does not change. However, POSITION_TICKET is replaced
   * with the ticket of the order that led to the reversal. Position reversal is
   * not provided in hedging mode.
   */
  POSITION_IDENTIFIER,
  /**
   * The reason for opening a position
   */
  POSITION_REASON,
} ENUM_POSITION_PROPERTY_INTEGER;

typedef enum ENUM_POSITION_PROPERTY_DOUBLE {
  /**
   * Position volume
   */
  POSITION_VOLUME,
  /**
   * Position open price
   */
  POSITION_PRICE_OPEN,
  /**
   * Stop Loss level of opened position
   */
  POSITION_SL,
  /**
   * Take Profit level of opened position
   */
  POSITION_TP,
  /**
   * Current price of the position symbol
   */
  POSITION_PRICE_CURRENT,
  /**
   * Cumulative swap
   */
  POSITION_SWAP,
  /**
   * Current profit
   */
  POSITION_PROFIT,
} ENUM_POSITION_PROPERTY_DOUBLE;

typedef enum ENUM_POSITION_PROPERTY_STRING {
  /**
   * Symbol of the position
   */
  POSITION_SYMBOL,
  /**
   * Position comment
   */
  POSITION_COMMENT,
  /**
   * Position identifier in an external trading system (on the Exchange)
   */
  POSITION_EXTERNAL_ID,
} ENUM_POSITION_PROPERTY_STRING;

typedef enum ENUM_POSITION_TYPE {
  POSITION_TYPE_BUY,
  POSITION_TYPE_SELL,
} ENUM_POSITION_TYPE;

typedef enum ENUM_POSITION_REASON {
  /**
   * The position was opened as a result of activation of an order placed from a
   * desktop terminal
   */
  POSITION_REASON_CLIENT,
  /**
   * The position was opened as a result of activation of an order placed from a
   * mobile application
   */
  POSITION_REASON_MOBILE,
  /**
   * The position was opened as a result of activation of an order placed from
   * the web platform
   */
  POSITION_REASON_WEB,
  /**
   * The position was opened as a result of activation of an order placed from
   * an MQL5 program, i.e. an Expert Advisor or a script
   */
  POSITION_REASON_EXPERT,
} ENUM_POSITION_REASON;
