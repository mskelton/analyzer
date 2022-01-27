/**
 * Displays a message in a separate window.
 *
 * @param ... Any values separated by commas. To split the information
 * output in several lines you can use the line feed character "\\n" or
 * "\\r\\n". The number of parameters can not exceed 64.
 */
void Alert(...);

/**
 * The function returns the type of the object pointer.
 *
 * @param anyobject Object pointer.
 * @returns Returns a value from the ENUM_POINTER_TYPE enumeration.
 */
template <typename T>
ENUM_POINTER_TYPE CheckPointer(T anyobject);

/**
 * This function outputs a comment defined by a user in the top left corner of a
 * chart.
 *
 * @param ... Any values, separated by commas. To delimit output information
 * into several lines, a line break symbol "\\n" or "\\r\\n" is used. Number of
 * parameters cannot exceed 64. Total length of the input comment (including
 * invisible symbols) cannot exceed 2045 characters (excess symbols will be cut
 * out during output).
 */
void Comment(...);

/**
 * Transforms the data from array with the specified method.
 *
 * @param method Data transformation method. Can be one of the values of
 * ENUM_CRYPT_METHOD enumeration.
 * @param data Source array.
 * @param key Key array.
 * @param result Destination array.
 * @returns Amount of bytes in the destination array or 0 in case of error. To
 * obtain information about the error call the GetLastError() function.
 */
int CryptEncode(ENUM_CRYPT_METHOD method,
                const uchar data[],
                const uchar key[],
                uchar result[]);

/**
 * Performs the inverse transformation of the data from array, tranformed by
 * CryptEncode().
 *
 * @param method Data transformation method. Can be one of the values of
 * ENUM_CRYPT_METHOD enumeration.
 * @param data[] Source array.
 * @param key[] Key array.
 * @param result[] Destination array.
 * @returns Amount of bytes in the destination array or 0 in case of error. To
 * obtain information about the error call the GetLastError() function.
 */
int CryptEncode(ENUM_CRYPT_METHOD method,
                const uchar data[],
                const uchar key[],
                uchar result[]);

/**
 * It is a program breakpoint in debugging.
 */
void DebugBreak();

/**
 * The function stops an Expert Advisor and unloads it from a chart.
 */
void ExpertRemove();

/**
 * The function returns the object pointer.
 *
 * @param anyobject Object of any class.
 * @returns The function returns the object pointer.
 */
template <typename T>
void* GetPointer(T anyobject);

/**
 * The GetTickCount() function returns the number of milliseconds that elapsed
 * since the system start.
 *
 * @returns Value of uint type.
 */
uint GetTickCount();

/**
 * The GetTickCount64() function returns the number of milliseconds that have
 * elapsed since the system was launched.
 *
 * @returns A ulong type value.
 */
ulong GetTickCount64();

/**
 * The GetMicrosecondCount() function returns the number of microseconds that
 * have elapsed since the start of MQL5-program.
 *
 * @returns Value of ulong type.
 */
ulong GetMicrosecondCount();

/**
 * It creates and shows a message box and manages it. A message box contains a
 * message and header, any combination of predefined signs and command buttons.
 *
 * @param text Text, containing message to output.
 * @param caption Optional text to be displayed in the box header. If the
 * parameter is empty, Expert Advisor name is shown in the box header.
 * @param flags Optional flags defining appearance and behavior of a message
 * box. Flags can be a combination of a special group of flags.
 * @returns If the function is successfully performed, the returned value is one
 * of values of MessageBox() return codes.
 */
int MessageBox(string text, string caption = "", int flags = 0);

/**
 * This function returns number of seconds in a period.
 *
 * @param period Value of a chart period from the enumeration ENUM_TIMEFRAMES.
 * If the parameter isn't specified, it returns the number of seconds of the
 * current chart period, at which the program runs.
 * @returns Number of seconds in a selected period.
 */
int PeriodSeconds(ENUM_TIMEFRAMES period = PERIOD_CURRENT);

/**
 * It plays a sound file.
 *
 * @param filename Path to a sound file. If filename=NULL, the playback is
 * stopped.
 * @returns true – if the file is found, otherwise - false.
 */
bool PlaySound(string filename);

/**
 * It enters a message in the Expert Advisor log. Parameters can be of any type.
 *
 * @param ... Any values separated by commas. The number of parameters cannot
 * exceed 64.
 */
void Print(...);

/**
 * It formats and enters sets of symbols and values in the Expert Advisor log in
 * accordance with a preset format.
 *
 * @param format_string A format string consists of simple symbols, and if the
 * format string is followed by arguments, it also contains format
 * specifications.
 * @param ... Any values of simple types separated by commas. Total number of
 * parameters can't exceed 64 including the format string.
 * @returns String.
 */
void PrintFormat(string format_string, ...);

/**
 * Sets the value of the predefined variable _LastError into zero.
 */
void ResetLastError();

