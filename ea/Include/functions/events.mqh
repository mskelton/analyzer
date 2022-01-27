#include "Include/types/data_types.mqh"

/**
 * The function indicates to the client terminal that timer events should be
 * generated at intervals less than one second for this Expert Advisor or
 * indicator.
 *
 * @param milliseconds Number of milliseconds defining the frequency of timer
 * events.
 * @returns In case of successful execution, returns true, otherwise - false. To
 * receive an error code, GetLastError() function should be called.
 */
bool EventSetMillisecondTimer(int milliseconds);

/**
 * The function indicates to the client terminal, that for this indicator or
 * Expert Advisor, events from the timer must be generated with the specified
 * periodicity.
 *
 * @param seconds Number of seconds that determine the frequency of the timer
 * event occurrence.
 * @returns In case of success returns true, otherwise false. In order to get an
 * error code, the GetLastError() function should be called.
 */
bool EventSetTimer(int seconds);

/**
 * Specifies the client terminal that is necessary to stop the generation of
 * events from Timer.
 */
void EventKillTimer();

/**
 * The function generates a custom event for the specified chart.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param custom_event_id ID of the user events. This identifier is
 * automatically added to the value CHARTEVENT_CUSTOM and converted to the
 * integer type.
 * @param lparam Event parameter of the long type passed to the OnChartEvent
 * function.
 * @param dparam Event parameter of the double type passed to the OnChartEvent
 * function.
 * @param sparam Event parameter of the string type passed to the OnChartEvent
 * function. If the string is longer than 63 characters, it is truncated.
 * @returns Returns true if a custom event has been successfully placed in the
 * events queue of the chart that receives the events. In case of failure, it
 * returns false. Use GetLastError() to get an error code.
 */
bool EventChartCustom(long chart_id,
                      ushort custom_event_id,
                      long lparam,
                      double dparam,
                      string sparam);
