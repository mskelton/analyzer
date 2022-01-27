#include "Include/enums/deal.mqh"
#include "Include/enums/position.mqh"
#include "Include/enums/trade.mqh"
#include "Include/types/data_types.mqh"
#include "Include/types/trade.mqh"

/**
 * The function calculates the margin required for the specified order type, on
 * the current account, in the current market environment not taking into
 * account current pending orders and open positions. It allows the evaluation
 * of margin for the trade operation planned. The value is returned in the
 * account currency.
 *
 * @param action The order type, can be one of the values of the ENUM_ORDER_TYPE
 * enumeration.
 * @param symbol Symbol name.
 * @param volume Volume of the trade operation.
 * @param price Open price.
 * @param margin The variable, to which the value of the required margin will be
 * written in case the function is successfully executed. The calculation is
 * performed as if there were no pending orders and open positions on the
 * current account. The margin value depends on many factors, and can differ in
 * different market environments.
 * @returns The function returns true in case of success; otherwise it returns
 * false. In order to obtain information about the error, call the
 * GetLastError() function.
 */
bool OrderCalcMargin(ENUM_ORDER_TYPE action,
                     string symbol,
                     double volume,
                     double price,
                     double& margin);

/**
 * The function calculates the profit for the current account, in the current
 * market conditions, based on the parameters passed. The function is used for
 * pre-evaluation of the result of a trade operation. The value is returned in
 * the account currency.
 *
 * @param action Type of the order, can be one of the two values of the
 * ENUM_ORDER_TYPE enumeration: ORDER_TYPE_BUY or ORDER_TYPE_SELL.
 * @param symbol Symbol name.
 * @param volume Volume of the trade operation.
 * @param price_open Open price.
 * @param price_close Close price.
 * @param profit The variable, to which the calculated value of the profit will
 * be written in case the function is successfully executed. The estimated
 * profit value depends on many factors, and can differ in different market
 * environments.
 * @returns The function returns true in case of success; otherwise it returns
 * false. If an invalid order type is specified, the function will return false.
 * In order to obtain information about the error, call GetLastError().
 */
bool OrderCalcProfit(ENUM_ORDER_TYPE action,
                     string symbol,
                     double volume,
                     double price_open,
                     double price_close,
                     double& profit);

/**
 * The OrderCheck() function checks if there are enough money to execute a
 * required trade operation. The check results are placed to the fields of the
 * MqlTradeCheckResult structure.
 *
 * @param request Pointer to the structure of the MqlTradeRequest type, which
 * describes the required trade action.
 * @param result [in,out] Pointer to the structure of the MqlTradeCheckResult
 * type, to which the check result will be placed.
 * @returns If funds are not enough for the operation, or parameters are filled
 * out incorrectly, the function returns false. In case of a successful basic
 * check of structures (check of pointers), it returns true. However, this is
 * not an indication that the requested trade operation is sure to be
 * successfully executed. For a more detailed description of the function
 * execution result, analyze the fields of the result structure.
 */
bool OrderCheck(MqlTradeRequest& request, MqlTradeCheckResult& result);

/**
 * The OrderSend() function is used for executing trade operations by sending
 * requests to a trade server.
 *
 * @param request Pointer to a structure of MqlTradeRequest type describing the
 * trade activity of the client.
 * @param result [in,out] Pointer to a structure of MqlTradeResult type
 * describing the result of trade operation in case of a successful completion
 * (if true is returned).
 * @returns In case of a successful basic check of structures (index checking)
 * returns true. However, this is not a sign of successful execution of a trade
 * operation. For a more detailed description of the function execution result,
 * analyze the fields of result structure.
 */
bool OrderSend(MqlTradeRequest& request, MqlTradeResult& result);