/**
 * Creates an image resource based on a data set. There are two variants of the
function: Creating a resource based on a file
 *
 * @param resource_name Resource name.
 * @param data A one-dimensional or two-dimensional array for creating a
complete image.
 * @param img_width The width of the rectangular image area in pixels to be
placed in the resource in the form of an image. It cannot be greater than the
data_width value.
 * @param img_height The height of the rectangular image area in pixels to be
placed in the resource in the form of an image.
 * @param data_xoffset The horizontal rightward offset of the rectangular area
of the image.
 * @param data_yoffset The vertical downward offset of the rectangular area of
the image.
 * @param data_width Required only for one-dimensional arrays. It denotes the
full width of the image from the data set. If data_width=0, it is assumed to be
equal to img_width. For two-dimensional arrays the parameter is ignored and is
assumed to be equal to the second dimension of the data[] array.
 * @param color_format Color processing method, from a value from the
ENUM_COLOR_FORMAT enumeration.
 * @returns Returns true if successful, otherwise false. To get information
about the error call the GetLastError() function. The following errors may
occur:
 */
bool ResourceCreate(const string resource_name, const string path);
bool ResourceCreate(const string resource_name,
                    const uint data[],
                    uint img_width,
                    uint img_height,
                    uint data_xoffset,
                    uint data_yoffset,
                    uint data_width,
                    ENUM_COLOR_FORMAT color_format);

/**
 * The function deletes dynamically created resource (freeing the memory
 * allocated for it).
 *
 * @param resource_name Resource name should start with "::".
 * @returns True if successful, otherwise false. To get information about the
 * error, call the GetLastError() function.
 */
bool ResourceFree(const string resource_name);

/**
 * The function reads data from the graphical resource created by
 * ResourceCreate() function or saved in EX5 file during compilation.
 *
 * @param resource_name Name of the graphical resource containing an image. To
 * gain access to its own resources, the name is used in brief form
 * "::resourcename". If we download a resource from a compiled EX5 file, the
 * full name should be used with the path relative to MQL5 directory, file and
 * resource names – "path\\\\filename.ex5::resourcename".
 * @param data One- or two-dimensional array for receiving data from the
 * graphical resource.
 * @param img_width Graphical resource image width in pixels.
 * @param img_height Graphical resource image height in pixels.
 * @returns true if successful, otherwise false. To get information about the
 * error, call the GetLastError() function.
 */
bool ResourceReadImage(const string resource_name,
                       uint data[],
                       uint& width,
                       uint& height);

/**
 * Saves a resource into the specified file.
 *
 * @param resource_name The name of the resource, must start with "::".
 * @param file_name The name of the file relative to MQL5\\Files.
 * @returns true – in case of success, otherwise false. For the error
 * information call GetLastError().
 */
bool ResourceSave(const string resource_name, const string file_name);

/**
 * Sets the code that returns the terminal process when completing the
 * operation.
 *
 * @param ret_code The code to be returned by the client terminal process when
 * completing the operation.
 */
void SetReturnError(int ret_code);

/**
 * Sets the predefined variable _LastError into the value equal to
 * ERR_USER_ERROR_FIRST + user_error
 *
 * @param user_error Error number set by a user.
 */
void SetUserError(ushort user_error);

/**
 * The function suspends execution of the current Expert Advisor or script
 * within a specified interval.
 *
 * @param milliseconds Delay interval in milliseconds.
 */
void Sleep(int milliseconds);

/**
 * The function commands the terminal to complete operation.
 *
 * @param ret_code Return code, returned by the process of the client terminal
 * at the operation completion.
 * @returns The function returns true on success, otherwise - false.
 */
bool TerminalClose(int ret_code);

/**
 * Sets the mode of displaying/hiding indicators used in an EA. The function is
 * intended for managing the visibility of used indicators only during testing.
 *
 * @param hide Flag for hiding indicators when testing. Set true to hide created
 * indicators, otherwise false.
 */
void TesterHideIndicators(bool hide);

/**
 * The function returns the value of the specified statistical parameter
 * calculated based on testing results.
 *
 * @param statistic_id The ID of the statistical parameter from the
 * ENUM_STATISTICS enumeration.
 * @returns The value of the statistical parameter from testing results.
 */
double TesterStatistics(ENUM_STATISTICS statistic_id);

/**
 * Gives program operation completion command when testing.
 */
void TesterStop();

/**
 * The special function that emulates depositing funds during a test. It can be
 * used in some money management systems.
 *
 * @param money Money to be deposited to an account in the deposit currency.
 * @returns Returns true if successful, otherwise - false.
 */
bool TesterDeposit(double money);

/**
 * The special function to emulate the operation of money withdrawal in the
 * process of testing. Can be used in some asset management systems.
 *
 * @param money The sum of money that we need to withdraw (in the deposit
 * currency).
 * @returns If successful, returns true, otherwise - false.
 */
bool TesterWithdrawal(double money);

/**
 * Returns a Unicode character by a virtual key code considering the current
 * input language and the status of control keys.
 *
 * @param key_code Key code.
 * @returns Unicode character in case of a successful conversion. The function
 * returns -1 in case of an error.
 */
short TranslateKey(int key_code);

/**
 * The function resets a variable passed to it by reference.
 *
 * @param variable Variable passed by reference, you want to reset
 * (initialize by zero values).
 */
template <typename T>
void ZeroMemory(T variable);
