#include "Include/enums/chart.mqh"
#include "Include/enums/order.mqh"
#include "Include/enums/timeseries.mqh"
#include "Include/types/data_types.mqh"

/**
 * Applies a specific template from a specified file to the chart. The command
 * is added to chart messages queue and will be executed after processing of all
 * previous commands.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param filename The name of the file containing the template.
 * @returns Returns true if the command has been added to chart queue, otherwise
 * false. To get an information about the error, call the GetLastError()
 * function.
 */
bool ChartApplyTemplate(long chart_id, const string filename);

/**
 * Saves current chart settings in a template with a specified name.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param filename The filename to save the template. The ".tpl" extension will
 * be added to the filename automatically; there is no need to specify it. The
 * template is saved in data_folder\\Profiles\\Templates\\ and can be used for
 * manual application in the terminal. If a template with the same filename
 * already exists, the contents of this file will be overwritten.
 * @returns If successful, the function returns true, otherwise it returns
 * false. To get information about the error, call the GetLastError() function.
 */
bool ChartSaveTemplate(long chart_id, const string filename);

/**
 * The function returns the number of a subwindow where an indicator is drawn.
 * There are 2 variants of the function.
 *
 * @param chart_id Chart ID. 0 denotes the current chart.
 * @param indicator_shortname Short name of the indicator.
 * @returns Subwindow number in case of success. In case of failure the function
 * returns -1.
 */
int ChartWindowFind(long chart_id, string indicator_shortname);
int ChartWindowFind();

/**
 * Converts the coordinates of a chart from the time/price representation to the
 * X and Y coordinates.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param sub_window The number of the chart subwindow. 0 means the main chart
 * window.
 * @param time The time value on the chart, for which the value in pixels along
 * the X axis will be received. The origin is in the upper left corner of the
 * main chart window.
 * @param price The price value on the chart, for which the value in pixels
 * along the Y axis will be received. The origin is in the upper left corner of
 * the main chart window.
 * @param x The variable, into which the conversion of time to X will be
 * received.
 * @param y The variable, into which the conversion of price to Y will be
 * received.
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool ChartTimePriceToXY(long chart_id,
                        int sub_window,
                        datetime time,
                        double price,
                        int& x,
                        int& y);

/**
 * Converts the X and Y coordinates on a chart to the time and price values.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param x The X coordinate.
 * @param y The Y coordinate.
 * @param sub_window The variable, into which the chart subwindow number will be
 * written. 0 means the main chart window.
 * @param time The time value on the chart, for which the value in pixels along
 * the X axis will be received. The origin is in the upper left corner of the
 * main chart window.
 * @param price The price value on the chart, for which the value in pixels
 * along the Y axis will be received. The origin is in the upper left corner of
 * the main chart window.
 * @returns Returns true if successful, otherwise false. To get information
 * about the error, call the GetLastError() function.
 */
bool ChartXYToTimePrice(long chart_id,
                        int x,
                        int y,
                        int& sub_window,
                        datetime& time,
                        double& price);

/**
 * Opens a new chart with the specified symbol and period.
 *
 * @param symbol Chart symbol. NULL means the symbol of the current chart (the
 * Expert Advisor is attached to).
 * @param period Chart period (timeframe). Can be one of the ENUM_TIMEFRAMES
 * values. 0 means the current chart period.
 * @returns If successful, it returns the opened chart ID. Otherwise returns 0.
 */
long ChartOpen(string symbol, ENUM_TIMEFRAMES period);

/**
 * Returns the ID of the first chart of the client terminal.
 *
 * @returns Chart ID.
 */
long ChartFirst();

/**
 * Returns the chart ID of the chart next to the specified one.
 *
 * @param chart_id Chart ID. 0 does not mean the current chart. 0 means "return
 * the first chart ID".
 * @returns Chart ID. If this is the end of the chart list, it returns -1.
 */
long ChartNext(long chart_id);

/**
 * Closes the specified chart.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @returns If successful, returns true, otherwise false.
 */