/**
 * The OrderSendAsync() function is used for conducting asynchronous trade
 * operations without waiting for the trade server's response to a sent request.
 * The function is designed for high-frequency trading, when under the terms of
 * the trading algorithm it is unacceptable to waste time waiting for a response
 * from the server.
 *
 * @param request A pointer to a structure of the MqlTradeRequest type that
 * describes the trade action of the client.
 * @param result A pointer to a structure of the MqlTradeResult type
 * that describes the result of a trade operation in case of successful
 * execution of the function (if true is returned).
 * @returns Returns true if the request is sent to a trade server. In case the
 * request is not sent, it returns false. In case the request is sent, in the
 * result variable the response code contains TRADE_RETCODE_PLACED value (code
 * 10008) – "order placed". Successful execution means only the fact of sending,
 * but does not give any guarantee that the request has reached the trade server
 * and has been accepted for processing. When processing the received request, a
 * trade server sends a reply to a client terminal notifying of change in the
 * current state of positions, orders and deals, which leads to the generation
 * of the Trade event.
 *
 * The result of executing the trade request on a server
 * sent by OrderSendAsync() function can be tracked by OnTradeTransaction
 * handler. It should be noted that OnTradeTransaction handler will be called
 * several times when executing one trade request.
 *
 * For example, when sending a market buy order, it is handled, an appropriate
 * buy order is created for the account, the order is then executed and removed
 * from the list of the open ones, then it is added to the orders history, an
 * appropriate deal is added to the history and a new position is created.
 * OnTradeTransaction function will be called for each of these events. To get
 * such a data, the function parameters should be analyzed:
 *
 * trans - this parameter gets MqlTradeTransaction structure describing a trade
 * transaction applied to a trade account; request - this parameter gets
 * MqlTradeRequest structure describing the trade request resulted in a trade
 * transaction; result - this parameter gets MqlTradeResult structure describing
 * a trade request execution result.
 */
bool OrderSendAsync(MqlTradeRequest& request, MqlTradeResult& result);

/**
 * Returns the number of open positions.
 *
 * @returns Value of int type.
 */
int PositionsTotal();

/**
 * Returns the symbol corresponding to the open position and automatically
 * selects the position for further working with it using functions
 * PositionGetDouble, PositionGetInteger, PositionGetString.
 *
 * @param index Number of the position in the list of open positions.
 * @returns Value of the string type. If the position was not found, an empty
 * string will be returned. To get an error code, call the GetLastError()
 * function.
 */
string PositionGetSymbol(int index);

/**
 * Chooses an open position for further working with it. Returns true if the
 * function is successfully completed.
 *
 * @param symbol Name of the financial security.
 * @returns false in case of failure. To obtain information about the error,
 * call GetLastError().
 */
bool PositionSelect(string symbol);

/**
 * Selects an open position to work with based on the ticket number specified in
 * the position. If successful, returns true. Returns false if the function
 * failed. Call GetLastError() for error details.
 *
 * @param ticket Position ticket.
 * @returns A value of the bool type.
 */
bool PositionSelectByTicket(ulong ticket);

/**
 * The function returns the requested property of an open position, pre-selected
 * using PositionGetSymbol or PositionSelect. The position property must be of
 * the double type. There are 2 variants of the function.
 *
 * @param property_id Identifier of a position property. The value can be one of
 * the values of the ENUM_POSITION_PROPERTY_DOUBLE enumeration.
 * @param double_var Variable of the double type, accepting the value of the
 * requested property.
 * @returns Value of the double type. If the function fails, 0 is returned.
 */
double PositionGetDouble(ENUM_POSITION_PROPERTY_DOUBLE property_id);
bool PositionGetDouble(ENUM_POSITION_PROPERTY_DOUBLE property_id,
                       double& double_var);

/**
 * The function returns the requested property of an open position, pre-selected
 * using PositionGetSymbol or PositionSelect. The position property should be of
 * datetime, int type. There are 2 variants of the function.
 *
 * @param property_id Identifier of a position property. The value can be one of
 * the values of the ENUM_POSITION_PROPERTY_INTEGER enumeration.
 * @param long_var Variable of the long type accepting the value of the
 * requested property.
 * @returns Value of the long type. If the function fails, 0 is returned.
 */
long PositionGetInteger(ENUM_POSITION_PROPERTY_INTEGER property_id);
bool PositionGetInteger(ENUM_POSITION_PROPERTY_INTEGER property_id,
                        long& long_var);

/**
 * The function returns the requested property of an open position, pre-selected
 * using PositionGetSymbol or PositionSelect. The position property should be of
 * the string type. There are 2 variants of the function.
 *
 * @param property_id Identifier of a position property. The value can be one of
 * the values of the ENUM_POSITION_PROPERTY_STRING enumeration.
 * @param string_var Variable of the string type accepting the value of the
 * requested property.
 * @returns Value of the string type. If the function fails, an empty string is
 * returned.
 */
string PositionGetString(ENUM_POSITION_PROPERTY_STRING property_id);
bool PositionGetString(ENUM_POSITION_PROPERTY_STRING property_id,
                       string& string_var);

/**
 * The function returns the ticket of a position with the specified index in the
 * list of open positions and automatically selects the position to work with
 * using functions PositionGetDouble, PositionGetInteger, PositionGetString.
 *
 * @param index The index of a position in the list of open positions,
 * numeration starts with 0.
 * @returns The ticket of the position. Returns 0 if the function fails.
 */
ulong PositionGetTicket(int index);

/**
 * Returns the number of current orders.
 */
int OrdersTotal();

