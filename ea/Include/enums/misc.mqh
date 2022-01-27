typedef enum ENUM_COLOR_FORMAT {
  /**
   * The component of the alpha channel is ignored
   */
  COLOR_FORMAT_XRGB_NOALPHA,
  /**
   * Color components are not handled by the terminal (must be correctly set by
   * the user)
   */
  COLOR_FORMAT_ARGB_RAW,
  /**
   * Color components are handled by the terminal
   */
  COLOR_FORMAT_ARGB_NORMALIZE
} ENUM_COLOR_FORMAT;
