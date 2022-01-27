#include "Include/enums/symbol.mqh"
#include "Include/enums/trade.mqh"
#include "Include/global_variables.mqh"
#include "Include/types/data_types.mqh"
#include "Include/types/history.mqh"
#include "Include/types/order_book.mqh"
#include "Include/types/price.mqh"

/**
 * Creates a custom symbol with the specified name in the specified group.
 *
 * @param symbol_name Custom symbol name. It should not contain groups or
 * subgroups the symbol is located in.
 * @param symbol_path The group name a symbol is located in.
 * @param symbol_origin Name of a symbol the properties of a created custom
 * symbol are to be copied from. After creating a custom symbol, any property
 * value can be changed to a necessary one using the appropriate functions.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolCreate(const string symbol_name,
                        const string symbol_path = "",
                        const string symbol_origin = "");

/**
 * Deletes a custom symbol with the specified name.
 *
 * @param symbol Custom symbol name. It should not match the name of an already
 * existing symbol.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolDelete(const string symbol_name);

/**
 * Sets the integer type property value for a custom symbol.
 *
 * @param symbol_name Custom symbol name.
 * @param property_id Symbol property ID. The value can be one of the values of
 * the ENUM_SYMBOL_INFO_INTEGER enumeration.
 * @param property_value A long type variable containing the property value.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolSetInteger(const string symbol_name,
                            ENUM_SYMBOL_INFO_INTEGER property_id,
                            long property_value);

/**
 * Sets the real type property value for a custom symbol.
 *
 * @param symbol_name Custom symbol name.
 * @param property_id Symbol property ID. The value can be one of the values of
 * the ENUM_SYMBOL_INFO_DOUBLE enumeration.
 * @param property_value A double type variable containing the property value.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolSetDouble(const string symbol_name,
                           ENUM_SYMBOL_INFO_DOUBLE property_id,
                           double property_value);

/**
 * Sets the string type property value for a custom symbol.
 *
 * @param symbol_name Custom symbol name.
 * @param property_id Symbol property ID. The value can be one of the values of
 * the ENUM_SYMBOL_INFO_STRING enumeration.
 * @param property_value A string type variable containing the property value.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolSetString(const string symbol_name,
                           ENUM_SYMBOL_INFO_STRING property_id,
                           string property_value);

/**
 * Sets the margin rates depending on the order type and direction for a custom
 * symbol.
 *
 * @param symbol_name Custom symbol name.
 * @param order_type Order type.
 * @param initial_margin_rate A double type variable with an initial margin
 * rate. Initial margin is a security deposit for 1 lot deal in the appropriate
 * direction. Multiplying the rate by the initial margin, we receive the amount
 * of funds to be reserved on the account when placing an order of the specified
 * type.
 * @param maintenance_margin_rate A double type variable with a maintenance
 * margin rate. Maintenance margin is a minimum amount for maintaining an open
 * position of 1 lot in the appropriate direction. Multiplying the rate by the
 * maintenance margin, we receive the amount of funds to be reserved on the
 * account after an order of the specified type is activated.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolSetMarginRate(const string symbol_name,
                               ENUM_ORDER_TYPE order_type,
                               double initial_margin_rate,
                               double maintenance_margin_rate);

/**
 * Sets the start and end time of the specified quotation session for the
 * specified symbol and week day.
 *
 * @param symbol_name Custom symbol name.
 * @param ENUM_DAY_OF_WEEK Week day, value from the ENUM_DAY_OF_WEEK
 * enumeration.
 * @param uint Index of the session, for which start and end times are to be
 * set. Session indexing starts from 0.
 * @param from Session start time in seconds from 00:00, data value in the
 * variable is ignored.
 * @param to Session end time in seconds from 00:00, data value in the variable
 * is ignored.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolSetSessionQuote(const string symbol_name,
                                 ENUM_DAY_OF_WEEK day_of_week,
                                 uint session_index,
                                 datetime from,
                                 datetime to);

/**
 * Sets the start and end time of the specified trading session for the
 * specified symbol and week day.
 *
 * @param symbol_name Custom symbol name.
 * @param ENUM_DAY_OF_WEEK Week day, value from the ENUM_DAY_OF_WEEK
 * enumeration.
 * @param uint Index of the session, for which start and end times are to be
 * set. Session indexing starts from 0.
 * @param from Session start time in seconds from 00:00, data value in the
 * variable is ignored.
 * @param to Session end time in seconds from 00:00, data value in the variable
 * is ignored.
 * @returns true – success, otherwise – false. To get information about the
 * error, call the GetLastError() function.
 */