/**
 * Returns ticket of a corresponding order and automatically selects the order
 * for further working with it using functions.
 *
 * @param index Number of an order in the list of current orders.
 * @returns Value of the ulong type. If the function fails, 0 is returned.
 */
ulong OrderGetTicket(int index);

/**
 * Selects an order to work with. Returns true if the function has been
 * successfully completed. Returns false if the function completion has failed.
 * For more information about an error call GetLastError().
 *
 * @param ticket Order ticket.
 * @returns Value of the bool type.
 */
bool OrderSelect(ulong ticket);

/**
 * Returns the requested property of an order, pre-selected using OrderGetTicket
 * or OrderSelect. The order property must be of the double type. There are 2
 * variants of the function.
 *
 * @param property_id Identifier of the order property. The value can be one of
 * the values of the ENUM_ORDER_PROPERTY_DOUBLE enumeration.
 * @param double_var Variable of the double type that accepts the value of the
 * requested property.
 * @returns Value of the double type. If the function fails, 0 is returned.
 */
double OrderGetDouble(ENUM_ORDER_PROPERTY_DOUBLE property_id);
bool OrderGetDouble(ENUM_ORDER_PROPERTY_DOUBLE property_id, double& double_var);

/**
 * Returns the requested order property, pre-selected using OrderGetTicket or
 * OrderSelect. Order property must be of the datetime, int type. There are 2
 * variants of the function.
 *
 * @param property_id Identifier of the order property. The value can be one of
 * the values of the ENUM_ORDER_PROPERTY_INTEGER enumeration.
 * @param long_var Variable of the long type that accepts the value of the
 * requested property.
 * @returns Value of the long type. If the function fails, 0 is returned.
 */
long OrderGetInteger(ENUM_ORDER_PROPERTY_INTEGER property_id);
bool OrderGetInteger(ENUM_ORDER_PROPERTY_INTEGER property_id, long& long_var);

/**
 * Returns the requested order property, pre-selected using OrderGetTicket or
 * OrderSelect. The order property must be of the string type. There are 2
 * variants of the function.
 *
 * @param property_id Identifier of the order property. The value can be one of
 * the values of the ENUM_ORDER_PROPERTY_STRING enumeration.
 * @param string_var Variable of the string type that accepts the value of the
 * requested property.
 * @returns Value of the string type.
 */
string OrderGetString(ENUM_ORDER_PROPERTY_STRING property_id);
bool OrderGetString(ENUM_ORDER_PROPERTY_STRING property_id, string& string_var);

/**
 * Retrieves the history of deals and orders for the specified period of server
 * time.
 *
 * @param from_date Start date of the request.
 * @param to_date End date of the request.
 * @returns It returns true if successful, otherwise returns false.
 */
bool HistorySelect(datetime from_date, datetime to_date);

/**
 * Retrieves the history of deals and orders having the specified position
 * identifier.
 *
 * @param position_id Position identifier that is set to every executed order
 * and every deal.
 * @returns It returns true if successful, otherwise returns false.
 */
bool HistorySelectByPosition(long position_id);

/**
 * Selects an order from the history for further calling it through appropriate
 * functions. It returns true if the function has been successfully completed.
 * Returns false if the function has failed. For more details on error call
 * GetLastError().
 *
 * @param ticket Order ticket.
 * @returns Returns true if successful, otherwise false.
 */
bool HistoryOrderSelect(ulong ticket);

/**
 * Returns the number of orders in the history. Prior to calling
 * HistoryOrdersTotal(), first it is necessary to receive the history of deals
 * and orders using the HistorySelect() or HistorySelectByPosition() function.
 *
 * @returns Value of the int type.
 */
int HistoryOrdersTotal();

/**
 * Return the ticket of a corresponding order in the history. Prior to calling
 * HistoryOrderGetTicket(), first it is necessary to receive the history of
 * deals and orders using the HistorySelect() or HistorySelectByPosition()
 * function.
 *
 * @param index Number of the order in the list of orders.
 * @returns Value of the ulong type. If the function fails, 0 is returned.
 */
ulong HistoryOrderGetTicket(int index);

/**
 * Returns the requested order property. The order property must be of the
 * double type. There are 2 variants of the function.
 *
 * @param ticket_number Order ticket.
 * @param property_id Identifier of the order property. The value can be one of
 * the values of the ENUM_ORDER_PROPERTY_DOUBLE enumeration.
 * @param double_var Variable of the double type that accepts the value of the
 * requested property.
 * @returns Value of the double type.
 */
double HistoryOrderGetDouble(ulong ticket_number,
                             ENUM_ORDER_PROPERTY_DOUBLE property_id);
