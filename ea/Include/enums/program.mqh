typedef enum ENUM_MQL_INFO_INTEGER {
  /**
   * Maximum possible amount of dynamic memory for MQL5 program in MB
   */
  MQL_MEMORY_LIMIT,
  /**
   * Memory used by MQL5 program in MB
   */
  MQL_MEMORY_USED,
  /**
   * Type of the MQL5 program
   */
  MQL_PROGRAM_TYPE,
  /**
   * The permission to use DLL for the given running program
   */
  MQL_DLLS_ALLOWED,
  /**
   * The permission to trade for the given running program
   */
  MQL_TRADE_ALLOWED,
  /**
   * The permission to modify the Signals for the given running program
   */
  MQL_SIGNALS_ALLOWED,
  /**
   * Indication that the program is running in the debugging mode
   */
  MQL_DEBUG,
  /**
   * Indication that the program is running in the code profiling mode
   */
  MQL_PROFILER,
  /**
   * Indication that the program is running in the tester
   */
  MQL_TESTER,
  /**
   * Indication that the program is running in the forward testing process
   */
  MQL_FORWARD,
  /**
   * Indication that the program is running in the optimization mode
   */
  MQL_OPTIMIZATION,
  /**
   * Indication that the program is running in the visual testing mode
   */
  MQL_VISUAL_MODE,
  /**
   * Indication that the Expert Advisor is running in gathering optimization
   * result frames mode
   */
  MQL_FRAME_MODE,
  /**
   * Type of license of the EX5 module. The license refers to the EX5 module,
   * from which a request is made using MQLInfoInteger(MQL_LICENSE_TYPE).
   */
  MQL_LICENSE_TYPE,
} ENUM_MQL_INFO_INTEGER;

typedef enum ENUM_MQL_INFO_STRING {
  /**
   * Name of the running mql5-program
   */
  MQL_PROGRAM_NAME,
  /**
   * Path for the given running program
   */
  MQL5_PROGRAM_PATH,
} ENUM_MQL_INFO_STRING;

typedef enum ENUM_PROGRAM_TYPE {
  PROGRAM_SCRIPT,
  PROGRAM_EXPERT,
  PROGRAM_INDICATOR,
} ENUM_PROGRAM_TYPE;

typedef enum ENUM_LICENSE_TYPE {
  /**
   * A free unlimited version
   */
  LICENSE_FREE,
  /**
   * A trial version of a paid product from the Market. It works only in the
   * strategy tester
   */
  LICENSE_DEMO,
  /**
   * A purchased licensed version allows at least 5 activations. The number of
   * activations is specified by seller. Seller may increase the allowed number
   * of activations
   */
  LICENSE_FULL,
  /**
   * A version with a limited term license
   */
  LICENSE_TIME,
} ENUM_LICENSE_TYPE;
