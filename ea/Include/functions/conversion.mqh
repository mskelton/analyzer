#include "Include/constants/codepage.mqh"
#include "Include/types/data_types.mqh"

/**
 * Converting a symbol code into a one-character string.
 *
 * @param char_code Code of ANSI symbol.
 * @returns String with a ANSI symbol.
 */
string CharToString(uchar char_code);

/**
 * It copies and converts part of array of uchar type into a returned string.
 *
 * @param array Array of uchar type.
 * @param start Position from which copying starts. by default 0 is used.
 * @param count Number of array elements for copying. Defines the length of a
 * resulting string. Default value is -1, which means copying up to the array
 * end, or till terminal 0.
 * @param codepage The value of the code page. There is a number of built-in
 * constants for the most used code pages.
 */
string CharArrayToString(uchar array[],
                         int start = 0,
                         int count = -1,
                         uint codepage = CP_ACP);

/**
 * Copy uchar type array to POD structure.
 *
 * @param struct_object Reference to any type of POD structure (containing only
 * simple data types).
 * @param char_array uchar type array.
 * @param start_pos Position in the array, data copying starts from.
 * @returns Returns true if successful, otherwise false.
 */
template <typename T>
bool CharArrayToStruct(T struct_object,
                       const uchar char_array[],
                       uint start_pos = 0);

/**
 * Copy POD structure to uchar type array.
 *
 * @param struct_object Reference to any type of POD structure (containing only
 * simple data types).
 * @param char_array uchar type array.
 * @param start_pos Position in the array, starting from which the copied data
 * are added.
 * @returns Returns true if successful, otherwise false.
 */
template <typename T>
bool StructToCharArray(const T struct_object,
                       uchar char_array[],
                       uint start_pos = 0);

/**
 * The function converts color type into uint type to get ARGB representation of
 * the color. ARGB color format is used to generate a graphical resource, text
 * display, as well as for CCanvas standard library class.
 *
 * @param clr Color value in color type variable.
 * @param alpha The value of the alpha channel used to receive the color in ARGB
 * format. The value may be set from 0 (a color of a foreground pixel does not
 * change the display of an underlying one) up to 255 (a color of an underlying
 * pixel is completely replaced by the foreground pixel's one). Color
 * transparency in percentage terms is calculated as (1-alpha/255)*100%. In
 * other words, the lesser value of the alpha channel leads to more transparent
 * color.
 * @returns Presenting the color in ARGB format where Alfa, Red, Green, Blue
 * (alpha channel, red, green, blue) values are set in series in four uint type
 * bytes.
 */
uint ColorToARGB(color clr, uchar alpha = 255);

/**
 * It converts color value into string of "R,G,B" form.
 *
 * @param color_value Color value in color type variable.
 * @param color_name Return color name if it is identical to one of predefined
 * color constants.
 * @returns String presentation of color as "R,G,B", where R, G and B are
 * decimal constants from 0 to 255 converted into a string. If the
 * color_name=true parameter is set, it will try to convert color value into
 * color name.
 */
string ColorToString(color color_value, bool color_name);

/**
 * Converting numeric value into text string.
 *
 * @param value Value with a floating point.
 * @param digits Accuracy format. If the digits value is in the range between 0
 * and 16, a string presentation of a number with the specified number of digits
 * after the point will be obtained. If the digits value is in the range between
 * -1 and -16, a string representation of a number in the scientific format with
 * the specified number of digits after the decimal point will be obtained. In
 * all other cases the string value will contain 8 digits after the decimal
 * point.
 * @returns String containing a symbol representation of a number with the
 * specified accuracy.
 */
string DoubleToString(double value, int digits = 8);

/**
 * Converting an enumeration value of any type to a text form.
 *
 * @param value Any type enumeration value.
 * @returns A string with a text representation of the enumeration. To get the
 * error message call the GetLastError() function.
 */
template <typename T>
string EnumToString(T value);

/**
 * This function converts value of integer type into a string of a specified
 * length and returns the obtained string.
 *
 * @param number Number for conversion.
 * @param str_len String length. If the resulting string length is larger than
 * the specified one, the string is not cut off. If it is smaller, filler
 * symbols will be added to the left.
 * @param fill_symbol Filler symbol. By default it is a space.
 */
string IntegerToString(long number, int str_len = 0, ushort fill_symbol = ' ');