bool ChartClose(long chart_id = 0);

/**
 * Returns the symbol name for the specified chart.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @returns If chart does not exist, the result will be an empty string.
 */
string ChartSymbol(long chart_id = 0);

/**
 * Returns the timeframe period of specified chart.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @returns The function returns one of the ENUM_TIMEFRAMES values. If chart
 * does not exist, it returns 0.
 */
ENUM_TIMEFRAMES ChartPeriod(long chart_id = 0);

/**
 * This function calls a forced redrawing of a specified chart.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 */
void ChartRedraw(long chart_id = 0);

/**
 * Sets a value for a corresponding property of the specified chart. Chart
 * property should be of a double type. The command is added to chart messages
 * queue and will be executed after processing of all previous commands.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param prop_id Chart property ID. Can be one of the
 * ENUM_CHART_PROPERTY_DOUBLE values (except the read-only properties).
 * @param value Property value.
 * @returns Returns true if the command has been added to chart queue, otherwise
 * false. To get an information about the error, call the GetLastError()
 * function.
 */
bool ChartSetDouble(long chart_id,
                    ENUM_CHART_PROPERTY_DOUBLE prop_id,
                    double value);

/**
 * Sets a value for a corresponding property of the specified chart. Chart
 * property must be datetime, int, color, bool or char. The command is added to
 * chart messages queue and will be executed after processing of all previous
 * commands.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param prop_id Chart property ID. It can be one of the
 * ENUM_CHART_PROPERTY_INTEGER value (except the read-only properties).
 * @param sub_window Number of the chart subwindow. For the first case, the
 * default value is 0 (main chart window). The most of the properties do not
 * require a subwindow number.
 * @param value Property value.
 * @returns Returns true if the command has been added to chart queue, otherwise
 * false. To get an information about the error, call the GetLastError()
 * function.
 */
bool ChartSetInteger(long chart_id,
                     ENUM_CHART_PROPERTY_INTEGER prop_id,
                     long value);
bool ChartSetInteger(long chart_id,
                     ENUM_CHART_PROPERTY_INTEGER prop_id,
                     int sub_window,
                     long value);

/**
 * Sets a value for a corresponding property of the specified chart. Chart
 * property must be of the string type. The command is added to chart messages
 * queue and will be executed after processing of all previous commands.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param prop_id Chart property ID. Its value can be one of the
 * ENUM_CHART_PROPERTY_STRING values (except the read-only properties).
 * @param str_value Property value string. String length cannot exceed 2045
 * characters (extra characters will be truncated).
 * @returns Returns true if the command has been added to chart queue, otherwise
 * false. To get an information about the error, call the GetLastError()
 * function.
 */
bool ChartSetString(long chart_id,
                    ENUM_CHART_PROPERTY_STRING prop_id,
                    string str_value);

/**
 * Returns the value of a corresponding property of the specified chart. Chart
 * property must be of double type. There are 2 variants of the function calls.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param prop_id Chart property ID. This value can be one of the
 * ENUM_CHART_PROPERTY_DOUBLE values.
 * @param sub_window Number of the chart subwindow. For the first case, the
 * default value is 0 (main chart window). The most of the properties do not
 * require a subwindow number.
 * @param double_var Target variable of double type for the requested property.
 * @returns For the second call case it returns true if the specified property
 * is available and its value has been placed into double_var variable,
 * otherwise returns false. To get an additional information about the error, it
 * is necessary to call the function GetLastError().
 */
double ChartGetDouble(long chart_id,
                      ENUM_CHART_PROPERTY_DOUBLE prop_id,
                      int sub_window = 0);
bool ChartGetDouble(long chart_id,
                    ENUM_CHART_PROPERTY_DOUBLE prop_id,
                    int sub_window,
                    double& double_var);

