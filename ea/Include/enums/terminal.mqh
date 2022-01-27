typedef enum ENUM_TERMINAL_INFO_INTEGER {
  /**
   * The client terminal build number
   */
  TERMINAL_BUILD,
  /**
   * The flag indicates the presence of MQL5.community authorization data in the
   * terminal
   */
  TERMINAL_COMMUNITY_ACCOUNT,
  /**
   * Connection to MQL5.community
   */
  TERMINAL_COMMUNITY_CONNECTION,
  /**
   * Connection to a trade server
   */
  TERMINAL_CONNECTED,
  /**
   * Permission to use DLL
   */
  TERMINAL_DLLS_ALLOWED,
  /**
   * Permission to trade
   */
  TERMINAL_TRADE_ALLOWED,
  /**
   * Permission to send e-mails using SMTP-server and login, specified in the
   * terminal settings
   */
  TERMINAL_EMAIL_ENABLED,
  /**
   * Permission to send reports using FTP-server and login, specified in the
   * terminal settings
   */
  TERMINAL_FTP_ENABLED,
  /**
   * Permission to send notifications to smartphone
   */
  TERMINAL_NOTIFICATIONS_ENABLED,
  /**
   * The maximal bars count on the chart
   */
  TERMINAL_MAXBARS,
  /**
   * The flag indicates the presence of MetaQuotes ID data for Push
   * notifications
   */
  TERMINAL_MQID,
  /**
   * Number of the code page of the language installed in the client terminal
   */
  TERMINAL_CODEPAGE,
  /**
   * The number of CPU cores in the system
   */
  TERMINAL_CPU_CORES,
  /**
   * Free disk space for the MQL5\Files folder of the terminal (agent), MB
   */
  TERMINAL_DISK_SPACE,
  /**
   * Physical memory in the system, MB
   */
  TERMINAL_MEMORY_PHYSICAL,
  /**
   * Memory available to the process of the terminal (agent), MB
   */
  TERMINAL_MEMORY_TOTAL,
  /**
   * Free memory of the terminal (agent) process, MB
   */
  TERMINAL_MEMORY_AVAILABLE,
  /**
   * Memory used by the terminal (agent), MB
   */
  TERMINAL_MEMORY_USED,
  /**
   * Indication of the "64-bit terminal"
   */
  TERMINAL_X64,
  /**
   * The version of the supported OpenCL in the format of 0x00010002 = 1.2.  "0"
   * means that OpenCL is not supported
   */
  TERMINAL_OPENCL_SUPPORT,
  /**
   * The resolution of information display on the screen is measured as number
   * of Dots in a line per Inch (DPI).
   */
  TERMINAL_SCREEN_DPI,
  /**
   * Knowing the parameter value, you can set the size of graphical objects so
   * that they look the same on monitors with different resolution
   * characteristics.
   */
  TERMINAL_SCREEN_LEFT,
  /**
   * The left coordinate of the virtual screen. A virtual screen is a rectangle
   * that covers all monitors. If the system has two monitors ordered from right
   * to left, then the left coordinate of the virtual screen can be on the
   * border of two monitors.
   */
  TERMINAL_SCREEN_TOP,
  /**
   * The top coordinate of the virtual screen
   */
  TERMINAL_SCREEN_WIDTH,
  /**
   * Terminal width
   */
  TERMINAL_SCREEN_HEIGHT,
  /**
   * Terminal height
   */
  TERMINAL_LEFT,
  /**
   * The left coordinate of the terminal relative to the virtual screen
   */
  TERMINAL_TOP,
  /**
   * The top coordinate of the terminal relative to the virtual screen
   */
  TERMINAL_RIGHT,
  /**
   * The right coordinate of the terminal relative to the virtual screen
   */
  TERMINAL_BOTTOM,
  /**
   * The bottom coordinate of the terminal relative to the virtual screen
   */
  TERMINAL_PING_LAST,
  /**
   * The last known value of a ping to a trade server in microseconds. One
   * second comprises of one million microseconds
   */
  TERMINAL_VPS,
  /**
   * Indication that the terminal is launched on the MetaTrader Virtual Hosting
   * server (MetaTrader VPS)
   */
  TERMINAL_KEYSTATE_LEFT,
  /**
   * State of the "Left arrow" key
   */
  TERMINAL_KEYSTATE_UP,
  /**
   * State of the "Up arrow" key
   */
  TERMINAL_KEYSTATE_RIGHT,
  /**
   * State of the "Right arrow" key
   */
  TERMINAL_KEYSTATE_DOWN,
  /**
   * State of the "Down arrow" key
   */
  TERMINAL_KEYSTATE_SHIFT,
  /**
   * State of the "Shift" key
   */
  TERMINAL_KEYSTATE_CONTROL,
  /**
   * State of the "Ctrl" key
   */
  TERMINAL_KEYSTATE_MENU,
  /**
   * State of the "Windows" key
   */
  TERMINAL_KEYSTATE_CAPSLOCK,
  /**
   * State of the "CapsLock" key
   */
  TERMINAL_KEYSTATE_NUMLOCK,
  /**
   * State of the "NumLock" key
   */
  TERMINAL_KEYSTATE_SCRLOCK,
  /**
   * State of the "ScrollLock" key
   */
  TERMINAL_KEYSTATE_ENTER,
  /**
   * State of the "Enter" key
   */
  TERMINAL_KEYSTATE_INSERT,
  /**
   * State of the "Insert" key
   */
  TERMINAL_KEYSTATE_DELETE,
  /**
   * State of the "Delete" key
   */
  TERMINAL_KEYSTATE_HOME,
  /**
   * State of the "Home" key
   */
  TERMINAL_KEYSTATE_END,
  /**
   * State of the "End" key
   */
  TERMINAL_KEYSTATE_TAB,
  /**
   * State of the "Tab" key
   */
  TERMINAL_KEYSTATE_PAGEUP,
  /**
   * State of the "PageUp" key
   */
  TERMINAL_KEYSTATE_PAGEDOWN,
  /**
   * State of the "PageDown" key
   */
  TERMINAL_KEYSTATE_ESCAPE,
} ENUM_TERMINAL_INFO_INTEGER;

typedef enum ENUM_TERMINAL_INFO_DOUBLE {
  /**
   * Balance in MQL5.community
   */
  TERMINAL_COMMUNITY_BALANCE,
  /**
   * Percentage of resent network packets in the TCP/IP protocol for all running
   * applications and services on the given computer. Packet loss occurs even in
   * the fastest and correctly configured networks. In this case, there is no
   * confirmation of packet delivery between the recipient and the sender,
   * therefore lost packets are resent.
   */
  TERMINAL_RETRANSMISSION,
} ENUM_TERMINAL_INFO_DOUBLE;

typedef enum ENUM_TERMINAL_INFO_STRING {
  /**
   * Language of the terminal
   */
  TERMINAL_LANGUAGE,
  /**
   * Company name
   */
  TERMINAL_COMPANY,
  /**
   * Terminal name
   */
  TERMINAL_NAME,
  /**
   * Folder from which the terminal is started
   */
  TERMINAL_PATH,
  /**
   * Folder in which terminal data are stored
   */
  TERMINAL_DATA_PATH,
  /**
   * Common path for all of the terminals installed on a computer
   */
  TERMINAL_COMMONDATA_PATH,
} ENUM_TERMINAL_INFO_STRING;
