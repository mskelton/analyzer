typedef enum ENUM_CHART_PROPERTY_INTEGER {
  /**
   * Price chart drawing. If false, drawing any price chart attributes is
   * disabled and all chart border indents are eliminated, including time and
   * price scales, quick navigation bar, Calendar event labels, trade labels,
   * indicator and bar tooltips, indicator subwindows, volume histograms, etc.
   * Disabling the drawing is a perfect solution for creating a custom program
   * interface using the graphical resources. The graphical objects are always
   * drawn regardless of the CHART_SHOW property value.
   */
  CHART_SHOW,
  /**
   * Identifying "Chart" (OBJ_CHART) object – returns true for a graphical
   * object. Returns false for a real chart
   */
  CHART_IS_OBJECT,
  /**
   * Show chart on top of other charts
   */
  CHART_BRING_TO_TOP,
  /**
   * Enabling/disabling access to the context menu using the right click.
   * When CHART_CONTEXT_MENU=false, only the chart context menu is disabled. The
   * context menu of objects on the chart remains available.
   */
  CHART_CONTEXT_MENU,
  /**
   * Enabling/disabling access to the Crosshair tool using the middle click.
   */
  CHART_CROSSHAIR_TOOL,
  /**
   * Scrolling the chart horizontally using the left mouse button. Vertical
   * scrolling is also available if the value of any following properties is set
   * to true: CHART_SCALEFIX, CHART_SCALEFIX_11 or CHART_SCALE_PT_PER_BAR When
   * CHART_MOUSE_SCROLL=false, chart scrolling with the mouse wheel is
   * unavailable
   */
  CHART_MOUSE_SCROLL,
  /**
   * Sending messages about mouse wheel events (CHARTEVENT_MOUSE_WHEEL) to all
   * mql5 programs on a chart
   */
  CHART_EVENT_MOUSE_WHEEL,
  /**
   * Send notifications of mouse move and mouse click events
   * (CHARTEVENT_MOUSE_MOVE) to all mql5 programs on a chart
   */
  CHART_EVENT_MOUSE_MOVE,
  /**
   * Send a notification of an event of new object creation
   * (CHARTEVENT_OBJECT_CREATE) to all mql5-programs on a chart
   */
  CHART_EVENT_OBJECT_CREATE,
  /**
   * Send a notification of an event of object deletion
   * (CHARTEVENT_OBJECT_DELETE) to all mql5-programs on a chart
   */
  CHART_EVENT_OBJECT_DELETE,
  /**
   * Chart type (candlesticks, bars or line)
   */
  CHART_MODE,
  /**
   * Price chart in the foreground
   */
  CHART_FOREGROUND,
  /**
   * Mode of price chart indent from the right border
   */
  CHART_SHIFT,
  /**
   * Mode of automatic moving to the right border of the chart
   */
  CHART_AUTOSCROLL,
  /**
   * Allow managing the chart using a keyboard ("Home", "End", "PageUp", "+",
   * "-", "Up arrow", etc.). Setting CHART_KEYBOARD_CONTROL to false disables
   * chart scrolling and scaling while leaving intact the ability to receive the
   * keys pressing events in OnChartEvent().
   */
  CHART_KEYBOARD_CONTROL,
  /**
   * Allow the chart to intercept Space and Enter key strokes to activate the
   * quick navigation bar. The quick navigation bar automatically appears at the
   * bottom of the chart after double-clicking the mouse or pressing
   * Space/Enter. It allows you to quickly change a symbol, timeframe and first
   * visible bar date.
   */
  CHART_QUICK_NAVIGATION,
  /**
   * Scale
   */
  CHART_SCALE,
  /**
   * Fixed scale mode
   */
  CHART_SCALEFIX,
  /**
   * Scale 1:1 mode
   */
  CHART_SCALEFIX_11,
  /**
   * Scale to be specified in points per bar
   */
  CHART_SCALE_PT_PER_BAR,
  /**
   * Display a symbol ticker in the upper left corner. Setting CHART_SHOW_TICKER
   * to 'false' also sets CHART_SHOW_OHLC to 'false' and disables OHLC
   */
  CHART_SHOW_TICKER,
  /**
   * Display OHLC values in the upper left corner. Setting CHART_SHOW_OHLC to
   * 'true' also sets CHART_SHOW_TICKER to 'true' and enables the ticker
   */
  CHART_SHOW_OHLC,
  /**
   * Display Bid values as a horizontal line in a chart
   */
  CHART_SHOW_BID_LINE,
  /**
   * Display Ask values as a horizontal line in a chart
   */
  CHART_SHOW_ASK_LINE,
  /**
   * Display Last values as a horizontal line in a chart
   */
  CHART_SHOW_LAST_LINE,
  /**
   * Display vertical separators between adjacent periods
   */
  CHART_SHOW_PERIOD_SEP,
  /**
   * Display grid in the chart
   */
  CHART_SHOW_GRID,
  /**
   * Display volume in the chart
   */
  CHART_SHOW_VOLUMES,
  /**
   * Display textual descriptions of objects (not available for all objects)
   */
  CHART_SHOW_OBJECT_DESCR,
  /**
   * The number of bars on the chart that can be displayed
   */
  CHART_VISIBLE_BARS,
  /**
   * The total number of chart windows, including indicator subwindows
   */
  CHART_WINDOWS_TOTAL,
  /**
   * Visibility of subwindows
   */
  CHART_WINDOW_IS_VISIBLE,
  /**
   * Chart window handle (HWND)
   */
  CHART_WINDOW_HANDLE,
  /**
   * The distance between the upper frame of the indicator subwindow and the
   * upper frame of the main chart window, along the vertical Y axis, in pixels.
   * In case of a mouse event, the cursor coordinates are passed in terms of the
   * coordinates of the main chart window, while the coordinates of graphical
   * objects in an indicator subwindow are set relative to the upper left corner
   * of the subwindow.
   *
   * The value is required for converting the absolute
   * coordinates of the main chart to the local coordinates of a subwindow for
   * correct work with the graphical objects, whose coordinates are set relative
   * to  the upper left corner of the subwindow frame.
   */
  CHART_WINDOW_YDISTANCE,
  /**
   * Number of the first visible bar in the chart. Indexing of bars is the same
   * as for timeseries.
   */
  CHART_FIRST_VISIBLE_BAR,
  /**
   * Chart width in bars
   */
  CHART_WIDTH_IN_BARS,
  /**
   * Chart width in pixels
   */
  CHART_WIDTH_IN_PIXELS,
  /**
   * Chart height in pixels
   */
  CHART_HEIGHT_IN_PIXELS,
  /**
   * Chart background color
   */
  CHART_COLOR_BACKGROUND,
  /**
   * Color of axes, scales and OHLC line
   */
  CHART_COLOR_FOREGROUND,
  /**
   * Grid color
   */
  CHART_COLOR_GRID,
  /**
   * Color of volumes and position opening levels
   */
  CHART_COLOR_VOLUME,
  /**
   * Color for the up bar, shadows and body borders of bull candlesticks
   */
  CHART_COLOR_CHART_UP,
  /**
   * Color for the down bar, shadows and body borders of bear candlesticks
   */
  CHART_COLOR_CHART_DOWN,
  /**
   * Line chart color and color of "Doji" Japanese candlesticks
   */
  CHART_COLOR_CHART_LINE,
  /**
   * Body color of a bull candlestick
   */
  CHART_COLOR_CANDLE_BULL,
  /**
   * Body color of a bear candlestick
   */
  CHART_COLOR_CANDLE_BEAR,
  /**
   * Bid price level color
   */
  CHART_COLOR_BID,
  /**
   * Ask price level color
   */
  CHART_COLOR_ASK,
  /**
   * Line color of the last executed deal price (Last)
   */
  CHART_COLOR_LAST,
  /**
   * Color of stop order levels (Stop Loss and Take Profit)
   */
  CHART_COLOR_STOP_LEVEL,
  /**
   * Displaying trade levels in the chart (levels of open positions, Stop Loss,
   * Take Profit and pending orders)
   */
  CHART_SHOW_TRADE_LEVELS,
  /**
   * Permission to drag trading levels on a chart with a mouse. The drag mode is
   * enabled by default (true value)
   */
  CHART_DRAG_TRADE_LEVELS,
  /**
   * Showing the time scale on a chart
   */
  CHART_SHOW_DATE_SCALE,
  /**
   * Showing the price scale on a chart
   */
  CHART_SHOW_PRICE_SCALE,
  /**
   * Showing the "One click trading" panel on a chart
   */
  CHART_SHOW_ONE_CLICK,
  /**
   * Chart window is maximized
   */
  CHART_IS_MAXIMIZED,
  /**
   * Chart window is minimized
   */
  CHART_IS_MINIMIZED,
  /**
   * The chart window is docked. If set to false, the chart can be dragged
   * outside the terminal area
   */
  CHART_IS_DOCKED,
  /**
   * The left coordinate of the undocked chart window relative to the virtual
   * screen
   */
  CHART_FLOAT_LEFT,
  /**
   * The top coordinate of the undocked chart window relative to the virtual
   * screen
   */
  CHART_FLOAT_TOP,
  /**
   * The right coordinate of the undocked chart window relative to the virtual
   * screen
   */
  CHART_FLOAT_RIGHT,
  /**
   * The bottom coordinate of the undocked chart window relative to the virtual
   * screen
   */
  CHART_FLOAT_BOTTOM,
} ENUM_CHART_PROPERTY_INTEGER;

