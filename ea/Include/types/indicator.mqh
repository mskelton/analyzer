#include "Include/enums/indicator.mqh"
#include "Include/types/data_types.mqh"

struct MqlParam {
  /**
   * Type of the input parameter, value of ENUM_DATATYPE
   */
  ENUM_DATATYPE type;
  /**
   * Field to store an integer type
   */
  long integer_value;
  /**
   * Field to store a double type
   */
  double double_value;
  /**
   * Field to store a string type
   */
  string string_value;
};
