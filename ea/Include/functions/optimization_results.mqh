#include "Include/types/data_types.mqh"

/**
 * Moves a pointer of frame reading to the beginning and resets a set filter.
 *
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool FrameFirst();

/**
 * Sets the frame reading filter and moves the pointer to the beginning.
 *
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool FrameFilter(const string name, long id);

/**
 * Reads a frame and moves the pointer to the next one. There are two variants
 * of the function.
 *
 * @param pass The number of a pass during optimization in the strategy tester.
 * @param name The name of the identifier.
 * @param id The value of the identifier.
 * @param value A single numeric value.
 * @param data An array of any type.
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool FrameNext(ulong& pass, string& name, long& id, double& value);
template <typename T>
bool FrameNext(ulong& pass, string& name, long& id, double& value, T data[]);

/**
 * Receives input parameters, on which the frame with the specified pass number
 * is formed.
 *
 * @param pass The number of a pass during optimization in the strategy tester.
 * @param parameters A string array with the description of names and parameter
 * values
 * @param parameters_count The number of elements in the array parameters[].
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool FrameInputs(ulong pass, string parameters[], uint& parameters_count);

/**
 * Adds a frame with data. There are two variants of the function.
 *
 * @param name Public frame label. It can be used for a filter in the
 * FrameFilter() function.
 * @param id A public identifier of the frame. It can be used for a filter in
 * the FrameFilter() function.
 * @param value A numeric value to write into the frame. It is used to transmit
 * a single pass result like in the OnTester() function.
 * @param filename The name of the file that contains data to add to the frame.
 * The file must be locate in the folder MQL5/Files.
 * @param data An array of any type to write into the frame. Passed by
 * reference.
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool FrameAdd(const string name, long id, double value, const string filename);
template <typename T>
bool FrameAdd(const string name, long id, double value, const T data[]);

/**
 * Receives data on the values range and the change step for an input variable
 * when optimizing an Expert Advisor in the Strategy Tester. There are 2
 * variants of the function.
 *
 * @param name input variable ID. These variables are external parameters of an
 * application. Their values can be specified when launching on a chart or
 * during a single test.
 * @param enable Flag that this parameter can be used to enumerate the values
 * during the optimization in the Strategy Tester.
 * @param value Parameter value.
 * @param start Initial parameter value during the optimization.
 * @param step Parameter change step when enumerating its values.
 * @param stop Final parameter value during the optimization.
 * @returns Returns true if successful, otherwise false. For information about
 * the error, use the GetLastError() function.
 */
bool ParameterGetRange(const string name,
                       bool& enable,
                       long& value,
                       long& start,
                       long& step,
                       long& stop);
bool ParameterGetRange(const string name,
                       bool& enable,
                       double& value,
                       double& start,
                       double& step,
                       double& stop);

/**
 * Specifies the use of input variable when optimizing an Expert Advisor in the
 * Strategy Tester: value, change step, initial and final values. There are 2
 * variants of the function.
 *
 * @param name input or sinput variable ID. These variables are external
 * parameters of an application. Their values can be specified when launching
 * the program.
 * @param enable Enable this parameter to enumerate the values during the
 * optimization in the Strategy Tester.
 * @param value Parameter value.
 * @param start Initial parameter value during the optimization.
 * @param step Parameter change step when enumerating its values.
 * @param stop Final parameter value during the optimization.
 * @returns Returns true if successful, otherwise false. For information about
 * the error, use the GetLastError() function.
 */
bool ParameterSetRange(const string name,
                       bool enable,
                       long value,
                       long start,
                       long step,
                       long stop);
bool ParameterSetRange(const string name,
                       bool enable,
                       double value,
                       double start,
                       double step,
                       double stop);
