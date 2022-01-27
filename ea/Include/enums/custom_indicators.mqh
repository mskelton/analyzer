typedef enum ENUM_INDEXBUFFER_TYPE {
  /**
   * Data to draw
   */
  INDICATOR_DATA,
  /**
   * Color
   */
  INDICATOR_COLOR_INDEX,
  /**
   * Auxiliary buffers for intermediate calculations
   */
  INDICATOR_CALCULATIONS,
} ENUM_INDEXBUFFER_TYPE;

typedef enum ENUM_CUSTOMIND_PROPERTY_INTEGER {
  /**
   * Accuracy of drawing of indicator values
   */
  INDICATOR_DIGITS,
  /**
   * Fixed height of the indicator's window (the preprocessor command #property
   * indicator_height)
   */
  INDICATOR_HEIGHT,
  /**
   * Number of levels in the indicator window
   */
  INDICATOR_LEVELS,
  /**
   * Color of the level line
   */
  INDICATOR_LEVELCOLOR,
  /**
   * Style of the level line
   */
  INDICATOR_LEVELSTYLE,
  /**
   * Thickness of the level line
   */
  INDICATOR_LEVELWIDTH,
} ENUM_CUSTOMIND_PROPERTY_INTEGER;

typedef enum ENUM_CUSTOMIND_PROPERTY_DOUBLE {
  /**
   * Minimum of the indicator window
   */
  INDICATOR_MINIMUM,
  /**
   * Maximum of the indicator window
   */
  INDICATOR_MAXIMUM,
  /**
   * Level value
   */
  INDICATOR_LEVELVALUE,
} ENUM_CUSTOMIND_PROPERTY_DOUBLE;

typedef enum ENUM_CUSTOMIND_PROPERTY_STRING {
  /**
   * Short indicator name
   */
  INDICATOR_SHORTNAME,
  /**
   * Level description
   */
  INDICATOR_LEVELTEXT,
} ENUM_CUSTOMIND_PROPERTY_STRING;