/**
 * Returns the value of a corresponding property of the specified chart. Chart
 * property must be of datetime, int or bool type. There are 2 variants of the
 * function calls.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param prop_id Chart property ID. This value can be one of the
 * ENUM_CHART_PROPERTY_INTEGER values.
 * @param sub_window Number of the chart subwindow. For the first case, the
 * default value is 0 (main chart window). The most of the properties do not
 * require a subwindow number.
 * @param long_var Target variable of long type for the requested property.
 * @returns For the second call case it returns true if specified property is
 * available and its value has been stored into long_var variable, otherwise
 * returns false. To get additional information about the error, it is necessary
 * to call the function GetLastError().
 */
long ChartGetInteger(long chart_id,
                     ENUM_CHART_PROPERTY_INTEGER prop_id,
                     int sub_window = 0);
bool ChartGetInteger(long chart_id,
                     ENUM_CHART_PROPERTY_INTEGER prop_id,
                     int sub_window,
                     long& long_var);

/**
 * Returns the value of a corresponding property of the specified chart. Chart
 * property must be of string type. There are 2 variants of the function call.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param prop_id Chart property ID. This value can be one of the
 * ENUM_CHART_PROPERTY_STRING values.
 * @param string_var Target variable of string type for the requested property.
 * @returns For the second call case it returns true if the specified property
 * is available and its value has been stored into string_var variable,
 * otherwise returns false. To get additional information about the error, it is
 * necessary to call the function GetLastError().
 */
string ChartGetString(long chart_id, ENUM_CHART_PROPERTY_STRING prop_id);
bool ChartGetString(long chart_id,
                    ENUM_CHART_PROPERTY_STRING prop_id,
                    string& string_var);

/**
 * Performs shift of the specified chart by the specified number of bars
 * relative to the specified position in the chart.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param position Chart position to perform a shift. Can be one of the
 * ENUM_CHART_POSITION values.
 * @param shift Number of bars to shift the chart. Positive value means the
 * right shift (to the end of chart), negative value means the left shift (to
 * the beginning of chart). The zero shift can be used to navigate to the
 * beginning or end of chart.
 * @returns Returns true if successful, otherwise returns false.
 */
bool ChartNavigate(long chart_id, ENUM_CHART_POSITION position, int shift = 0);

/**
 * Returns the ID of the current chart.
 *
 * @returns Value of long type.
 */
long ChartID();

/**
 * Adds an indicator with the specified handle into a specified chart window.
 * Indicator and chart should be generated on the same symbol and time frame.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param sub_window The number of the chart sub-window. 0 means the main chart
 * window. To add an indicator in a new window, the parameter must be one
 * greater than the index of the last existing window, i.e. equal to
 * CHART_WINDOWS_TOTAL. If the value of the parameter is greater than
 * CHART_WINDOWS_TOTAL, a new window will not be created, and the indicator will
 * not be added.
 * @param indicator_handle The handle of the indicator.
 * @returns The function returns true in case of success, otherwise it returns
 * false. In order to obtain information about the error, call the
 * GetLastError() function. Error 4114 means that a chart and an added indicator
 * differ by their symbol or time frame.
 */
bool ChartIndicatorAdd(long chart_id, int sub_window, int indicator_handle);

/**
 * Removes an indicator with a specified name from the specified chart window.
 *
 * @param chart_id Chart ID. 0 denotes the current chart.
 * @param sub_window Number of the chart subwindow. 0 denotes the main chart
 * subwindow.
 * @param const indicator_shortname The short name of the indicator which is set
 * in the INDICATOR_SHORTNAME property with the IndicatorSetString() function.
 * To get the short name of an indicator use the ChartIndicatorName() function.
 * @returns Returns true in case of successful deletion of the indicator.
 * Otherwise it returns false. To get error details use the GetLastError()
 * function.
 */
bool ChartIndicatorDelete(long chart_id,
                          int sub_window,
                          const string indicator_shortname);

