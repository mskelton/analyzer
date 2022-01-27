#include "Include/enums/indicator.mqh"
#include "Include/enums/timeseries.mqh"
#include "Include/types/data_types.mqh"
#include "Include/types/history.mqh"
#include "Include/types/price.mqh"

/**
 * Returns information about the state of historical data. There are 2 variants
 * of function calls.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param prop_id Identifier of the requested property, value of the
 * ENUM_SERIES_INFO_INTEGER enumeration.
 * @param long_var Variable to which the value of the requested property is
 * placed.
 * @returns In the first case, it returns value of the long type.
 *
 * For the second case,  it returns true, if the specified property is available
 * and its value has been placed into long_var variable, otherwise it returns
 * false. For more details about an error, call GetLastError().
 */
long SeriesInfoInteger(string symbol_name,
                       ENUM_TIMEFRAMES timeframe,
                       ENUM_SERIES_INFO_INTEGER prop_id);
bool SeriesInfoInteger(string symbol_name,
                       ENUM_TIMEFRAMES timeframe,
                       ENUM_SERIES_INFO_INTEGER prop_id,
                       long& long_var);

/**
 * Returns the number of bars count in the history for a specified symbol and
 * period. There are 2 variants of functions calls.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_time Bar time corresponding to the first element.
 * @param stop_time Bar time corresponding to the last element.
 * @returns If the start_time and stop_time parameters are defined, the function
 * returns the number of bars in the specified time interval, otherwise it
 * returns the total number of bars.
 */
int Bars(string symbol_name, ENUM_TIMEFRAMES timeframe);
int Bars(string symbol_name,
         ENUM_TIMEFRAMES timeframe,
         datetime start_time,
         datetime stop_time);

/**
 * Returns the number of calculated data for the specified indicator.
 *
 * @param indicator_handle The indicator handle, returned by the corresponding
 * indicator function.
 * @returns Returns the amount of calculated data in the indicator buffer or -1
 * in the case of error (data not calculated yet)
 */
int BarsCalculated(int indicator_handle);

/**
 * The function returns the handle of a specified technical indicator created
 * based on the array of parameters of MqlParam type.
 *
 * @param symbol Name of a symbol, on data of which the indicator is calculated.
 * NULL means the current symbol.
 * @param period The value of the timeframe can be one of values of the
 * ENUM_TIMEFRAMES enumeration, 0 means the current timeframe.
 * @param indicator_type Indicator type, can be one of values of the
 * ENUM_INDICATOR enumeration.
 * @param parameters_cnt The number of parameters passed in the
 * parameters_array[] array. The array elements have a special structure type
 * MqlParam. By default, zero - parameters are not passed. If you specify a
 * non-zero number of parameters, the parameter parameters_array is obligatory.
 * You can pass no more than 64 parameters.
 * @param parameters_array An array of MqlParam type, whose elements contain the
 * type and value of each input parameter of a technical indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE.
 */
int IndicatorCreate(string symbol,
                    ENUM_TIMEFRAMES period,
                    ENUM_INDICATOR indicator_type,
                    int parameters_cnt = 0,
                    const MqlParam parameters_array[] = NULL);

/**
 * Based on the specified handle, returns the number of input parameters of the
 * indicator, as well as the values and types of the parameters.
 *
 * @param indicator_handle The handle of the indicator, for which you need to
 * know the number of parameters its is calculated on.
 * @param indicator_type A variable if the ENUM_INDICATOR type, into which the
 * indicator type will be written.
 * @param parameters A dynamic array for receiving values of the MqlParam type,
 * into which the list of indicator parameters will be written. The array size
 * is returned by the IndicatorParameters() function.
 * @returns The number of input parameters of the indicator with the specified
 * handle. In case of an error returns -1. For more details about the error call
 * the GetLastError() function.
 */
int IndicatorParameters(int indicator_handle,
                        ENUM_INDICATOR& indicator_type,
                        MqlParam parameters[]);

/**
 * The function removes an indicator handle and releases the calculation block
 * of the indicator, if it's not used by anyone else.
 *
 * @returns Returns true in case of success, otherwise returns false.
 */
bool IndicatorRelease(int indicator_handle);

