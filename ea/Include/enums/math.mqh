#undef FP_SUBNORMAL;
#undef FP_NORMAL;
#undef FP_ZERO;
#undef FP_INFINITE;
#undef FP_NAN;

typedef enum ENUM_FP_CLASS {
  /**
   * A subnormal number which is closer to zero than the smallest representable
   * normal number DBL_MIN (2.2250738585072014e-308)
   */
  FP_SUBNORMAL,
  /**
   * A normal number in the range between 2.2250738585072014e-308
   * and 1.7976931348623158e+308
   */
  FP_NORMAL,
  /**
   * A positive or a negative zero
   */
  FP_ZERO,
  /**
   * A number which cannot be represented by the appropriate type, positive or
   * negative infinity
   */
  FP_INFINITE,
  /**
   * Not a number.
   */
  FP_NAN,
} ENUM_FP_CLASS;
