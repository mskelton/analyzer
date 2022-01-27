typedef enum ENUM_DRAW_TYPE {
  /**
   * Not drawn
   */
  DRAW_NONE,
  /**
   * Line
   */
  DRAW_LINE,
  /**
   * Section
   */
  DRAW_SECTION,
  /**
   * Histogram from the zero line
   */
  DRAW_HISTOGRAM,
  /**
   * Histogram of the two indicator buffers
   */
  DRAW_HISTOGRAM2,
  /**
   * Drawing arrows
   */
  DRAW_ARROW,
  /**
   * Style Zigzag allows vertical section on the bar
   */
  DRAW_ZIGZAG,
  /**
   * Color fill between the two levels
   */
  DRAW_FILLING,
  /**
   * Display as a sequence of bars
   */
  DRAW_BARS,
  /**
   * Display as a sequence of candlesticks
   */
  DRAW_CANDLES,
  /**
   * Multicolored line
   */
  DRAW_COLOR_LINE,
  /**
   * Multicolored section
   */
  DRAW_COLOR_SECTION,
  /**
   * Multicolored histogram from the zero line
   */
  DRAW_COLOR_HISTOGRAM,
  /**
   * Multicolored histogram of the two indicator buffers
   */
  DRAW_COLOR_HISTOGRAM2,
  /**
   * Drawing multicolored arrows
   */
  DRAW_COLOR_ARROW,
  /**
   * Multicolored ZigZag
   */
  DRAW_COLOR_ZIGZAG,
  /**
   * Multicolored bars
   */
  DRAW_COLOR_BARS,
  /**
   * Multicolored candlesticks
   */
  DRAW_COLOR_CANDLES,
} ENUM_DRAW_TYPE;

typedef enum ENUM_PLOT_PROPERTY_INTEGER {
  /**
   * Arrow code for style DRAW_ARROW
   */
  PLOT_ARROW,
  /**
   * Vertical shift of arrows for style DRAW_ARROW
   */
  PLOT_ARROW_SHIFT,
  /**
   * Number of initial bars without drawing and values in the DataWindow
   */
  PLOT_DRAW_BEGIN,
  /**
   * Type of graphical construction
   */
  PLOT_DRAW_TYPE,
  /**
   * Sign of display of construction values in the DataWindow
   */
  PLOT_SHOW_DATA,
  /**
   * Shift of indicator plotting along the time axis in bars
   */
  PLOT_SHIFT,
  /**
   * Drawing line style
   */
  PLOT_LINE_STYLE,
  /**
   * The thickness of the drawing line
   */
  PLOT_LINE_WIDTH,
  /**
   * The number of colors
   */
  PLOT_COLOR_INDEXES,
  /**
   * The index of a buffer containing the drawing color
   */
  PLOT_LINE_COLOR,
} ENUM_PLOT_PROPERTY_INTEGER;

typedef enum ENUM_PLOT_PROPERTY_DOUBLE {
  /**
   * An empty value for plotting, for which there is no drawing
   */
  PLOT_EMPTY_VALUE,
} ENUM_PLOT_PROPERTY_DOUBLE;

typedef enum ENUM_PLOT_PROPERTY_STRING {
  /**
   * The name of the indicator graphical series to display in the DataWindow.
   * When working with complex graphical styles requiring several indicator
   * buffers for display, the names for each buffer can be specified using ";"
   * as a separator. Sample code is shown in DRAW_CANDLES
   */
  PLOT_LABEL,
} ENUM_PLOT_PROPERTY_STRING;

typedef enum ENUM_LINE_STYLE {
  /**
   * Solid line
   */
  STYLE_SOLID,
  /**
   * Broken line
   */
  STYLE_DASH,
  /**
   * Dotted line
   */
  STYLE_DOT,
  /**
   * Dash-dot line
   */
  STYLE_DASHDOT,
  /**
   * Dash - two points
   */
  STYLE_DASHDOTDOT,
} ENUM_LINE_STYLE;
