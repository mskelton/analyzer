typedef enum ENUM_DATABASE_OPEN_FLAGS {
  /**
   * Read only
   */
  DATABASE_OPEN_READONLY,
  /**
   * Open for reading and writing
   */
  DATABASE_OPEN_READWRITE,
  /**
   * Create the file on a disk if necessary
   */
  DATABASE_OPEN_CREATE,
  /**
   * Create a database in RAM
   */
  DATABASE_OPEN_MEMORY,
  /**
   * The file is in the common folder of all terminals
   */
  DATABASE_OPEN_COMMON
} ENUM_DATABASE_OPEN_FLAGS;