/**
 * Gets data of a specified buffer of a certain indicator in the necessary
 * quantity.
 *
 * @param indicator_handle The indicator handle, returned by the corresponding
 * indicator function.
 * @param buffer_num The indicator buffer number.
 * @param start_pos The position of the first element to copy.
 * @param count Data count to copy.
 * @param start_time Bar time, corresponding to the first element.
 * @param stop_time Bar time, corresponding to the last element.
 * @param buffer Array of double type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopyBuffer(int indicator_handle,
               int buffer_num,
               int start_pos,
               int count,
               double buffer[]);
int CopyBuffer(int indicator_handle,
               int buffer_num,
               datetime start_time,
               int count,
               double buffer[]);
int CopyBuffer(int indicator_handle,
               int buffer_num,
               datetime start_time,
               datetime stop_time,
               double buffer[]);

/**
 * Gets history data of MqlRates structure of a specified symbol-period in
 * specified quantity into the rates_array array. The elements ordering of the
 * copied data is from present to the past, i.e., starting position of 0 means
 * the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_time Bar time for the first element to copy.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param rates_array Array of MqlRates type.
 * @returns Returns the number of copied elements or -1 in case of an error.
 */
int CopyRates(string symbol_name,
              ENUM_TIMEFRAMES timeframe,
              int start_pos,
              int count,
              MqlRates rates_array[]);
int CopyRates(string symbol_name,
              ENUM_TIMEFRAMES timeframe,
              datetime start_time,
              int count,
              MqlRates rates_array[]);
int CopyRates(string symbol_name,
              ENUM_TIMEFRAMES timeframe,
              datetime start_time,
              datetime stop_time,
              MqlRates rates_array[]);

/**
 * The function gets to time_array history data of bar opening time for the
 * specified symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time Bar time corresponding to the last element to copy.
 * @param time_array Array of datetime type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopyTime(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             int start_pos,
             int count,
             datetime time_array[]);
int CopyTime(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             datetime start_time,
             int count,
             datetime time_array[]);
int CopyTime(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             datetime start_time,
             datetime stop_time,
             datetime time_array[]);

/**
 * The function gets into open_array the history data of bar open prices for the
 * selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time The start time for the last element to copy.
 * @param open_array Array of double type.
 * @returns Returns the number of element in the array or -1 in case of an
 * error.
 */
int CopyOpen(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             int start_pos,
             int count,
             double open_array[]);
int CopyOpen(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             datetime start_time,
             int count,
             double open_array[]);
int CopyOpen(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             datetime start_time,
             datetime stop_time,
             double open_array[]);

/**
 * The function gets into high_array the history data of highest bar prices for
 * the selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param high_array Array of double type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopyHigh(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             int start_pos,
             int count,
             double high_array[]);
int CopyHigh(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             datetime start_time,
             int count,
             double high_array[]);
int CopyHigh(string symbol_name,
             ENUM_TIMEFRAMES timeframe,
             datetime start_time,
             datetime stop_time,
             double high_array[]);

/**
 * The function gets into low_array the history data of minimal bar prices for
 * the selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time Bar time, corresponding to the first element to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param low_array Array of double type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopyLow(string symbol_name,
            ENUM_TIMEFRAMES timeframe,
            int start_pos,
            int count,
            double low_array[]);
int CopyLow(string symbol_name,
            ENUM_TIMEFRAMES timeframe,
            datetime start_time,
            int count,
            double low_array[]);
int CopyLow(string symbol_name,
            ENUM_TIMEFRAMES timeframe,
            datetime start_time,
            datetime stop_time,
            double low_array[]);

/**
 * The function gets into close_array the history data of bar close prices for
 * the selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param close_array Array of double type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopyClose(string symbol_name,
              ENUM_TIMEFRAMES timeframe,
              int start_pos,
              int count,
              double close_array[]);
int CopyClose(string symbol_name,
              ENUM_TIMEFRAMES timeframe,
              datetime start_time,
              int count,
              double close_array[]);
int CopyClose(string symbol_name,
              ENUM_TIMEFRAMES timeframe,
              datetime start_time,
              datetime stop_time,
              double close_array[]);

/**
 * The function gets into volume_array the history data of tick volumes for the
 * selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param volume_array Array of long type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopyTickVolume(string symbol_name,
                   ENUM_TIMEFRAMES timeframe,
                   int start_pos,
                   int count,
                   long volume_array[]);
int CopyTickVolume(string symbol_name,
                   ENUM_TIMEFRAMES timeframe,
                   datetime start_time,
                   int count,
                   long volume_array[]);
int CopyTickVolume(string symbol_name,
                   ENUM_TIMEFRAMES timeframe,
                   datetime start_time,
                   datetime stop_time,
                   long volume_array[]);

/**
 * The function gets into volume_array the history data of trade volumes for the
 * selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param volume_array Array of long type.
 * @returns Returns the copied data count or -1 in the case of error.
 */
int CopyRealVolume(string symbol_name,
                   ENUM_TIMEFRAMES timeframe,
                   int start_pos,
                   int count,
                   long volume_array[]);
