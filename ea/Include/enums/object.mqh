typedef enum ENUM_OBJECT {
  /**
   * Vertical Line
   */
  OBJ_VLINE,
  /**
   * Horizontal Line
   */
  OBJ_HLINE,
  /**
   * Trend Line
   */
  OBJ_TREND,
  /**
   * Trend Line By Angle
   */
  OBJ_TRENDBYANGLE,
  /**
   * Cycle Lines
   */
  OBJ_CYCLES,
  /**
   * Arrowed Line
   */
  OBJ_ARROWED_LINE,
  /**
   * Equidistant Channel
   */
  OBJ_CHANNEL,
  /**
   * Standard Deviation Channel
   */
  OBJ_STDDEVCHANNEL,
  /**
   * Linear Regression Channel
   */
  OBJ_REGRESSION,
  /**
   * Andrews’ Pitchfork
   */
  OBJ_PITCHFORK,
  /**
   * Gann Line
   */
  OBJ_GANNLINE,
  /**
   * Gann Fan
   */
  OBJ_GANNFAN,
  /**
   * Gann Grid
   */
  OBJ_GANNGRID,
  /**
   * Fibonacci Retracement
   */
  OBJ_FIBO,
  /**
   * Fibonacci Time Zones
   */
  OBJ_FIBOTIMES,
  /**
   * Fibonacci Fan
   */
  OBJ_FIBOFAN,
  /**
   * Fibonacci Arcs
   */
  OBJ_FIBOARC,
  /**
   * Fibonacci Channel
   */
  OBJ_FIBOCHANNEL,
  /**
   * Fibonacci Expansion
   */
  OBJ_EXPANSION,
  /**
   * Elliott Motive Wave
   */
  OBJ_ELLIOTWAVE5,
  /**
   * Elliott Correction Wave
   */
  OBJ_ELLIOTWAVE3,
  /**
   * Rectangle
   */
  OBJ_RECTANGLE,
  /**
   * Triangle
   */
  OBJ_TRIANGLE,
  /**
   * Ellipse
   */
  OBJ_ELLIPSE,
  /**
   * Thumbs Up
   */
  OBJ_ARROW_THUMB_UP,
  /**
   * Thumbs Down
   */
  OBJ_ARROW_THUMB_DOWN,
  /**
   * Arrow Up
   */
  OBJ_ARROW_UP,
  /**
   * Arrow Down
   */
  OBJ_ARROW_DOWN,
  /**
   * Stop Sign
   */
  OBJ_ARROW_STOP,
  /**
   * Check Sign
   */
  OBJ_ARROW_CHECK,
  /**
   * Left Price Label
   */
  OBJ_ARROW_LEFT_PRICE,
  /**
   * Right Price Label
   */
  OBJ_ARROW_RIGHT_PRICE,
  /**
   * Buy Sign
   */
  OBJ_ARROW_BUY,
  /**
   * Sell Sign
   */
  OBJ_ARROW_SELL,
  /**
   * Arrow
   */
  OBJ_ARROW,
  /**
   * Text
   */
  OBJ_TEXT,
  /**
   * Label
   */
  OBJ_LABEL,
  /**
   * Button
   */
  OBJ_BUTTON,
  /**
   * Chart
   */
  OBJ_CHART,
  /**
   * Bitmap
   */
  OBJ_BITMAP,
  /**
   * Bitmap Label
   */
  OBJ_BITMAP_LABEL,
  /**
   * Edit
   */
  OBJ_EDIT,
  /**
   * The "Event" object corresponding to an event in the economic calendar
   */
  OBJ_EVENT,
  /**
   * The "Rectangle label" object for creating and designing the custom
   * graphical interface.
   */
  OBJ_RECTANGLE_LABEL
} ENUM_OBJECT;

