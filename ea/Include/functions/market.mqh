#include "Include/types/data_types.mqh"

/**
 * Returns the number of available (selected in Market Watch or all) symbols.
 *
 * @param selected Request mode. Can be true or false.
 * @returns If the 'selected' parameter is true, the function returns the number
 * of symbols selected in MarketWatch. If the value is false, it returns the
 * total number of all symbols.
 */
int SymbolsTotal(bool selected);

/**
 * Checks if a symbol with a specified name exists.
 *
 * @param name Symbol name.
 * @param is_custom Custom symbol property set upon successful execution. If
 * true, the detected symbol is a custom one.
 * @returns If false, the symbol is not found among standard and custom ones.
 */
bool SymbolExist(const string name, bool& is_custom);

/**
 * Returns the name of a symbol.
 *
 * @param pos Order number of a symbol.
 * @param selected Request mode. If the value is true, the symbol is taken from
 * the list of symbols selected in MarketWatch. If the value is false, the
 * symbol is taken from the general list.
 * @returns Value of string type with the symbol name.
 */
string SymbolName(int pos, bool selected);

/**
 * Selects a symbol in the Market Watch window or removes a symbol from the
 * window.
 *
 * @param name Symbol name.
 * @param select Switch. If the value is false, a symbol should be removed from
 * MarketWatch, otherwise a symbol should be selected in this window. A symbol
 * can't be removed if the symbol chart is open, or there are open positions for
 * this symbol.
 * @returns In case of failure returns false.
 */
bool SymbolSelect(string name, bool select);

/**
 * The function checks whether data of a selected symbol in the terminal are
 * synchronized with data on the trade server.
 *
 * @param name Symbol name.
 * @returns If data are synchronized, returns 'true'; otherwise returns 'false'.
 */
bool SymbolIsSynchronized(string name);

/**
 * Returns the corresponding property of a specified symbol. There are 2
 * variants of the function.
 *
 * @param name Symbol name.
 * @param prop_id Identifier of a symbol property. The value can be one of the
 * values of the ENUM_SYMBOL_INFO_DOUBLE enumeration.
 * @param double_var Variable of double type receiving the value of the
 * requested property.
 * @returns The value of double type. In case of execution failure, information
 * about the error can be obtained using GetLastError() function:
 */
double SymbolInfoDouble(string name, ENUM_SYMBOL_INFO_DOUBLE prop_id);
bool SymbolInfoDouble(string name,
                      ENUM_SYMBOL_INFO_DOUBLE prop_id,
                      double& double_var);

/**
 * Returns the corresponding property of a specified symbol. There are 2
 * variants of the function.
 *
 * @param name Symbol name.
 * @param prop_id Identifier of a symbol property. The value can be one of the
 * values of the ENUM_SYMBOL_INFO_INTEGER enumeration.
 * @param long_var Variable of the long type receiving the value of the
 * requested property.
 * @returns The value of long type. In case of execution failure, information
 * about the error can be obtained using GetLastError() function:
 */
long SymbolInfoInteger(string name, ENUM_SYMBOL_INFO_INTEGER prop_id);
bool SymbolInfoInteger(string name,
                       ENUM_SYMBOL_INFO_INTEGER prop_id,
                       long& long_var);

/**
 * Returns the corresponding property of a specified symbol. There are 2
 * variants of the function.
 *
 * @param name Symbol name.
 * @param prop_id Identifier of a symbol property. The value can be one of the
 * values of the ENUM_SYMBOL_INFO_STRING enumeration.
 * @param string_var Variable of the string type receiving the value of the
 * requested property.
 * @returns The value of string type. In case of execution failure, information
 * about the error can be obtained using GetLastError() function:
 */
string SymbolInfoString(string name, ENUM_SYMBOL_INFO_STRING prop_id);
bool SymbolInfoString(string name,
                      ENUM_SYMBOL_INFO_STRING prop_id,
                      string& string_var);

