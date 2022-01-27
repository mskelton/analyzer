#include "Include/enums/trade.mqh"

struct MqlBookInfo {
  /**
   * Order type from ENUM_BOOK_TYPE enumeration
   */
  ENUM_BOOK_TYPE type;
  /**
   * Price
   */
  double price;
  /**
   * Volume
   */
  long volume;
  /**
   * Volume with greater accuracy
   */
  double volume_real;
};
