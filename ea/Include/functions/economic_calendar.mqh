#include "Include/enums/economic_calendar.mqh"
#include "Include/types/data_types.mqh"
#include "Include/types/economic_calendar.mqh"

/**
 * Get a country description by its ID.
 *
 * @param country_id Country ID (ISO 3166-1).
 * @param country MqlCalendarCountry type variable for receiving a country
 * description.
 * @returns Returns true if successful, otherwise - false. To get information
 * about an error, call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 5402 – ERR_CALENDAR_NO_DATA (country is not found),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded).
 */
bool CalendarCountryById(const long country_id, MqlCalendarCountry& country);

/**
 * Get an event description by its ID.
 *
 * @param event_id Event ID.
 * @param event MqlCalendarEvent type variable for receiving an event
 * description.
 * @returns Returns true if successful, otherwise - false. To get information
 * about an error, call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 5402 – ERR_CALENDAR_NO_DATA (country is not found),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded).
 */
bool CalendarEventById(ulong event_id, MqlCalendarEvent& event);

/**
 * Get an event value description by its ID.
 *
 * @param value_id Event value ID.
 * @param value MqlCalendarValue type variable for receiving an event
 * description.
 * @returns Returns true if successful, otherwise - false. To get information
 * about an error, call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 5402 – ERR_CALENDAR_NO_DATA (country is not found),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded).
 */
bool CalendarValueById(ulong value_id, MqlCalendarValue& value);

/**
 * Get the array of descriptions of all events available in the Calendar by a
 * specified country code.
 *
 * @param country_code Country code name (ISO 3166-1 alpha-2)
 * @param events MqlCalendarEvent type array for receiving descriptions of all
 * events for a specified country.
 * @returns Number of received descriptions. To get information about an error,
 * call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * errors of failed execution of ArrayResize()
 */
int CalendarEventByCountry(string country_code, MqlCalendarEvent events[]);

/**
 * Get the array of descriptions of all events available in the Calendar by a
 * specified currency.
 *
 * @param currency Country currency code name.
 * @param events MqlCalendarEvent type array for receiving descriptions of all
 * events for a specified currency.
 * @returns Number of received descriptions. To get information about an error,
 * call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * errors of failed execution of ArrayResize()
 */
int CalendarEventByCurrency(const string currency, MqlCalendarEvent events[]);

/**
 * Get the array of values for all events in a specified time range by an event
 * ID.
 *
 * @param event_id Event ID.
 * @param values MqlCalendarValue type array for receiving event values.
 * @param datetime_from Initial date of a time range events are selected from by
 * a specified ID, while datetime_from < datetime_to.
 * @param datetime_to End date of a time range events are selected from by a
 * specified ID. If the datetime_to is not set (or is 0), all event values
 * beginning from the specified datetime_from date in the Calendar database are
 * returned (including the values of future events).
 * @returns Returns true if successful, otherwise - false. To get information
 * about an error, call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * 5400 – ERR_CALENDAR_MORE_DATA (array size is insufficient for receiving
 * descriptions of all values, only the ones that managed to fit in were
 * received), errors of failed execution of ArrayResize()
 */
bool CalendarValueHistoryByEvent(ulong event_id,
                                 MqlCalendarValue values[],
                                 datetime datetime_from,
                                 datetime datetime_to = 0);

/**
 * Get the array of values for all events in a specified time range with the
 * ability to sort by country and/or currency.
 *
 * @param values MqlCalendarValue type array for receiving event values.
 * @param datetime_from Initial date of a time range events are selected from by
 * a specified ID, while datetime_from < datetime_to.
 * @param datetime_to End date of a time range events are selected from by a
 * specified ID. If the datetime_to is not set (or is 0), all event values
 * beginning from the specified datetime_from date in the Calendar database are
 * returned (including the values of future events).
 * @param country_code Country code name (ISO 3166-1 alpha-2)
 * @param currency Country currency code name.
 * @returns Returns true if successful, otherwise - false. To get information
 * about an error, call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * 5400 – ERR_CALENDAR_MORE_DATA (array size is insufficient for receiving
 * descriptions of all values, only the ones that managed to fit in were
 * received),
 * errors of failed execution of ArrayResize()
 */
bool CalendarValueHistory(MqlCalendarValue values[],
                          datetime datetime_from,
                          datetime datetime_to = 0,
                          const string country_code = "",
                          const string currency = "");

/**
 * Get the array of values for all events in a specified time range with the
 * ability to sort by country and/or currency.
 *
 * @param values MqlCalendarValue type array for receiving event values.
 * @param datetime_from Initial date of a time range events are selected from by
 * a specified ID, while datetime_from < datetime_to.
 * @param datetime_to End date of a time range events are selected from by a
 * specified ID. If the datetime_to is not set (or is 0), all event values
 * beginning from the specified datetime_from date in the Calendar database are
 * returned (including the values of future events).
 * @param country_code Country code name (ISO 3166-1 alpha-2)
 * @param currency Country currency code name.
 * @returns Returns true if successful, otherwise - false. To get information
 * about an error, call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * 5400 – ERR_CALENDAR_MORE_DATA (array size is insufficient for receiving
 * descriptions of all values, only the ones that managed to fit in were
 * received), errors of failed execution of ArrayResize()
 */
bool CalendarValueHistory(MqlCalendarValue values[],
                          datetime datetime_from,
                          datetime datetime_to = 0,
                          const string country_code = "",
                          const string currency = "");

/**
 * Get the array of event values by its ID since the Calendar database status
 * with a specified change_id.
 *
 * @param event_id Event ID.
 * @param change_id Change ID.
 * @param values MqlCalendarValue type array for receiving event values.
 * @returns Number of received event values. To get information about an error,
 * call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * 5400 – ERR_CALENDAR_MORE_DATA (array size is insufficient for receiving
 * descriptions of all values, only the ones that managed to fit in were
 * received), errors of failed execution of ArrayResize()
 */
int CalendarValueLastByEvent(ulong event_id,
                             ulong& change_id,
                             MqlCalendarValue values[]);

/**
 * Get the array of values for all events with the ability to sort by country
 * and/or currency since the calendar database status with a specified
 * change_id.
 *
 * @param change_id Change ID.
 * @param values MqlCalendarValue type array for receiving event values.
 * @param country_code Country code name (ISO 3166-1 alpha-2)
 * @param currency Country currency code name.
 * @returns Number of received event values. To get information about an error,
 * call the GetLastError() function. Possible errors:
 *
 * 4001 – ERR_INTERNAL_ERROR  (general runtime error),
 * 4004 – ERR_NOT_ENOUGH_MEMORY (not enough memory for executing a request),
 * 5401 – ERR_CALENDAR_TIMEOUT (request time limit exceeded),
 * 5400 – ERR_CALENDAR_MORE_DATA (array size is insufficient for receiving
 * descriptions of all values, only the ones that managed to fit in were
 * received), errors of failed execution of ArrayResize()
 */
int CalendarValueLast(ulong& change_id,
                      MqlCalendarValue values[],
                      const string country_code = "",
                      const string currency = "");
