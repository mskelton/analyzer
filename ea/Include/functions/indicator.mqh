#include "Include/enums/timeseries.mqh"
#include "Include/global_variables.mqh"
#include "Include/types/data_types.mqh"

/**
 * Returns the number of bars of a corresponding symbol and period, available in
 * history.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @returns The number of bars of a corresponding symbol and period, available
 * in history, but no more than allowed by the "Max bars in chart" parameter in
 * platform settings.
 */
int iBars(const string symbol, ENUM_TIMEFRAMES timeframe);

/**
 * Search bar by time. The function returns the index of the bar corresponding
 * to the specified time.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. PERIOD_CURRENT means the current chart period.
 * @param time Time value to search for.
 * @param exact A return value, in case the bar with the specified time is not
 * found. If exact=false, iBarShift returns the index of the nearest bar, the
 * Open time of which is less than the specified time (time_open<time). If such
 * a bar is not found (history before the specified time is not available), then
 * the function returns -1. If exact=true, iBarShift does not search for a
 * nearest bar but immediately returns -1.
 * @returns The index of the bar corresponding to the specified time. If the bar
 * corresponding to the specified time is not found (there is a gap in the
 * history), the function returns -1 or the index of the nearest bar (depending
 * on the 'exact' parameter).
 */
int iBarShift(const string symbol,
              ENUM_TIMEFRAMES timeframe,
              datetime time,
              bool exact = false);

/**
 * Returns the Close price of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The Close price of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
double iClose(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the Close price of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The Close price of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
double iClose(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the index of the highest value found on the corresponding chart
 * (shift relative to the current bar).
 *
 * @param symbol The symbol, on which the search will be performed. NULL means
 * the current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param type The identifier of the timeseries, in which the search will be
 * performed. Can be equal to any value from ENUM_SERIESMODE.
 * @param count The number of elements in the timeseries (from the current bar
 * towards index increasing direction), among which the search should be
 * performed.
 * @param start The index (shift relative to the current bar) of the initial
 * bar, from which search for the highest value begins. Negative values
 * ​​are ignored and replaced with a zero value.
 * @returns The index of the highest value found on the corresponding chart
 * (shift relative to the current bar) or -1 in case of an error. For error
 * details, call the GetLastError() function.
 */
int iHighest(const string symbol,
             ENUM_TIMEFRAMES timeframe,
             ENUM_SERIESMODE type,
             int count = WHOLE_ARRAY,
             int start = 0);

/**
 * Returns the Low price of the bar (indicated by the 'shift' parameter) on the
 * corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The Low price of the bar (indicated by the 'shift' parameter) on the
 * corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
double iLow(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the index of the smallest value found on the corresponding chart
 * (shift relative to the current bar).
 *
 * @param symbol The symbol, on which the search will be performed. NULL means
 * the current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param type The identifier of the timeseries, in which the search will be
 * performed. Can be equal to any value from ENUM_SERIESMODE.
 * @param count The number of elements in the timeseries (from the current bar
 * towards index increasing direction), among which the search should be
 * performed.
 * @param start The index (shift relative to the current bar) of the initial
 * bar, from which search for the lowest value begins. Negative values ​​are
 * ignored and replaced with a zero value.
 * @returns The index of the lowest value found on the corresponding chart
 * (shift relative to the current bar) or -1 in case of an error. For error
 * details, call the GetLastError() function.
 */
int iLowest(const string symbol,
            ENUM_TIMEFRAMES timeframe,
            ENUM_SERIESMODE type,
            int count = WHOLE_ARRAY,
            int start = 0);

/**
 * Returns the Open price of the bar (indicated by the 'shift' parameter) on the
 * corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The Open price of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
double iOpen(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the opening time of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The opening time of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
datetime iTime(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the tick volume of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The tick volume of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
long iTickVolume(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the real volume of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The real volume of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
long iRealVolume(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the tick volume of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The tick volume of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
long iVolume(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);

/**
 * Returns the spread value of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart.
 *
 * @param symbol The symbol name of the financial instrument. NULL means the
 * current symbol.
 * @param timeframe Period. It can be one of the values of the ENUM_TIMEFRAMES
 * enumeration. 0 means the current chart period.
 * @param shift The index of the received value from the timeseries (backward
 * shift by specified number of bars relative to the current bar).
 * @returns The Spread value of the bar (indicated by the 'shift' parameter) on
 * the corresponding chart or 0 in case of an error. For error details, call the
 * GetLastError() function.
 */
long iSpread(const string symbol, ENUM_TIMEFRAMES timeframe, int shift);
