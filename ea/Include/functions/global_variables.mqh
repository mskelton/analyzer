#include "Include/types/data_types.mqh"

/**
 * Checks the existence of a global variable with the specified name
 *
 * @param name Global variable name.
 * @returns Returns true, if the global variable exists, otherwise returns
 * false.
 */
bool GlobalVariableCheck(string name);

/**
 * Returns the time when the global variable was last accessed.
 *
 * @param name Name of the global variable.
 * @returns The function returns time of last accessing the specified global
 * variable. Addressing a variable for its value, for example using the
 * GlobalVariableGet() and GlobalVariableCheck() functions, also modifies the
 * time of last access. In order to obtain error details, call the
 * GetLastError() function.
 */
datetime GlobalVariableTime(string name);

/**
 * Deletes a global variable from the client terminal.
 *
 * @param name Global variable name.
 * @returns If successful, the function returns true, otherwise it returns
 * false. To obtain an information about the error it is necessary to call the
 * function GetLastError().
 */
bool GlobalVariableDel(string name);

/**
 * Returns the value of an existing global variable of the client terminal.
 * There are 2 variants of the function.
 *
 * @param name Global variable name.
 * @param double_var Target variable of the double type, which accepts the value
 * stored in a the global variable of the client terminal.
 * @returns The value of the existing global variable or 0 in case of an error.
 * For more details about the error, call GetLastError().
 */
double GlobalVariableGet(string name);
bool GlobalVariableGet(string name, double& double_var);

/**
 * Returns the name of a global variable by its ordinal number.
 *
 * @param index Sequence number in the list of global variables. It should be
 * greater than or equal to 0 and less than GlobalVariablesTotal().
 * @returns Global variable name by its ordinal number in the list of global
 * variables. For more details about the error, call GetLastError().
 */
string GlobalVariableName(int index);

/**
 * Sets a new value for a global variable. If the variable does not exist, the
 * system creates a new global variable.
 *
 * @param name Global variable name.
 * @param value The new numerical value.
 * @returns If successful, the function returns the last modification time,
 * otherwise 0. For more details about the error, call GetLastError().
 */
datetime GlobalVariableSet(string name, double value);

/**
 * Forcibly saves contents of all global variables to a disk.
 */
void GlobalVariablesFlush();

/**
 * The function attempts to create a temporary global variable. If the variable
 * doesn't exist, the system creates a new temporary global variable.
 *
 * @param name The name of a temporary global variable.
 * @returns If successful, the function returns true, otherwise - false. To get
 * details about the error, you should call the GetLastError() function.
 */
bool GlobalVariableTemp(string name);

/**
 * Sets the new value of the existing global variable if the current value
 * equals to the third parameter check_value. If there is no global variable,
 * the function will generate an error ERR_GLOBALVARIABLE_NOT_FOUND (4501) and
 * return false.
 *
 * @param name The name of a global variable.
 * @param value New value.
 * @param check_value The value to check the current value of the global
 * variable.
 * @returns If successful, the function returns true, otherwise it returns
 * false. For details about the error call GetLastError(). If the current value
 * of the global variable is different from check_value, the function returns
 * false.
 */
bool GlobalVariableSetOnCondition(string name,
                                  double value,
                                  double check_value);

/**
 * Deletes global variables of the client terminal.
 *
 * @param prefix_name Name prefix global variables to remove. If you specify a
 * prefix NULL or empty string, then all variables that meet the data criterion
 * will be deleted.
 * @param limit_data Date to select global variables by the time of their last
 * modification. The function removes global variables, which were changed
 * before this date. If the parameter is zero, then all variables that meet the
 * first criterion (prefix) are deleted.
 * @returns The number of deleted variables.
 */
int GlobalVariablesDeleteAll(string prefix_name = NULL,
                             datetime limit_data = 0);

/**
 * Returns the total number of global variables of the client terminal.
 *
 * @returns Number of global variables.
 */
int GlobalVariablesTotal();
