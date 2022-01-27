#include "Include/enums/misc.mqh"
#include "Include/enums/object.mqh"
#include "Include/types/data_types.mqh"

/**
 * The function creates an object with the specified name, type, and the initial
 * coordinates in the specified chart subwindow. During creation up to 30
 * coordinates can be specified.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object. The name must be unique within a chart,
 * including its subwindows.
 * @param type Object type. The value can be one of the values of the
 * ENUM_OBJECT enumeration.
 * @param sub_window Number of the chart subwindow. 0 means the main chart
 * window. The specified subwindow must exist, otherwise the function returns
 * false.
 * @param time1 The time coordinate of the first anchor.
 * @param price1 The price coordinate of the first anchor point.
 * @returns The function returns true if the command has been successfully added
 * to the queue of the specified chart, or false otherwise. If an object has
 * already been created, an attempt is made to change its coordinates.
 */
bool ObjectCreate(long chart_id,
                  string name,
                  ENUM_OBJECT type,
                  int sub_window,
                  datetime time1,
                  double price1,
                  ...);

/**
 * The function returns the name of the corresponding object in the specified
 * chart, in the specified subwindow, of the specified type.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param pos Ordinal number of the object according to the specified filter by
 * the number and type of the subwindow.
 * @param sub_window Number of the chart subwindow. 0 means the main chart
 * window, -1 means all the subwindows of the chart, including the main window.
 * @param type Type of the object. The value can be one of the values of the
 * ENUM_OBJECT enumeration. -1 means all types.
 * @returns Name of the object is returned in case of success.
 */
string ObjectName(long chart_id, int pos, int sub_window = -1, int type = -1);

/**
 * The function removes the object with the specified name from the specified
 * chart.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of object to be deleted.
 * @returns The function returns true if the command has been successfully added
 * to the queue of the specified chart, or false otherwise.
 */
bool ObjectDelete(long chart_id, string name);

/**
 * Removes all objects from the specified chart, specified chart subwindow, of
 * the specified type.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param prefix Prefix in object names. All objects whose names start with this
 * set of characters will be removed from chart. You can specify prefix as
 * 'name' or 'name*' – both variants will work the same. If an empty string is
 * specified as the prefix, objects with all possible names will be removed.
 * @param sub_window Number of the chart subwindow. 0 means the main chart
 * window, -1 means all the subwindows of the chart, including the main window.
 * @param type Type of the object. The value can be one of the values of the
 * ENUM_OBJECT enumeration. -1 means all types.
 * @returns Returns the number of deleted objects. To read more about the error
 * call GetLastError().
 */
int ObjectsDeleteAll(long chart_id, int sub_window = -1, int type = -1);
int ObjectsDeleteAll(long chart_id,
                     const string prefix,
                     int sub_window = -1,
                     int object_type = -1);

/**
 * The function searches for an object with the specified name in the chart with
 * the specified ID.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name The name of the searched object.
 * @returns If successful the function returns the number of the subwindow (0
 * means the main window of the chart), in which the object is found. If the
 * object is not found, the function returns a negative number. To read more
 * about the error call GetLastError().
 */
int ObjectFind(long chart_id, string name);

/**
 * The function returns the time value for the specified price value of the
 * specified object.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param value Price value.
 * @param line_id Line identifier.
 * @returns The time value for the specified price value of the specified
 * object.
 */
datetime ObjectGetTimeByValue(long chart_id,
                              string name,
                              double value,
                              int line_id);

/**
 * The function returns the price value for the specified time value of the
 * specified object.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param time Time value.
 * @param line_id Line ID.
 * @returns The price value for the specified time value of the specified
 * object.
 */
double ObjectGetValueByTime(long chart_id,
                            string name,
                            datetime time,
                            int line_id);

/**
 * The function changes coordinates of the specified anchor point of the object.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param point_index Index of the anchor point. The number of anchor points
 * depends on the type of object.
 * @param price Price coordinate of the selected anchor point.
 * @returns The function returns true if the command has been successfully added
 * to the queue of the specified chart, or false otherwise.
 */
bool ObjectMove(long chart_id,
                string name,
                int point_index,
                datetime time,
                double price);

/**
 * The function returns the number of objects in the specified chart, specified
 * subwindow, of the specified type.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param sub_window Number of the chart subwindow. 0 means the main chart
 * window, -1 means all the subwindows of the chart, including the main window.
 * @param type Type of the object. The value can be one of the values of the
 * ENUM_OBJECT enumeration. -1 means all types.
 * @returns The number of objects.
 */
int ObjectsTotal(long chart_id, int sub_window = -1, int type = -1);

