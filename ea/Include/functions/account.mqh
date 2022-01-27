#include "Include/enums/account.mqh"
#include "Include/types/data_types.mqh"

/**
 * Returns the value of the appropriate account property.
 *
 * @param property_id Property identifier. The value can be one of the values of
 * ENUM_ACCOUNT_INFO_DOUBLE.
 * @returns Value of double type.
 */
double AccountInfoDouble(ENUM_ACCOUNT_INFO_DOUBLE property_id);

/**
 * Returns the value of the appropriate account property.
 *
 * @param property_id Property identifier. The value can be one of the values of
 * ENUM_ACCOUNT_INFO_INTEGER.
 * @returns Value of long type.
 */
long AccountInfoInteger(ENUM_ACCOUNT_INFO_INTEGER property_id);

/**
 * Returns the value of the appropriate account property.
 *
 * @param property_id Property identifier. The value can be one of the values of
 * ENUM_ACCOUNT_INFO_STRING.
 * @returns Value of string type.
 */
string AccountInfoString(ENUM_ACCOUNT_INFO_STRING property_id);