typedef enum ENUM_CHART_PROPERTY_DOUBLE {
  /**
   * The size of the zero bar indent from the right border in percents
   */
  CHART_SHIFT_SIZE,
  /**
   * Chart fixed position from the left border in percent value. Chart fixed
   * position is marked by a small gray triangle on the horizontal time axis. It
   * is displayed only if the automatic chart scrolling to the right on tick
   * incoming is disabled (see CHART_AUTOSCROLL property). The bar on a fixed
   * position remains in the same place when zooming in and out.
   */
  CHART_FIXED_POSITION,
  /**
   * Fixed  chart maximum
   */
  CHART_FIXED_MAX,
  /**
   * Fixed  chart minimum
   */
  CHART_FIXED_MIN,
  /**
   * Scale in points per bar
   */
  CHART_POINTS_PER_BAR,
  /**
   * Chart minimum
   */
  CHART_PRICE_MIN,
  /**
   * Chart maximum
   */
  CHART_PRICE_MAX,
} ENUM_CHART_PROPERTY_DOUBLE;

typedef enum ENUM_CHART_PROPERTY_STRING {
  /**
   * Text of a comment in a chart
   */
  CHART_COMMENT,
  /**
   * The name of the Expert Advisor running on the chart with the specified
   * chart_id
   */
  CHART_EXPERT_NAME,
  /**
   * The name of the script running on the chart with the specified chart_id
   */
  CHART_SCRIPT_NAME,
} ENUM_CHART_PROPERTY_STRING;

typedef enum ENUM_CHART_POSITION {
  /**
   * Chart beginning (the oldest prices)
   */
  CHART_BEGIN,
  /**
   * Current position
   */
  CHART_CURRENT_POS,
  /**
   * Chart end (the latest prices)
   */
  CHART_END,
} ENUM_CHART_POSITION;
