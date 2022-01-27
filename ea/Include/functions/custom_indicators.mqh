#include "Include/enums/custom_indicators.mqh"
#include "Include/enums/drawing.mqh"
#include "Include/types/data_types.mqh"

/**
 * The function binds a specified indicator buffer with one-dimensional dynamic
 * array of the double type.
 *
 * @param index Number of the indicator buffer. The numbering starts with 0. The
 * number must be less than the value declared in #property indicator_buffers.
 * @param buffer An array declared in the custom indicator program.
 * @param data_type Type of data stored in the indicator array. By default it is
 * INDICATOR_DATA (values of the calculated indicator). It may also take the
 * value of INDICATOR_COLOR_INDEX; in this case this buffer is used for storing
 * color indexes for the previous indicator buffer. You can specify up to 64
 * colors in the #property indicator_colorN line. The INDICATOR_CALCULATIONS
 * value means that the buffer is used in intermediate calculations of the
 * indicator and is not intended for drawing.
 * @returns If successful, returns true, otherwise - false.
 */
bool SetIndexBuffer(int index,
                    double buffer[],
                    ENUM_INDEXBUFFER_TYPE data_type);

/**
 * The function sets the value of the corresponding indicator property.
 * Indicator property must be of the double type. There are two variants of the
 * function.
 *
 * @param prop_id Identifier of the indicator property. The value can be one of
 * the values of the ENUM_CUSTOMIND_PROPERTY_DOUBLE enumeration.
 * @param prop_modifier Modifier of the specified property. Only level
 * properties require a modifier. Numbering of levels starts from 0. It means
 * that in order to set property for the second level you need to specify 1 (1
 * less than when using compiler directive).
 * @param prop_value Value of property.
 * @returns In case of successful execution, returns true, otherwise - false.
 */
bool IndicatorSetDouble(ENUM_CUSTOMIND_PROPERTY_DOUBLE prop_id,
                        double prop_value);
bool IndicatorSetDouble(ENUM_CUSTOMIND_PROPERTY_DOUBLE prop_id,
                        int prop_modifier,
                        double prop_value);

/**
 * The function sets the value of the corresponding indicator property.
 * Indicator property must be of the int or color type. There are two variants
 * of the function.
 *
 * @param prop_id Identifier of the indicator property. The value can be one of
 * the values of the ENUM_CUSTOMIND_PROPERTY_INTEGER enumeration.
 * @param prop_modifier Modifier of the specified property. Only level
 * properties require a modifier.
 * @param prop_value Value of property.
 * @returns In case of successful execution, returns true, otherwise - false.
 */
bool IndicatorSetInteger(ENUM_CUSTOMIND_PROPERTY_INTEGER prop_id,
                         int prop_value);
bool IndicatorSetInteger(ENUM_CUSTOMIND_PROPERTY_INTEGER prop_id,
                         int prop_modifier,
                         int prop_value);

/**
 * The function sets the value of the corresponding indicator property.
 * Indicator property must be of the string type. There are two variants of
 * the function.
 *
 * @param prop_id Identifier of the indicator property. The value can be one
 * of the values of the ENUM_CUSTOMIND_PROPERTY_STRING enumeration.
 * @param prop_modifier Modifier of the specified property. Only level
 * properties require a modifier.
 * @param prop_value Value of property.
 * @returns In case of successful execution, returns true, otherwise -
 * false.
 */
bool IndicatorSetString(ENUM_CUSTOMIND_PROPERTY_STRING prop_id,
                        string prop_value);
bool IndicatorSetString(ENUM_CUSTOMIND_PROPERTY_STRING prop_id,
                        int prop_modifier,
                        string prop_value);

/**
 * The function sets the value of the corresponding property of the
 * corresponding indicator line. The indicator property must be of the
 * double type.
 *
 * @param plot_index Index of the graphical plotting
 * @param prop_id The value can be one of the values of the
 * ENUM_PLOT_PROPERTY_DOUBLE enumeration.
 * @param prop_value The value of the property.
 * @returns If successful, returns true, otherwise false.
 */
bool PlotIndexSetDouble(int plot_index,
                        ENUM_PLOT_PROPERTY_DOUBLE prop_id,
                        double prop_value);

/**
 * The function sets the value of the corresponding property of the
 * corresponding indicator line. The indicator property must be of the int,
 * char, bool or color type. There are 2 variants of the function.
 *
 * @param plot_index Index of the graphical plotting
 * @param prop_id The value can be one of the values of the
 * ENUM_PLOT_PROPERTY_INTEGER enumeration.
 * @param prop_modifier Modifier of the specified property. Only color index
 * properties require a modifier.
 * @param prop_value The value of the property.
 * @returns If successful, returns true, otherwise false.
 */
bool PlotIndexSetInteger(int plot_index,
                         ENUM_PLOT_PROPERTY_INTEGER prop_id,
                         int prop_value);
bool PlotIndexSetInteger(int plot_index,
                         ENUM_PLOT_PROPERTY_INTEGER prop_id,
                         int prop_modifier,
                         int prop_value);

/**
 * The function sets the value of the corresponding property of the
 * corresponding indicator line. The indicator property must be of the string
 * type.
 *
 * @param plot_index Index of graphical plot
 * @param prop_id The value can be one of the values of the
 * ENUM_PLOT_PROPERTY_STRING enumeration.
 * @param prop_value The value of the property.
 * @returns If successful, returns true, otherwise false.
 */
bool PlotIndexSetString(int plot_index,
                        ENUM_PLOT_PROPERTY_STRING prop_id,
                        string prop_value);

/**
 * The function sets the value of the corresponding property of the
 * corresponding indicator line. The indicator property must be of the int,
 * color, bool or char type. There are 2 variants of the function.
 *
 * @param plot_index Index of the graphical plotting
 * @param prop_id The value can be one of the values of the
 * ENUM_PLOT_PROPERTY_INTEGER enumeration.
 * @param prop_modifier Modifier of the specified property. Only color index
 * properties require a modifier.
 */
int PlotIndexGetInteger(int plot_index, ENUM_PLOT_PROPERTY_INTEGER prop_id);
int PlotIndexGetInteger(int plot_index,
                        ENUM_PLOT_PROPERTY_INTEGER prop_id,
                        int prop_modifier);