bool HistoryOrderGetDouble(ulong ticket_number,
                           ENUM_ORDER_PROPERTY_DOUBLE property_id,
                           double& double_var);

/**
 * Returns the requested property of an order. The order property must be of
 * datetime, int type. There are 2 variants of the function.
 *
 * @param ticket_number Order ticket.
 * @param property_id Identifier of the order property. The value can be one of
 * the values of the ENUM_ORDER_PROPERTY_INTEGER enumeration.
 * @param long_var Variable of the long type that accepts the value of the
 * requested property.
 * @returns Value of the long type.
 */
long HistoryOrderGetInteger(ulong ticket_number,
                            ENUM_ORDER_PROPERTY_INTEGER property_id);
bool HistoryOrderGetInteger(ulong ticket_number,
                            ENUM_ORDER_PROPERTY_INTEGER property_id,
                            long& long_var);

/**
 * Returns the requested property of an order. The order property must be of the
 * string type. There are 2 variants of the function.
 *
 * @param ticket_number Order ticket.
 * @param property_id Identifier of the order property. The value can be one of
 * the values of the ENUM_ORDER_PROPERTY_STRING enumeration.
 * @param string_var Variable of the string type.
 * @returns Value of the string type.
 */
string HistoryOrderGetString(ulong ticket_number,
                             ENUM_ORDER_PROPERTY_STRING property_id);
bool HistoryOrderGetString(ulong ticket_number,
                           ENUM_ORDER_PROPERTY_STRING property_id,
                           string& string_var);

/**
 * Selects a deal in the history for further calling it through appropriate
 * functions. It returns true if the function has been successfully completed.
 * Returns false if the function has failed. For more details on error call
 * GetLastError().
 *
 * @param ticket Deal ticket.
 * @returns Returns true if successful, otherwise false.
 */
bool HistoryDealSelect(ulong ticket);

/**
 * Returns the number of deal in history. Prior to calling HistoryDealsTotal(),
 * first it is necessary to receive the history of deals and orders using the
 * HistorySelect() or HistorySelectByPosition() function.
 *
 * @returns Value of the int type.
 */
int HistoryDealsTotal();

/**
 * The function selects a deal for further processing and returns the deal
 * ticket in history. Prior to calling HistoryDealGetTicket(), first it is
 * necessary to receive the history of deals and orders using the
 * HistorySelect() or HistorySelectByPosition() function.
 *
 * @param index Number of a deal in the list of deals
 * @returns Value of the ulong type. If the function fails, 0 is returned.
 */
ulong HistoryDealGetTicket(int index);

/**
 * Returns the requested property of a deal. The deal property must be of the
 * double type. There are 2 variants of the function.
 *
 * @param ticket_number Deal ticket.
 * @param property_id Identifier of a deal property. The value can be one of the
 * values of the ENUM_DEAL_PROPERTY_DOUBLE enumeration.
 * @param double_var Variable of the double type that accepts the value of the
 * requested property.
 * @returns Value of the double type.
 */
double HistoryDealGetDouble(ulong ticket_number,
                            ENUM_DEAL_PROPERTY_DOUBLE property_id);
bool HistoryDealGetDouble(ulong ticket_number,
                          ENUM_DEAL_PROPERTY_DOUBLE property_id,
                          double& double_var);

/**
 * Returns the requested property of a deal. The deal property must be of the
 * datetime, int type. There are 2 variants of the function.
 *
 * @param ticket_number Trade ticket.
 * @param property_id Identifier of the deal property. The value can be one of
 * the values of the ENUM_DEAL_PROPERTY_INTEGER enumeration.
 * @param long_var Variable of the long type that accepts the value of the
 * requested property.
 * @returns Value of the long type.
 */
long HistoryDealGetInteger(ulong ticket_number,
                           ENUM_DEAL_PROPERTY_INTEGER property_id);
bool HistoryDealGetInteger(ulong ticket_number,
                           ENUM_DEAL_PROPERTY_INTEGER property_id,
                           long& long_var);

/**
 * Returns the requested property of a deal. The deal property must be of the
 * string type. There are 2 variants of the function.
 *
 * @param ticket_number Deal ticket.
 * @param property_id Identifier of the deal property. The value can be one of
 * the values of the ENUM_DEAL_PROPERTY_STRING enumeration.
 * @param string_var Variable of the string type that accepts the value of the
 * requested property.
 * @returns Value of the string type.
 */
string HistoryDealGetString(ulong ticket_number,
                            ENUM_DEAL_PROPERTY_STRING property_id);
bool HistoryDealGetString(ulong ticket_number,
                          ENUM_DEAL_PROPERTY_STRING property_id,
                          string& string_var);