/**
 * Returns the handle of the indicator with the specified short name in the
 * specified chart window.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param sub_window The number of the chart subwindow. 0 means the main chart
 * window.
 * @param const indicator_shortname The short name if the indicator, which is
 * set in the INDICATOR_SHORTNAME property using the IndicatorSetString()
 * function. To get the short name of an indicator, use the ChartIndicatorName()
 * function.
 * @returns Returns an indicator handle if successful, otherwise returns
 * INVALID_HANDLE. To get information about the error, call the GetLastError()
 * function.
 */
int ChartIndicatorGet(long chart_id,
                      int sub_window,
                      const string indicator_shortname);

/**
 * Returns the short name of the indicator by the number in the indicators list
 * on the specified chart window.
 *
 * @param chart_id Chart ID. 0 denotes the current chart.
 * @param sub_window Number of the chart subwindow. 0 denotes the main chart
 * subwindow.
 * @param index the index of the indicator in the list of indicators. The
 * numeration of indicators start with zero, i.e. the first indicator in the
 * list has the 0 index. To obtain the number of indicators in the list use the
 * ChartIndicatorsTotal() function.
 * @returns The short name of the indicator which is set in the
 * INDICATOR_SHORTNAME property with the IndicatorSetString() function. To get
 * error details use the GetLastError() function.
 */
string ChartIndicatorName(long chart_id, int sub_window, int index);

/**
 * Returns the number of all indicators applied to the specified chart window.
 *
 * @param chart_id Chart ID. 0 denotes the current chart.
 * @param sub_window Number of the chart subwindow. 0 denotes the main chart
 * subwindow.
 * @returns The number of indicators in the specified chart window. To get error
 * details use the GetLastError() function.
 */
int ChartIndicatorsTotal(long chart_id, int sub_window);

/**
 * Returns the number (index) of the chart subwindow the Expert Advisor or
 * script has been dropped to. 0 means the main chart window.
 *
 * @returns Value of int type.
 */
int ChartWindowOnDropped();

/**
 * Returns the price coordinate corresponding to the chart point the Expert
 * Advisor or script has been dropped to.
 *
 * @returns Value of double type.
 */
double ChartPriceOnDropped();

/**
 * Returns the time coordinate corresponding to the chart point the Expert
 * Advisor or script has been dropped to.
 *
 * @returns Value of datetime type.
 */
datetime ChartTimeOnDropped();

/**
 * Returns the X coordinate of the chart point the Expert Advisor or script has
 * been dropped to.
 *
 * @returns The X coordinate value.
 */
int ChartXOnDropped();

/**
 * Returns the Y coordinateof the chart point the Expert Advisor or script has
 * been dropped to.
 *
 * @returns The Y coordinate value.
 */
int ChartYOnDropped();

/**
 * Changes the symbol and period of the specified chart. The function is
 * asynchronous, i.e. it sends the command and does not wait for its execution
 * completion. The command is added to chart messages queue and will be executed
 * after processing of all previous commands.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param symbol Chart symbol. NULL value means the current chart symbol (Expert
 * Advisor is attached to)
 * @param period Chart period (timeframe). Can be one of the ENUM_TIMEFRAMES
 * values. 0 means the current chart period.
 * @returns Returns true if the command has been added to chart queue, otherwise
 * false. To get an information about the error, call the GetLastError()
 * function.
 */
bool ChartSetSymbolPeriod(long chart_id, string symbol, ENUM_TIMEFRAMES period);

/**
 * The function provides a screenshot of the chart in its current state in the
 * GIF, PNG or BMP format depending on specified extension.
 *
 * @param chart_id Chart ID. 0 means the current chart.
 * @param filename Screenshot file name. Cannot exceed 63 characters. Screenshot
 * files are placed in the \\Files directory.
 * @param width Screenshot width in pixels.
 * @param height Screenshot height in pixels.
 * @param align_mode Output mode of a narrow screenshot.
 * @returns Returns true if successful, otherwise false.
 */
bool ChartScreenShot(long chart_id,
                     string filename,
                     int width,
                     int height,
                     ENUM_ALIGN_MODE align_mode = ALIGN_RIGHT);