bool CustomSymbolSetSessionTrade(const string symbol_name,
                                 ENUM_DAY_OF_WEEK day_of_week,
                                 uint session_index,
                                 datetime from,
                                 datetime to);

/**
 * Deletes all bars from the price history of the custom symbol in the specified
 * time interval.
 *
 * @param symbol Custom symbol name.
 * @param from Time of the first bar in the price history within the specified
 * range to be removed.
 * @param to Time of the last bar in the price history within the specified
 * range to be removed.
 * @returns Number of deleted bars or -1 in case of an error.
 */
int CustomRatesDelete(const string symbol, datetime from, datetime to);

/**
 * Fully replaces the price history of the custom symbol within the specified
 * time interval with the data from the MqlRates type array.
 *
 * @param symbol Custom symbol name.
 * @param from Time of the first bar in the price history within the specified
 * range to be updated.
 * @param to Time of the last bar in the price history within the specified
 * range to be updated.
 * @param rates Array of the MqlRates type history data for M1.
 * @param count Number of the rates[] array elements to be used for replacement.
 * WHOLE_ARRAY means that all rates[] array elements should be used for
 * replacement.
 * @returns Number of updated bars or -1 in case of an error.
 */
int CustomRatesReplace(const string symbol,
                       datetime from,
                       datetime to,
                       const MqlRates rates[],
                       uint count = WHOLE_ARRAY);

/**
 * Adds missing bars to the custom symbol history and replaces existing data
 * with the ones from the MqlRates type array.
 *
 * @param symbol Custom symbol name.
 * @param rates Array of the MqlRates type history data for M1.
 * @param count Number of the rates[] array elements to be used for update.
 * WHOLE_ARRAY means that all rates[] array elements should be used.
 * @returns Number of updated bars or -1 in case of an error.
 */
int CustomRatesUpdate(const string symbol,
                      const MqlRates rates[],
                      uint count = WHOLE_ARRAY);

/**
 * Adds data from an array of the MqlTick type to the price history of a custom
 * symbol. The custom symbol must be selected in the Market Watch window.
 *
 * @param symbol The name of the custom symbol.
 * @param ticks An array of tick data of the MqlTick type arranged in order of
 * time from earlier data to more recent ones, i.e. ticks[k].time_msc <=
 * ticks[n].time_msc, if k<n.
 * @param count Number of the ticks[] array elements to be used for adding.
 * WHOLE_ARRAY means that all ticks[] array elements should be used.
 * @returns The number of added ticks or -1 in case of an error.
 */
int CustomTicksAdd(const string symbol,
                   const MqlTick ticks[],
                   uint count = WHOLE_ARRAY);

/**
 * Deletes all ticks from the price history of the custom symbol in the
 * specified time interval.
 *
 * @param symbol Custom symbol name.
 * @param from_msc Time of the first tick in the price history within the
 * specified range to be removed. Time in milliseconds since 01.01.1970.
 * @param to_msc Time of the last tick in the price history within the specified
 * range to be removed. Time in milliseconds since 01.01.1970.
 * @returns Number of deleted ticks or -1 in case of an error.
 */
int CustomTicksDelete(const string symbol, long from_msc, long to_msc);

/**
 * Fully replaces the price history of the custom symbol within the specified
 * time interval with the data from the MqlTick type array.
 *
 * @param symbol Custom symbol name.
 * @param from_msc Time of the first tick in the price history within the
 * specified range to be removed. Time in milliseconds since 01.01.1970.
 * @param to_msc Time of the last tick in the price history within the specified
 * range to be removed. Time in milliseconds since 01.01.1970.
 * @param ticks Array of the MqlTick type tick data ordered in time in ascending
 * order.
 * @param count Number of the ticks[] array elements to be used for replacement
 * in the specified time interval. WHOLE_ARRAY means that all ticks[] array
 * elements should be used.
 * @returns Number of updated ticks or -1 in case of an error.
 */
int CustomTicksReplace(const string symbol,
                       long from_msc,
                       long to_msc,
                       const MqlTick ticks[],
                       uint count = WHOLE_ARRAY);

/**
 * Passes the status of the Depth of Market for a custom symbol. The function
 * allows broadcasting the Depth of Market as if the prices arrive from a
 * broker's server.
 *
 * @param symbol Custom symbol name.
 * @param books The array of MqlBookInfo type data fully describing the Depth of
 * Market status — all buy and sell requests. The passed Depth of Market status
 * completely replaces the previous one.
 * @param count The number of 'books' array elements to be passed to the
 * function. The entire array is used by default.
 * @returns Number of added ticks or -1 in case of an error.
 */
int CustomBookAdd(const string symbol,
                  const MqlBookInfo books[],
                  uint count = WHOLE_ARRAY);