int CopyRealVolume(string symbol_name,
                   ENUM_TIMEFRAMES timeframe,
                   datetime start_time,
                   int count,
                   long volume_array[]);
int CopyRealVolume(string symbol_name,
                   ENUM_TIMEFRAMES timeframe,
                   datetime start_time,
                   datetime stop_time,
                   long volume_array[]);

/**
 * The function gets into spread_array the history data of spread values for the
 * selected symbol-period pair in the specified quantity. It should be noted
 * that elements ordering is from present to past, i.e., starting position of 0
 * means the current bar.
 *
 * @param symbol_name Symbol name.
 * @param timeframe Period.
 * @param start_pos The start position for the first element to copy.
 * @param count Data count to copy.
 * @param start_time The start time for the first element to copy.
 * @param stop_time Bar time, corresponding to the last element to copy.
 * @param spread_array Array of int type.
 * @returns Returns the copied data count or -1 in case of an error.
 */
int CopySpread(string symbol_name,
               ENUM_TIMEFRAMES timeframe,
               int start_pos,
               int count,
               int spread_array[]);
int CopySpread(string symbol_name,
               ENUM_TIMEFRAMES timeframe,
               datetime start_time,
               int count,
               int spread_array[]);
int CopySpread(string symbol_name,
               ENUM_TIMEFRAMES timeframe,
               datetime start_time,
               datetime stop_time,
               int spread_array[]);

/**
 * The function receives ticks in the MqlTick format into ticks_array. In this
 * case, ticks are indexed from the past to the present, i.e. the 0 indexed tick
 * is the oldest one in the array. For tick analysis, check the flags field,
 * which shows what exactly has changed in the tick.
 *
 * @param symbol_name Symbol.
 * @param ticks_array An array of the MqlTick type for receiving ticks.
 * @param flags A flag to define the type of the requested ticks.
 * COPY_TICKS_INFO – ticks with Bid and/or Ask changes, COPY_TICKS_TRADE – ticks
 * with changes in Last and Volume, COPY_TICKS_ALL – all ticks. For any type of
 * request, the values of the previous tick are added to the remaining fields of
 * the MqlTick structure.
 * @param from The date from which you want to request ticks. In milliseconds
 * since 1970.01.01. If from=0, the last count ticks will be returned.
 * @param count The number of requested ticks. If the 'from' and 'count'
 * parameters are not specified, all available recent ticks (but not more than
 * 2000) will be written to ticks_array[].
 * @returns The number of copied tick or -1 in case of an error.
 */
int CopyTicks(string symbol_name,
              MqlTick ticks_array[],
              uint flags = COPY_TICKS_ALL,
              ulong from = 0,
              uint count = 0);

/**
 * The function receives ticks in the MqlTick format within the specified date
 * range to ticks_array. Indexing goes from the past to the present meaning that
 * a tick with the index 0 is the oldest one in the array. For tick analysis,
 * check the flags field, which shows what exactly has changed.
 *
 * @param symbol_name Symbol.
 * @param ticks_array MqlTick static or dynamic array for receiving ticks. If
 * the static array cannot hold all the ticks from the requested time interval,
 * the maximum possible amount of ticks is received. In this case, the function
 * generates the error ERR_HISTORY_SMALL_BUFFER (4407).
 * @param flags A flag to define the type of the requested ticks. For any type
 * of request, the values of the previous tick are added to the remaining fields
 * of the MqlTick structure.
 * @param from_msc The date, from which you want to request ticks. In
 * milliseconds since 1970.01.01. If the from_msc parameter is not specified,
 * ticks from the beginning of the history are sent. Ticks with the time >=
 * from_msc are sent.
 * @param to_msc The date, up to which you want to request ticks. In
 * milliseconds since 01.01.1970. Ticks with the time <= to_msc are sent. If the
 * to_msc parameter is not specified, all ticks up to the end of the history are
 * sent.
 * @returns The number of copied tick or -1 in case of an error. GetLastError()
 * is able to return the following errors:
 *
 * ERR_HISTORY_TIMEOUT – ticks synchronization waiting time is up, the function
 * has sent all it had.
 * ERR_HISTORY_SMALL_BUFFER – static buffer is too small. Only the amount the
 * array can store has been sent.
 * ERR_NOT_ENOUGH_MEMORY – insufficient memory for receiving a history from the
 * specified range to the dynamic tick array. Failed to allocate enough memory
 * for the tick array.
 */
int CopyTicksRange(const string symbol_name,
                   MqlTick ticks_array[],
                   uint flags = COPY_TICKS_ALL,
                   ulong from_msc = 0,
                   ulong to_msc = 0);