/**
 * It converts the symbol code (unicode) into one-symbol string and returns
 * resulting string.
 *
 * @param symbol_code Symbol code. Instead of a symbol code you can use literal
 * string containing a symbol or a literal string with 2-byte hexadecimal code
 * corresponding to the symbol from the Unicode table.
 */
string ShortToString(ushort symbol_code);

/**
 * It copies part of array into a returned string.
 *
 * @param array Array of ushort type (analog of wchar_t type).
 * @param start Position, from which copying starts, Default - 0.
 * @param count Number of array elements to copy. Defines the length of a
 * resulting string. Default value is -1, which means copying up to the array
 * end, or till terminal 0.
 */
string ShortArrayToString(ushort array[], int start = 0, int count = -1);

/**
 * Converting a value containing time in seconds elapsed since 01.01.1970 into a
string of "yyyy.mm.dd hh:mi" format.
 *
 * @param value Time in seconds from 00:00 1970/01/01.
 * @param mode Additional data input mode. Can be one or combined flag.
 */
string TimeToString(datetime value, int mode = TIME_DATE | TIME_MINUTES);

/**
 * Rounding floating point number to a specified accuracy.
 *
 * @param value Value with a floating point.
 * @param digits Accuracy format, number of digits after point (0-8).
 * @returns Value of double type with preset accuracy.
 */
double NormalizeDouble(double value, int digits);

/**
 * Symbol-wise copies a string converted from Unicode to ANSI, to a selected
 * place of array of uchar type. It returns the number of copied elements.
 *
 * @param text_string String to copy.
 * @param array Array of uchar type.
 * @param start Position from which copying starts. Default - 0.
 * @param count Number of array elements to copy. Defines length of a resulting
 * string. Default value is -1, which means copying up to the array end, or till
 * terminal 0. Terminal 0 will also be copied to the recipient array, in this
 * case the size of a dynamic array can be increased if necessary to the size of
 * the string. If the size of the dynamic array exceeds the length of the
 * string, the size of the array will not be reduced.
 * @param codepage The value of the code page. For the most-used code pages
 * provide appropriate constants.
 * @returns Number of copied elements.
 */
int StringToCharArray(string text_string,
                      uchar array[],
                      int start = 0,
                      int count = -1,
                      uint codepage = CP_ACP);

/**
 * Converting "R,G,B" string or string with color name into color type value.
 *
 * @param color_string String representation of a color of "R,G,B" type or name
 * of one of predefined Web-colors.
 * @returns Color value.
 */
color StringToColor(string color_string);

/**
 * The function converts string containing a symbol representation of number
 * into number of double type.
 *
 * @param value String containing a symbol representation of a number.
 * @returns Value of double type.
 */
double StringToDouble(string value);

/**
 * The function converts string containing a symbol representation of number
 * into number of long (integer) type.
 *
 * @param value String containing a number.
 * @returns Value of long type.
 */
long StringToInteger(string value);

/**
 * The function symbol-wise copies a string into a specified place of an array
 * of ushort type. It returns the number of copied elements.
 *
 * @param text_string String to copy
 * @param array Array of ushort type (analog of wchar_t type).
 * @param start Position, from which copying starts. Default - 0.
 * @param count Number of array elements to copy. Defines length of a resulting
 * string. Default value is -1, which means copying up to the array end, or till
 * terminal 0.Terminal 0 will also be copied to the recipient array, in this
 * case the size of a dynamic array can be increased if necessary to the size of
 * the string. If the size of the dynamic array exceeds the length of the
 * string, the size of the array will not be reduced.
 * @returns Number of copied elements.
 */
int StringToShortArray(string text_string,
                       ushort array[],
                       int start = 0,
                       int count = -1);

/**
 * Transforms the string containing time and/or date in the "yyyy.mm.dd [hh:mi]"
 * format into the datetime type number.
 *
 * @param time_string String in one of the specified formats:
 * @returns datetime type value containing the number of seconds elapsed since
 * 01.01.1970.
 */
datetime StringToTime(const string time_string);

/**
 * The function formats obtained parameters and returns a string.
 *
 * @param format String containing method of formatting. Formatting rules are
 * the same as for the PrintFormat function.
 * @param ... Parameters, separated by a comma.
 */
string StringFormat(string format, ...);
