#include "Include/types/data_types.mqh"
#include "Include/types/date.mqh"

/**
 * Returns the last known server time, time of the last quote receipt for one of
 * the symbols selected in the "Market Watch" window. In the OnTick() handler,
 * this function returns the time of the received handled tick. In other cases
 * (for example, call in handlers OnInit(), OnDeinit(), OnTimer() and so on)
 * this is the time of the last quote receipt for any symbol available in the
 * "Market Watch" window, the time shown in the title of this window. The time
 * value is formed on a trade server and does not depend on the time settings on
 * your computer. There are 2 variants of the function.
 *
 * @param dt_struct MqlDateTime structure type variable.
 * @returns Value of datetime type
 */
datetime TimeCurrent();
datetime TimeCurrent(MqlDateTime& dt_struct);

/**
 * Returns the calculated current time of the trade server. Unlike
 * TimeCurrent(), the calculation of the time value is performed in the client
 * terminal and depends on the time settings on your computer. There are 2
 * variants of the function.
 *
 * @param dt_struct Variable of structure type MqlDateTime.
 * @returns Value of datetime type
 */
datetime TimeTradeServer();
datetime TimeTradeServer(MqlDateTime& dt_struct);

/**
 * Returns the local time of a computer, where the client terminal is running.
 * There are 2 variants of the function.
 *
 * @param dt_struct Variable of structure type MqlDateTime.
 * @returns Value of datetime type
 */
datetime TimeLocal();
datetime TimeLocal(MqlDateTime& dt_struct);

/**
 * Returns the GMT, which is calculated taking into account the DST switch by
 * the local time on the computer where the client terminal is running. There
 * are 2 variants of the function.
 *
 * @param dt_struct Variable of structure type MqlDateTime.
 * @returns Value of datetime type
 */
datetime TimeGMT();
datetime TimeGMT(MqlDateTime& dt_struct);

/**
 * Returns correction for daylight saving time in seconds, if the switch to
 * summer time has been made. It depends on the time settings of your computer.
 *
 * @returns If switch to winter (standard) time has been made, it returns 0.
 */
int TimeDaylightSavings();

/**
 * Returns the current difference between GMT time and the local computer time
 * in seconds, taking into account switch to winter or summer time. Depends on
 * the time settings of your computer.
 *
 * @returns The value of int type, representing the current difference between
 * GMT time and the local time of the computer TimeLocal in seconds.
 */
int TimeGMTOffset();

/**
 * Converts a value of datetime type (number of seconds since 01.01.1970) into a
 * structure variable MqlDateTime.
 *
 * @param dt Date value to convert.
 * @param dt_struct Variable of structure type MqlDateTime.
 * @returns True if successful, otherwise false. To get information about the
 * error, call the GetLastError() function.
 */
bool TimeToStruct(datetime dt, MqlDateTime& dt_struct);

/**
 * Converts a structure variable MqlDateTime into a value of datetime type and
 * returns the resulting value.
 *
 * @param dt_struct Variable of structure type MqlDateTime.
 * @returns The value of datetime type containing the number of seconds since
 * 01.01.1970.
 */
datetime StructToTime(MqlDateTime& dt_struct);
