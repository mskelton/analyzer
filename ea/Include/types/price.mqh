#include "Include/types/data_types.mqh"

struct MqlTick {
  /**
   * Time of the last prices update
   */
  datetime time;
  /**
   * Current Bid price
   */
  double bid;
  /**
   * Current Ask price
   */
  double ask;
  /**
   * Price of the last deal (Last)
   */
  double last;
  /**
   * Volume for the current Last price
   */
  ulong volume;
  /**
   * Time of a price last update in milliseconds
   */
  long time_msc;
  /**
   * Tick flags
   */
  uint flags;
  /**
   * Volume for the current Last price with greater accuracy
   */
  double volume_real;
};

/**
 * Ticks with Bid and/or Ask changes
 */
uint COPY_TICKS_INFO;

/**
 * Ticks with changes in Last and Volume
 */
uint COPY_TICKS_TRADE;

/**
 * All ticks
 */
uint COPY_TICKS_ALL;
