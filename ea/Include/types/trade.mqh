#include "Include/types/data_types.mqh"

struct MqlTradeTransaction {
  /**
   * Deal ticket.
   */
  ulong deal;
  /**
   * Order ticket.
   */
  ulong order;
  /**
   * The name of the trading symbol, for which transaction is performed.
   */
  string symbol;
  /**
   * Trade transaction type. The value can be one of ENUM_TRADE_TRANSACTION_TYPE
   * enumeration values.
   */
  ENUM_TRADE_TRANSACTION_TYPE type;
  /**
   * Trade order type. The value can be one of ENUM_ORDER_TYPE enumeration
   * values.
   */
  ENUM_ORDER_TYPE order_type;
  /**
   * Trade order state. The value can be one of ENUM_ORDER_STATE enumeration
   * values.
   */
  ENUM_ORDER_STATE order_state;
  /**
   * Deal type. The value can be one of ENUM_DEAL_TYPE enumeration values.
   */
  ENUM_DEAL_TYPE deal_type;
  /**
   * Order type upon expiration. The value can be one of ENUM_ORDER_TYPE_TIME
   * values.
   */
  ENUM_ORDER_TYPE_TIME time_type;
  /**
   * Pending order expiration term (for orders of ORDER_TIME_SPECIFIED and
   * ORDER_TIME_SPECIFIED_DAY types).
   */
  datetime time_expiration;
  /**
   * Price. Depending on a trade transaction type, it may be a price of an
   * order, a deal or a position.
   */
  double price;
  /**
   * Stop limit order stop (activation) price (ORDER_TYPE_BUY_STOP_LIMIT and
   * ORDER_TYPE_SELL_STOP_LIMIT).
   */
  double price_trigger;
  /**
   * Stop Loss price. Depending on a trade transaction type, it may relate to an
   * order, a deal or a position.
   */
  double price_sl;
  /**
   * Take Profit price. Depending on a trade transaction type, it may relate to
   * an order, a deal or a position.
   */
  double price_tp;
  /**
   * Volume in lots. Depending on a trade transaction type, it may indicate the
   * current volume of an order, a deal or a position.
   */
  double volume;
  /**
   * The ticket of the position affected by the transaction.
   */
  ulong position;
  /**
   * The ticket of the opposite position. Used when closing a position by an
   * opposite one, i.e. by a position of the same symbol that was opened in the
   * opposite direction.
   */
  ulong position_by;
};

struct MqlTradeRequest {
  /**
   * Trade operation type. Can be one of the ENUM_TRADE_REQUEST_ACTIONS
   * enumeration values.
   */
  ENUM_TRADE_REQUEST_ACTIONS action;
  /**
   * Expert Advisor ID. It allows organizing analytical processing of trade
   * orders. Each Expert Advisor can set its own unique ID when sending a trade
   * request.
   */
  ulong magic;
  /**
   * Order ticket. It is used for modifying pending orders.
   */
  ulong order;
  /**
   * Symbol of the order. It is not necessary for order modification and
   * position close operations.
   */
  string symbol;
  /**
   * Requested order volume in lots. Note that the real volume of a deal will
   * depend on the order execution type.
   */
  double volume;
  /**
   * Price, reaching which the order must be executed. Market orders of symbols,
   * whose execution type is "Market Execution" (SYMBOL_TRADE_EXECUTION_MARKET),
   * of TRADE_ACTION_DEAL type, do not require specification of price.
   */
  double price;
  /**
   * The price value, at which the Limit pending order will be placed, when
   * price reaches the price value (this condition is obligatory). Until then
   * the pending order is not placed.
   */
  double stoplimit;
  /**
   * Stop Loss price in case of the unfavorable price movement
   */
  double sl;
  /**
   * Take Profit price in the case of the favorable price movement
   */
  double tp;
  /**
   * The maximal price deviation, specified in points
   */
  ulong deviation;
  /**
   * Order type. Can be one of the ENUM_ORDER_TYPE enumeration values.
   */
  ENUM_ORDER_TYPE type;
  /**
   * Order execution type. Can be one of the enumeration ENUM_ORDER_TYPE_FILLING
   * values.
   */
  ENUM_ORDER_TYPE_FILLING type_filling;
  /**
   * Order expiration type. Can be one of the enumeration ENUM_ORDER_TYPE_TIME
   * values.
   */
  ENUM_ORDER_TYPE_TIME type_time;
  /**
   * Order expiration time (for orders of ORDER_TIME_SPECIFIED type)
   */
  datetime expiration;
  /**
   * Order comment
   */
  string comment;
  /**
   * Ticket of a position. Should be filled in when a position is modified or
   * closed to identify the position. As a rule it is equal to the ticket of the
   * order, based on which the position was opened.
   */
  ulong position;
  /**
   * Ticket of an opposite position. Used when a position is closed by an
   * opposite one open for the same symbol in the opposite direction.
   */
  ulong position_by;
};

struct MqlTradeResult {
  /**
   * Return code of a trade server
   */
  uint retcode;
  /**
   * Deal ticket, if a deal has been performed. It is available for a trade
   * operation of TRADE_ACTION_DEAL type
   */
  ulong deal;
  /**
   * Order ticket, if a ticket has been placed. It is available for a trade
   * operation of TRADE_ACTION_PENDING type
   */
  ulong order;
  /**
   * Deal volume, confirmed by broker. It depends on the order filling type
   */
  double volume;
  /**
   * Deal price, confirmed by broker. It depends on the deviation field of the
   * trade request and/or on the trade operation
   */
  double price;
  /**
   * The current market Bid price (requote price)
   */
  double bid;
  /**
   * The current market Ask price (requote price)
   */
  double ask;
  /**
   * The broker comment to operation (by default it is filled by description of
   * trade server return code)
   */
  string comment;
  /**
   * Request ID set by the terminal when sending to the trade server
   */
  uint request_id;
  /**
   * The code of the error returned by an external trading system. The use and
   * types of these errors depend on the broker and the external trading system,
   * to which trading operations are sent.
   */
  uint retcode_external;
};

struct MqlTradeCheckResult {
  /**
   * Return code
   */
  uint retcode;
  /**
   * Balance value that will be after the execution of the trade operation
   */
  double balance;
  /**
   * Equity value that will be after the execution of the trade operation
   */
  double equity;
  /**
   * Value of the floating profit that will be after the execution of the trade
   * operation
   */
  double profit;
  /**
   * Margin required for the trade operation
   */
  double margin;
  /**
   * Free margin that will be left after the execution of the trade operation
   */
  double margin_free;
  /**
   * Margin level that will be set after the execution of the trade operation
   */
  double margin_level;
  /**
   * Comment to the reply code, error description
   */
  string comment;
};