/**
 * Returns the margin rates depending on the order type and direction.
 *
 * @param name Symbol name.
 * @param order_type Order type.
 * @param initial_margin_rate A double type variable for receiving an initial
 * margin rate. Initial margin is a security deposit for 1 lot deal in the
 * appropriate direction. Multiplying the rate by the initial margin, we receive
 * the amount of funds to be reserved on the account when placing an order of
 * the specified type.
 * @param maintenance_margin_rate A double type variable for receiving a
 * maintenance margin rate. Maintenance margin is a minimum amount for
 * maintaining an open position of 1 lot in the appropriate direction.
 * Multiplying the rate by the maintenance margin, we receive the amount of
 * funds to be reserved on the account after an order of the specified type is
 * activated.
 * @returns Returns true if request for properties is successful, otherwise
 * false.
 */
bool SymbolInfoMarginRate(string name,
                          ENUM_ORDER_TYPE order_type,
                          double& initial_margin_rate,
                          double& maintenance_margin_rate);

/**
 * The function returns current prices of a specified symbol in a variable of
 * the MqlTick type.
 *
 * @param symbol Symbol name.
 * @param tick Link to the structure of the MqlTick type, to which the current
 * prices and time of the last price update will be placed.
 * @returns The function returns true if successful, otherwise returns false.
 */
bool SymbolInfoTick(string symbol, MqlTick& tick);

/**
 * Allows receiving time of beginning and end of the specified quoting sessions
 * for a specified symbol and day of week.
 *
 * @param name Symbol name.
 * @param ENUM_DAY_OF_WEEK Day of the week, value of enumeration
 * ENUM_DAY_OF_WEEK.
 * @param uint Ordinal number of a session, whose beginning and end time we want
 * to receive. Indexing of sessions starts with 0.
 * @param from Session beginning time in seconds from 00 hours 00 minutes, in
 * the returned value date should be ignored.
 * @param to Session end time in seconds from 00 hours 00 minutes, in the
 * returned value date should be ignored.
 * @returns If data for the specified session, symbol and day of the week are
 * received, returns true, otherwise returns false.
 */
bool SymbolInfoSessionQuote(string name,
                            ENUM_DAY_OF_WEEK day_of_week,
                            uint session_index,
                            datetime& from,
                            datetime& to);

/**
 * Allows receiving time of beginning and end of the specified trading sessions
 * for a specified symbol and day of week.
 *
 * @param name Symbol name.
 * @param ENUM_DAY_OF_WEEK Day of the week, value of enumeration
 * ENUM_DAY_OF_WEEK.
 * @param uint Ordinal number of a session, whose beginning and end time we want
 * to receive. Indexing of sessions starts with 0.
 * @param from Session beginning time in seconds from 00 hours 00 minutes, in
 * the returned value date should be ignored.
 * @param to Session end time in seconds from 00 hours 00 minutes, in the
 * returned value date should be ignored.
 * @returns If data for the specified session, symbol and day of the week are
 * received, returns true, otherwise returns false.
 */
bool SymbolInfoSessionTrade(string name,
                            ENUM_DAY_OF_WEEK day_of_week,
                            uint session_index,
                            datetime& from,
                            datetime& to);

/**
 * Provides opening of Depth of Market for a selected symbol, and subscribes for
 * receiving notifications of the DOM changes.
 *
 * @param symbol The name of a symbol, whose Depth of Market is to be used in
 * the Expert Advisor or script.
 * @returns The true value if opened successfully, otherwise false.
 */
bool MarketBookAdd(string symbol);

/**
 * Provides closing of Depth of Market for a selected symbol, and cancels the
 * subscription for receiving notifications of the DOM changes.
 *
 * @param symbol Symbol name.
 * @returns The true value if closed successfully, otherwise false.
 */
bool MarketBookRelease(string symbol);

/**
 * Returns a structure array MqlBookInfo containing records of the Depth of
 * Market of a specified symbol.
 *
 * @param symbol Symbol name.
 * @param book Reference to an array of Depth of Market records. The array can
 * be pre-allocated for a sufficient number of records. If a dynamic array
 * hasn't been pre-allocated in the operating memory, the client terminal will
 * distribute the array itself.
 * @returns Returns true in case of success, otherwise false.
 */
bool MarketBookGet(string symbol, MqlBookInfo book[]);
