typedef enum ENUM_FILE_PROPERTY_INTEGER {
  /**
   * Check the existence
   */
  FILE_EXISTS,
  /**
   * Date of creation
   */
  FILE_CREATE_DATE,
  /**
   * Date of the last modification
   */
  FILE_MODIFY_DATE,
  /**
   * Date of the last access to the file
   */
  FILE_ACCESS_DATE,
  /**
   * File size in bytes
   */
  FILE_SIZE,
  /**
   * Position of a pointer in the file
   */
  FILE_POSITION,
  /**
   * Get the end of file sign
   */
  FILE_END,
  /**
   * Get the end of line sign
   */
  FILE_LINE_END,
  /**
   * The file is opened in a shared folder of all terminals (see FILE_COMMON)
   */
  FILE_IS_COMMON,
  /**
   * The file is opened as a text file (see FILE_TXT)
   */
  FILE_IS_TEXT,
  /**
   * The file is opened as a binary file (see FILE_BIN)
   */
  FILE_IS_BINARY,
  /**
   * The file is opened as CSV (see FILE_CSV)
   */
  FILE_IS_CSV,
  /**
   * The file is opened as ANSI (see FILE_ANSI)
   */
  FILE_IS_ANSI,
  /**
   * The opened file is readable (see FILE_READ)
   */
  FILE_IS_READABLE,
  /**
   * The opened file is writable (see FILE_WRITE)
   */
  FILE_IS_WRITABLE
} ENUM_FILE_PROPERTY_INTEGER;

#undef SEEK_SET
#undef SEEK_CUR
#undef SEEK_END

typedef enum ENUM_FILE_POSITION {
  /**
   * File beginning
   */
  SEEK_SET,
  /**
   * Current position of a file pointer
   */
  SEEK_CUR,
  /**
   * File end
   */
  SEEK_END
} ENUM_FILE_POSITION;
