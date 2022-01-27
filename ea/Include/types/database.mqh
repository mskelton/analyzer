/**
 * Display a string with field names
 */
int DATABASE_EXPORT_HEADER;

/**
 * Display string indices
 */
int DATABASE_EXPORT_INDEX;

/**
 * Do not insert BOM mark at the beginning of the file (BOM is inserted by
 * default)
 */
int DATABASE_EXPORT_NO_BOM;

/**
 * Use CRLF for line break (the default is LF)
 */
int DATABASE_EXPORT_CRLF;

/**
 * Add data to the end of an existing file (by default, the file is
 * overwritten). If the file does not exist, it will be created.
 */
int DATABASE_EXPORT_APPEND;

/**
 * Display string values in double quotes.
 */
int DATABASE_EXPORT_QUOTED_STRINGS;

/**
 * A CSV file is created in the common folder of all client terminals
 * \\Terminal\\Common\\File.
 */
int DATABASE_EXPORT_COMMON_FOLDER;

/**
 * Do not display table column names (field names)
 */
int DATABASE_PRINT_NO_HEADER;

/**
 * Do not display string indices
 */
int DATABASE_PRINT_NO_INDEX;

/**
 * Do not display a frame separating a header and data
 */
int DATABASE_PRINT_NO_FRAME;

/**
 * Align strings to the right.
 */
int DATABASE_PRINT_STRINGS_RIGHT;
