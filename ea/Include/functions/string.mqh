#include "Include/types/data_types.mqh"

/**
 * The function adds a substring to the end of a string.
 *
 * @param string_var String, to which another one is added.
 * @param add_substring String that is added to the end of a source string.
 * @returns In case of success returns true, otherwise false. In order to get an
 * error code, the GetLastError() function should be called.
 */
bool StringAdd(string& string_var, string add_substring);

/**
 * The function returns the size of buffer allocated for the string.
 *
 * @param string_var String.
 * @returns The value 0 means that the string is constant and buffer size can't
 * be changed. -1 means that the string belongs to the client terminal, and
 * modification of the buffer contents can have indeterminate results.
 */
int StringBufferLen(string string_var);

/**
 * The function compares two strings and returns the comparison result in form
 * of an integer.
 *
 * @param string1 The first string.
 * @param string2 The second string.
 * @param case_sensitive Case sensitivity mode selection. If it is true, then
 * "A">"a". If it is false, then "A"="a". By default the value is equal to true.
 */
int StringCompare(const string& string1,
                  const string& string2,
                  bool case_sensitive = true);

/**
 * The function forms a string of passed parameters and returns the size of the
 * formed string. Parameters can be of any type. Number of parameters can't be
 * less than 2 or more than 64.
 *
 * @param string_var String that will be formed as a result of concatenation.
 * @param ... Any comma separated values. From 2 to 63 parameters of any
 * simple type.
 * @returns Returns the string length, formed by concatenation of parameters
 * transformed into string type. Parameters are transformed into strings
 * according to the same rules as in Print() and Comment().
 */
int StringConcatenate(string& string_var, ...);

/**
 * It fills out a selected string by specified symbols.
 *
 * @param string_var String, that will be filled out by the selected symbol.
 * @param character Symbol, by which the string will be filled out.
 * @returns In case of success returns true, otherwise - false. To get the error
 * code call GetLastError().
 */
bool StringFill(string& string_var, ushort character);

/**
 * Search for a substring in a string.
 *
 * @param string_value String, in which search is made.
 * @param match_substring Searched substring.
 * @param start_pos Position in the string from which search is started.
 * @returns Returns position number in a string, from which the searched
 * substring starts, or -1, if the substring is not found.
 */
int StringFind(string string_value, string match_substring, int start_pos = 0);

/**
 * Returns value of a symbol, located in the specified position of a string.
 *
 * @param string_value String.
 * @param pos Position of a symbol in the string. Can be from 0 to
 * StringLen(text) -1.
 * @returns Symbol code or 0 in case of an error. To get the error code call
 * GetLastError().
 */
ushort StringGetCharacter(string string_value, int pos);

/**
 * Initializes a string by specified symbols and provides the specified string
 * size.
 *
 * @param string_var String that should be initialized and deinitialized.
 * @param new_len String length after initialization. If length=0, it
 * deinitializes the string, i.e. the string buffer is cleared and the buffer
 * address is zeroed.
 * @param character Symbol to fill the string.
 * @returns In case of success returns true, otherwise - false. To get the error
 * code call GetLastError().
 */
bool StringInit(string& string_var, int new_len = 0, ushort character = 0);

/**
 * Returns the number of symbols in a string.
 *
 * @param string_value String to calculate length.
 * @returns Number of symbols in a string without the ending zero.
 */
int StringLen(string string_value);

/**
 * Sets a specified length (in characters) for a string.
 *
 * @param string_var String, for which a new length in characters should be set.
 * @param new_capacity Required string length in characters. If new_length is
 * less than the current size, the excessive characters are discarded.
 * @returns In case of successful execution, returns true, otherwise - false. To
 * receive an error code, the GetLastError() function should be called.
 */
bool StringSetLength(string& string_var, uint new_length);

/**
 * It replaces all the found substrings of a string by a set sequence of
 * symbols.
 *
 * @param str The string in which you are going to replace substrings.
 * @param find The desired substring to replace.
 * @param replacement The string that will be inserted instead of the found one.
 * @returns The function returns the number of replacements in case of success,
 * otherwise -1. To get an error code call the GetLastError() function.
 */
int StringReplace(string& str, const string find, const string replacement);

/**
 * Reserves the buffer of a specified size for a string in memory.
 *
 * @param string_var String the buffer size should change the size for.
 * @param new_capacity Buffer size required for a string. If the new_capacity
 * size is less than the string length, the size of the current buffer does not
 * change.
 * @returns In case of successful execution, returns true, otherwise - false. To
 * receive an error code, the GetLastError() function should be called.
 */
bool StringReserve(string& string_var, uint new_capacity);

/**
 * Returns copy of a string with a changed character in a specified position.
 *
 * @param string_var String.
 * @param pos Position of a character in a string. Can be from 0 to
 * StringLen(text).
 * @param character Symbol code Unicode.
 * @returns In case of success returns true, otherwise false. In order to get an
 * error code, the GetLastError() function should be called.
 */
bool StringSetCharacter(string& string_var, int pos, ushort character);

/**
 * Gets substrings by a specified separator from the specified string, returns
 * the number of substrings obtained.
 *
 * @param string_value The string from which you need to get substrings. The
 * string will not change.
 * @param pos The code of the separator character. To get the code, you can use
 * the StringGetCharacter() function.
 * @param result An array of strings where the obtained substrings are located.
 * @returns The number of substrings in the result[] array. If the separator is
 * not found in the passed string, only one source string will be placed in the
 * array.
 */
int StringSplit(const string string_value,
                const ushort separator,
                string result[]);

/**
 * Extracts a substring from a text string starting from the specified position.
 *
 * @param string_value String to extract a substring from.
 * @param start_pos Initial position of a substring. Can be from 0 to
 * StringLen(text) -1.
 * @param length Length of an extracted substring. If the parameter value is
 * equal to -1 or parameter isn't set, the substring will be extracted from the
 * indicated position till the string end.
 * @returns Copy of a extracted substring, if possible. Otherwise returns an
 * empty string.
 */
string StringSubstr(string string_value, int start_pos, int length = -1);

/**
 * Transforms all symbols of a selected string into lowercase.
 *
 * @param string_var String.
 * @returns In case of success returns true, otherwise - false. To get the error
 * code call GetLastError().
 */
bool StringToLower(string& string_var);

/**
 * Transforms all symbols of a selected string into capitals.
 *
 * @param string_var String.
 * @returns In case of success returns true, otherwise - false. To get the error
 * code call GetLastError().
 */
bool StringToUpper(string& string_var);

/**
 * The function cuts line feed characters, spaces and tabs in the left part of
 * the string till the first meaningful symbol. The string is modified at place.
 *
 * @param string_var String that will be cut from the left.
 * @returns Returns the number of cut symbols.
 */
int StringTrimLeft(string& string_var);

/**
 * The function cuts line feed characters, spaces and tabs in the right part of
 * the string after the last meaningful symbol. The string is modified at place.
 *
 * @param string_var String that will be cut from the right.
 * @returns Returns the number of cut symbols.
 */
int StringTrimRight(string& string_var);