/**
 * The function sets the value of the corresponding object property. The object
 * property must be of the double type. There are 2 variants of the function.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param prop_id ID of the object property. The value can be one of the values
 * of the ENUM_OBJECT_PROPERTY_DOUBLE enumeration.
 * @param prop_modifier Modifier of the specified property. It denotes the
 * number of the level in Fibonacci tools and in the graphical object Andrew's
 * pitchfork. The numeration of levels starts from zero.
 * @param prop_value The value of the property.
 * @returns The function returns true only if the command to change properties
 * of a graphical object has been sent to a chart successfully. Otherwise it
 * returns false. To read more about the error call GetLastError().
 */
bool ObjectSetDouble(long chart_id,
                     string name,
                     ENUM_OBJECT_PROPERTY_DOUBLE prop_id,
                     double prop_value);
bool ObjectSetDouble(long chart_id,
                     string name,
                     ENUM_OBJECT_PROPERTY_DOUBLE prop_id,
                     int prop_modifier,
                     double prop_value);

/**
 * The function sets the value of the corresponding object property. The object
 * property must be of the datetime, int, color, bool or char type. There are 2
 * variants of the function.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param prop_id ID of the object property. The value can be one of the values
 * of the ENUM_OBJECT_PROPERTY_INTEGER enumeration.
 * @param prop_modifier Modifier of the specified property. It denotes the
 * number of the level in Fibonacci tools and in the graphical object Andrew's
 * pitchfork. The numeration of levels starts from zero.
 * @param prop_value The value of the property.
 * @returns The function returns true only if the command to change properties
 * of a graphical object has been sent to a chart successfully. Otherwise it
 * returns false. To read more about the error call GetLastError().
 */
bool ObjectSetInteger(long chart_id,
                      string name,
                      ENUM_OBJECT_PROPERTY_INTEGER prop_id,
                      long prop_value);
bool ObjectSetInteger(long chart_id,
                      string name,
                      ENUM_OBJECT_PROPERTY_INTEGER prop_id,
                      int prop_modifier,
                      long prop_value);

/**
 * The function sets the value of the corresponding object property. The object
 * property must be of the string type. There are 2 variants of the function.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param prop_id ID of the object property. The value can be one of the values
 * of the ENUM_OBJECT_PROPERTY_STRING enumeration.
 * @param prop_modifier Modifier of the specified property. It denotes the
 * number of the level in Fibonacci tools and in the graphical object Andrew's
 * pitchfork. The numeration of levels starts from zero.
 * @param prop_value The value of the property.
 * @returns The function returns true only if the command to change properties
 * of a graphical object has been sent to a chart successfully. Otherwise it
 * returns false. To read more about the error call GetLastError().
 */
bool ObjectSetString(long chart_id,
                     string name,
                     ENUM_OBJECT_PROPERTY_STRING prop_id,
                     string prop_value);
bool ObjectSetString(long chart_id,
                     string name,
                     ENUM_OBJECT_PROPERTY_STRING prop_id,
                     int prop_modifier,
                     string prop_value);

/**
 * The function returns the value of the corresponding object property. The
 * object property must be of the double type. There are 2 variants of the
 * function.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param prop_id ID of the object property. The value can be one of the values
 * of the ENUM_OBJECT_PROPERTY_DOUBLE enumeration.
 * @param prop_modifier Modifier of the specified property. For the first
 * variant, the default modifier value is equal to 0. Most properties do not
 * require a modifier. It denotes the number of the level in Fibonacci tools and
 * in the graphical object Andrew's pitchfork. The numeration of levels starts
 * from zero.
 * @param double_var Variable of the double type that received the value of the
 * requested property.
 * @returns Value of the double type for the first calling variant. For the
 * second variant the function returns true, if this property is maintained and
 * the value has been placed into the double_var variable, otherwise returns
 * false. To read more about the error call GetLastError().
 */
double ObjectGetDouble(long chart_id,
                       string name,
                       ENUM_OBJECT_PROPERTY_DOUBLE prop_id,
                       int prop_modifier = 0);
bool ObjectGetDouble(long chart_id,
                     string name,
                     ENUM_OBJECT_PROPERTY_DOUBLE prop_id,
                     int prop_modifier,
                     double& double_var);

/**
 * The function returns the value of the corresponding object property. The
 * object property must be of the datetime, int, color, bool or char type. There
 * are 2 variants of the function.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param prop_id ID of the object property. The value can be one of the values
 * of the ENUM_OBJECT_PROPERTY_INTEGER enumeration.
 * @param prop_modifier Modifier of the specified property. For the first
 * variant, the default modifier value is equal to 0. Most properties do not
 * require a modifier. It denotes the number of the level in Fibonacci tools and
 * in the graphical object Andrew's pitchfork. The numeration of levels starts
 * from zero.
 * @param long_var Variable of the long type that receives the value of the
 * requested property.
 * @returns The long value for the first calling variant. For the second variant
 * the function returns true, if this property is maintained and the value has
 * been placed into the long_var variable, otherwise returns false. To read more
 * about the error call GetLastError().
 */
