#include "Include/enums/trade_signals.mqh"
#include "Include/types/data_types.mqh"

/**
 * Returns the value of double type property for selected signal.
 *
 * @param property_id Signal property identifier. The value can be one of the
 * values of the ENUM_SIGNAL_BASE_DOUBLE enumeration.
 * @returns The value of double type property of the selected signal.
 */
double SignalBaseGetDouble(ENUM_SIGNAL_BASE_DOUBLE property_id);

/**
 * Returns the value of integer type property for selected signal.
 *
 * @param property_id Signal property identifier. The value can be one of the
 * values of the ENUM_SIGNAL_BASE_INTEGER enumeration.
 * @returns The value of integer type property of the selected signal.
 */
long SignalBaseGetInteger(ENUM_SIGNAL_BASE_INTEGER property_id);

/**
 * Returns the value of string type property for selected signal.
 *
 * @param property_id Signal property identifier. The value can be one of the
 * values of the ENUM_SIGNAL_BASE_STRING enumeration.
 * @returns The value of string type property of the selected signal.
 */
string SignalBaseGetString(ENUM_SIGNAL_BASE_STRING property_id);

/**
 * Selects a signal from signals, available in terminal for further working with
 * it.
 *
 * @param index Signal index in base of trading signals.
 * @returns Returns true if successful, otherwise returns false. To read more
 * about the error call GetLastError().
 */
bool SignalBaseSelect(int index);

/**
 * Returns the total amount of signals, available in terminal.
 *
 * @returns The total amount of signals, available in terminal.
 */
int SignalBaseTotal();

/**
 * Returns the value of double type property of signal copy settings.
 *
 * @param property_id Signal copy settings property identifier. The value can be
 * one of the values of the ENUM_SIGNAL_INFO_DOUBLE enumeration.
 * @returns The value of double type property of signal copy settings.
 */
double SignalInfoGetDouble(ENUM_SIGNAL_INFO_DOUBLE property_id);

/**
 * Returns the value of integer type property of signal copy settings.
 *
 * @param property_id Signal copy settings property identifier. The value can be
 * one of the values of the ENUM_SIGNAL_INFO_INTEGER enumeration.
 * @returns The value of integer type property of signal copy settings.
 */
long SignalInfoGetInteger(ENUM_SIGNAL_INFO_INTEGER property_id);

/**
 * Returns the value of string type property of signal copy settings.
 *
 * @param property_id Signal copy settings property identifier. The value can be
 * one of the values of the ENUM_SIGNAL_INFO_STRING enumeration.
 * @returns The value of string type property of signal copy settings.
 */
string SignalInfoGetString(ENUM_SIGNAL_INFO_STRING property_id);

/**
 * Sets the value of double type property of signal copy settings.
 *
 * @param property_id Signal copy settings property identifier. The value can be
 * one of the values of the ENUM_SIGNAL_INFO_DOUBLE enumeration.
 * @param value The value of signal copy settings property.
 * @returns Returns true if property has been changed, otherwise returns false.
 * To read more about the error call GetLastError().
 */
bool SignalInfoSetDouble(ENUM_SIGNAL_INFO_DOUBLE property_id, double value);

/**
 * Sets the value of integer type property of signal copy settings.
 *
 * @param property_id Signal copy settings property identifier. The value can be
 * one of the values of the ENUM_SIGNAL_INFO_INTEGER enumeration.
 * @param value The value of signal copy settings property.
 * @returns Returns true if property has been changed, otherwise returns false.
 * To read more about the error call GetLastError().
 */
bool SignalInfoSetInteger(ENUM_SIGNAL_INFO_INTEGER property_id, long value);

/**
 * Subscribes to the trading signal.
 *
 * @param signal_id Signal identifier.
 * @returns Returns true if subscription was successful, otherwise returns
 * false. To read more about the error call GetLastError().
 */
bool SignalSubscribe(long signal_id);

/**
 * Cancels subscription.
 *
 * @returns Returns true if subscription has been canceled successfully,
 * otherwise returns false. To read more about the error call GetLastError().
 */
bool SignalUnsubscribe();