typedef enum ENUM_OBJECT_PROPERTY_INTEGER {
  /**
   * Color
   */
  OBJPROP_COLOR,
  /**
   * Style
   */
  OBJPROP_STYLE,
  /**
   * Line thickness
   */
  OBJPROP_WIDTH,
  /**
   * Object in the background
   */
  OBJPROP_BACK,
  /**
   * Priority of a graphical object for receiving events of clicking on a chart
   * (CHARTEVENT_CLICK). The default zero value is set when creating an object;
   * the priority can be increased if necessary. When objects are placed one
   * atop another, only one of them with the highest priority will receive the
   * CHARTEVENT_CLICK event.
   */
  OBJPROP_ZORDER,
  /**
   * Fill an object with color (for OBJ_RECTANGLE, OBJ_TRIANGLE, OBJ_ELLIPSE,
   * OBJ_CHANNEL, OBJ_STDDEVCHANNEL, OBJ_REGRESSION)
   */
  OBJPROP_FILL,
  /**
   * Prohibit showing of the name of a graphical object in the list of objects
   * from the terminal menu "Charts" - "Objects" - "List of objects". The true
   * value allows to hide an object from the list. By default, true is set to
   * the objects that display calendar events, trading history and to the
   * objects created from MQL5 programs. To see such graphical objects and
   * access their properties, click on the "All" button in the "List of objects"
   * window.
   */
  OBJPROP_HIDDEN,
  /**
   * Object is selected
   */
  OBJPROP_SELECTED,
  /**
   * Ability to edit text in the Edit object
   */
  OBJPROP_READONLY,
  /**
   * Object type
   */
  OBJPROP_TYPE,
  /**
   * Time coordinate
   */
  OBJPROP_TIME,
  /**
   * Object availability
   */
  OBJPROP_SELECTABLE,
  /**
   * Time of object creation
   */
  OBJPROP_CREATETIME,
  /**
   * Number of levels
   */
  OBJPROP_LEVELS,
  /**
   * Color of the line-level
   */
  OBJPROP_LEVELCOLOR,
  /**
   * Style of the line-level
   */
  OBJPROP_LEVELSTYLE,
  /**
   * Thickness of the line-level
   */
  OBJPROP_LEVELWIDTH,
  /**
   * Horizontal text alignment in the "Edit" object (OBJ_EDIT)
   */
  OBJPROP_ALIGN,
  /**
   * Font size
   */
  OBJPROP_FONTSIZE,
  /**
   * Ray goes to the left
   */
  OBJPROP_RAY_LEFT,
  /**
   * Ray goes to the right
   */
  OBJPROP_RAY_RIGHT,
  /**
   * A vertical line goes through all the windows of a chart
   */
  OBJPROP_RAY,
  /**
   * Showing the full ellipse of the Fibonacci Arc object (OBJ_FIBOARC)
   */
  OBJPROP_ELLIPSE,
  /**
   * Arrow code for the Arrow object
   */
  OBJPROP_ARROWCODE,
  /**
   * Visibility of an object at timeframes
   */
  OBJPROP_TIMEFRAMES,
  /**
   * Location of the anchor point of a graphical object
   */
  OBJPROP_ANCHOR,
  /**
   * The distance in pixels along the X axis from the binding corner (see note)
   */
  OBJPROP_XDISTANCE,
  /**
   * The distance in pixels along the Y axis from the binding corner (see note)
   */
  OBJPROP_YDISTANCE,
  /**
   * Trend of the Gann object
   */
  OBJPROP_DIRECTION,
  /**
   * Level of the Elliott Wave Marking
   */
  OBJPROP_DEGREE,
  /**
   * Displaying lines for marking the Elliott Wave
   */
  OBJPROP_DRAWLINES,
  /**
   * Button state (pressed / depressed)
   */
  OBJPROP_STATE,
  /**
   * ID of the "Chart" object (OBJ_CHART). It allows working with the properties
   * of this object like with a normal chart using the functions described in
   * Chart Operations, but there some exceptions.
   */
  OBJPROP_CHART_ID,
  /**
   * The object's width along the X axis in pixels. Specified for  OBJ_LABEL
   * (read only), OBJ_BUTTON, OBJ_CHART, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT,
   * OBJ_RECTANGLE_LABEL objects.
   */
  OBJPROP_XSIZE,
  /**
   * The object's height along the Y axis in pixels. Specified for  OBJ_LABEL
   * (read only), OBJ_BUTTON, OBJ_CHART, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT,
   * OBJ_RECTANGLE_LABEL objects.
   */
  OBJPROP_YSIZE,
  /**
   * The X coordinate of the upper left corner of the rectangular visible area
   * in the graphical objects "Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and
   * OBJ_BITMAP). The value is set in pixels relative to the upper left corner
   * of the original image.
   */
  OBJPROP_XOFFSET,
  /**
   * The Y coordinate of the upper left corner of the rectangular visible area
   * in the graphical objects "Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and
   * OBJ_BITMAP). The value is set in pixels relative to the upper left corner
   * of the original image.
   */
  OBJPROP_YOFFSET,
  /**
   * Timeframe for the Chart object
   */
  OBJPROP_PERIOD,
  /**
   * Displaying the time scale for the Chart object
   */
  OBJPROP_DATE_SCALE,
  /**
   * Displaying the price scale for the Chart object
   */
  OBJPROP_PRICE_SCALE,
  /**
   * The scale for the Chart object
   */
  OBJPROP_CHART_SCALE,
  /**
   * The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL
   */
  OBJPROP_BGCOLOR,
  /**
   * The corner of the chart to link a graphical object
   */
  OBJPROP_CORNER,
  /**
   * Border type for the "Rectangle label" object
   */
  OBJPROP_BORDER_TYPE,
  /**
   * Border color for the OBJ_EDIT and OBJ_BUTTON objects
   */
  OBJPROP_BORDER_COLOR,
} ENUM_OBJECT_PROPERTY_INTEGER;

typedef enum ENUM_OBJECT_PROPERTY_DOUBLE {
  /**
   * Price coordinate
   */
  OBJPROP_PRICE,
  /**
   * Level value
   */
  OBJPROP_LEVELVALUE,
  /**
   * Scale (properties of Gann objects and Fibonacci Arcs)
   */
  OBJPROP_SCALE,
  /**
   * Angle.  For the objects with no angle specified, created from a program,
   * the value is equal to EMPTY_VALUE
   */
  OBJPROP_ANGLE,
  /**
   * Deviation for the Standard Deviation Channel
   */
  OBJPROP_DEVIATION,
} ENUM_OBJECT_PROPERTY_DOUBLE;

typedef enum ENUM_OBJECT_PROPERTY_STRING {
  /**
   * Object name
   */
  OBJPROP_NAME,
  /**
   * Description of the object (the text contained in the object)
   */
  OBJPROP_TEXT,
  /**
   * The text of a tooltip. If the property is not set, then the tooltip
   * generated automatically by the terminal is shown. A tooltip can be disabled
   * by setting the "\n" (line feed) value to it
   */
  OBJPROP_TOOLTIP,
  /**
   * Level description
   */
  OBJPROP_LEVELTEXT,
  /**
   * Font
   */
  OBJPROP_FONT,
  /**
   * The name of BMP-file for Bitmap Label. See also Resources
   */
  OBJPROP_BMPFILE,
  /**
   * Symbol for the Chart object
   */
  OBJPROP_SYMBOL,
} ENUM_OBJECT_PROPERTY_STRING;