long ObjectGetInteger(long chart_id,
                      string name,
                      ENUM_OBJECT_PROPERTY_INTEGER prop_id,
                      int prop_modifier = 0);
bool ObjectGetInteger(long chart_id,
                      string name,
                      ENUM_OBJECT_PROPERTY_INTEGER prop_id,
                      int prop_modifier,
                      long& long_var);

/**
 * The function returns the value of the corresponding object property. The
 * object property must be of the string type. There are 2 variants of the
 * function.
 *
 * @param chart_id Chart identifier. 0 means the current chart.
 * @param name Name of the object.
 * @param prop_id ID of the object property. The value can be one of the values
 * of the ENUM_OBJECT_PROPERTY_STRING enumeration.
 * @param prop_modifier Modifier of the specified property. For the first
 * variant, the default modifier value is equal to 0. Most properties do not
 * require a modifier. It denotes the number of the level in Fibonacci tools and
 * in the graphical object Andrew's pitchfork. The numeration of levels starts
 * from zero.
 * @param string_var Variable of the string type that receives the value of the
 * requested properties.
 * @returns String value for the first version of the call. For the second
 * version of the call returns true, if this property is maintained and the
 * value has been placed into the string_var variable, otherwise returns false.
 * To read more about the error call GetLastError().
 */
string ObjectGetString(long chart_id,
                       string name,
                       ENUM_OBJECT_PROPERTY_STRING prop_id,
                       int prop_modifier = 0);
bool ObjectGetString(long chart_id,
                     string name,
                     ENUM_OBJECT_PROPERTY_STRING prop_id,
                     int prop_modifier,
                     string& string_var);

/**
 * The function sets the font for displaying the text using drawing methods and
 * returns the result of that operation. Arial font with the size -120 (12 pt)
 * is used by default.
 *
 * @param name Font name in the system or the name of the resource containing
 * the font or the path to font file on the disk.
 * @param size The font size that can be set using positive and negative values.
 * In case of positive values, the size of a displayed text does not depend on
 * the operating system's font size settings. In case of negative values, the
 * value is set in tenths of a point and the text size depends on the operating
 * system settings ("standard scale" or "large scale"). See the Note below for
 * more information about the differences between the modes.
 * @param flags Combination of flags describing font style.
 * @param orientation Text's horizontal inclination to X axis, the unit of
 * measurement is 0.1 degrees. It means that orientation=450 stands for
 * inclination equal to 45 degrees.
 * @returns Returns true if the current font is successfully installed,
 * otherwise false. Possible code errors:
 *
 * ERR_INVALID_PARAMETER(4003) - name presents NULL or "" (empty string),
 * ERR_INTERNAL_ERROR(4001) - operating system error (for example, an attempt to
 * create a non-existent font).
 */
bool TextSetFont(const string name, int size, uint flags, int orientation = 0);

/**
 * The function displays a text in a custom array (buffer) and returns the
 * result of that operation. The array is designed to create the graphical
 * resource.
 *
 * @param text Displayed text that will be written to the buffer. Only one-lined
 * text is displayed.
 * @param x X coordinate of the anchor point of the displayed text.
 * @param y Y coordinate of the anchor point of the displayed text.
 * @param anchor The value out of the 9 pre-defined methods of the displayed
 * text's anchor point location. The value is set by a combination of two flags
 * – flags of horizontal and vertical text align.
 * @param data Buffer, in which text is displayed. The buffer is used to create
 * the graphical resource.
 * @param width Buffer width in pixels.
 * @param height Buffer height in pixels.
 * @param color Text color.
 * @param color_format Color format is set by ENUM_COLOR_FORMAT enumeration
 * value.
 * @returns Returns true if successful, otherwise false.
 */
bool TextOut(const string text,
             int x,
             int y,
             uint anchor,
             uint data[],
             uint width,
             uint height,
             uint color,
             ENUM_COLOR_FORMAT color_format);

/**
 * The function returns the line width and height at the current font settings.
 *
 * @param text String, for which length and width should be obtained.
 * @param width Input parameter for receiving width.
 * @param height Input parameter for receiving height.
 * @returns Returns true if successful, otherwise false. Possible code errors:
 */
bool TextGetSize(const string text, uint& width, uint& height);
