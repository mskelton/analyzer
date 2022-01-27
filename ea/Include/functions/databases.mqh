#include "Include/types/data_types.mqh"

/**
 * Opens or creates a database in a specified file.
 *
 * @param filename File name relative to the "MQL5\\Files" folder.
 * @param flags Combination of flags from the ENUM_DATABASE_OPEN_FLAGS
 * enumeration.
 * @returns If executed successfully, the function returns the database handle,
 * which is then used to access the database. Otherwise, it returns
 * INVALID_HANDLE. To get the error code, use GetLastError(), the possible
 * responses are:
 *
 * • ERR_INTERNAL_ERROR (4001) - critical runtime error;
 * • ERR_WRONG_INTERNAL_PARAMETER (4002)  - internal error, while accessing the
 * "MQL5\Files" folder;
 * • ERR_INVALID_PARAMETER (4003) - path to the database file contains an empty
 * string, or an incompatible combination of flags is set;
 * • ERR_NOT_ENOUGH_MEMORY (4004) - insufficient memory;
 * • ERR_WRONG_FILENAME (5002) - wrong database file name;
 * • ERR_DATABASE_TOO_MANY_OBJECTS (5122) - exceeded the maximum acceptable
 * number of Database objects;
 * • ERR_DATABASE_CONNECT (5123) - database connection error;
 * • ERR_DATABASE_MISUSE (5621) - incorrect use of the SQLite library.
 */
int DatabaseOpen(string filename, uint flags);

/**
 * Closes a database.
 *
 * @param database Database handle received in DatabaseOpen().
 */
void DatabaseClose(int database);

/**
 * Imports data from a file into a table.
 *
 * @param database Database handle received in DatabaseOpen().
 * @param table Name of a table the data from a file is to be added to.
 * @param filename CSV file or ZIP archive for reading data. The name may
 * contain subdirectories and is set relative to the MQL5\\Files folder.
 * @param flags Combination of flags.
 * @param separator Data separator in CSV file.
 * @param skip_rows Number of initial strings to be skipped when reading data
 * from the file.
 * @param skip_comments String of characters for designating strings as
 * comments. If any character from skip_comments is detected at the beginning of
 * a string, such a string is considered a comment and is not imported.
 * @returns Return the number of imported strings or -1 in case of an error. To
 * get the error code, use GetLastError(), the possible responses are:
 *
 * ERR_INVALID_PARAMETER (4003) - no table name specified (empty string or
 * NULL);
 * ERR_DATABASE_INTERNAL (5120) - internal database error;
 * ERR_DATABASE_INVALID_HANDLE (5121) - invalid database handle.
 */
long DatabaseImport(int database,
                    const string table,
                    const string filename,
                    uint flags,
                    const string separator,
                    ulong skip_rows,
                    const string skip_comments);

/**
 * Exports a table or an SQL request execution result to a CSV file. The file is
 * created in the UTF-8 encoding.
 *
 * @param database Database handle received in DatabaseOpen().
 * @param table_or_sql A name of a table or a text of an SQL request whose
 * results are to be exported to a specified file.
 * @param filename A file name for data export. The path is set relative to the
 * MQL5\\Files folder.
 * @param flags Combination of flags defining the output to a file.
 * @param separator Data separator. If NULL is specified, the '\\t' tabulation
 * character is used as a separator. An empty string "" is considered a valid
 * separator but the obtained CSV file cannot be read as a table – it is
 * considered as a set of strings.
 * @returns Return the number of exported entries or a negative value in case of
 * an error. To get the error code, use GetLastError(), the possible responses
 * are:
 *
 * ERR_INTERNAL_ERROR (4001) - critical runtime error;
 * ERR_INVALID_PARAMETER (4003) - path to the database file contains an empty
 * string, or an incompatible combination of flags is set;
 * ERR_NOT_ENOUGH_MEMORY (4004) - insufficient memory;
 * ERR_FUNCTION_NOT_ALLOWED(4014) - specified pipe is not allowed;
 * ERR_PROGRAM_STOPPED(4022) - operation canceled (MQL program stopped);
 * ERR_WRONG_FILENAME (5002) - invalid file name;
 * ERR_TOO_LONG_FILENAME (5003) - absolute path to the file exceeds the maximum
 * length;
 * ERR_CANNOT_OPEN_FILE(5004) - unable to open the file for writing;
 * ERR_FILE_WRITEERROR(5026) - unable to write to the file;
 * ERR_DATABASE_INTERNAL (5120) - internal database error;
 * ERR_DATABASE_INVALID_HANDLE (5121) - invalid database handle;
 * ERR_DATABASE_QUERY_PREPARE(5125) - request generation error;
 * ERR_DATABASE_QUERY_NOT_READONLY - read-only request is allowed.
 */
long DatabaseExport(int database,
                    const string table_or_sql,
                    const string filename,
                    uint flags,
                    const string separator);

/**
 * Prints a table or an SQL request execution result in the Experts journal.
 *
 * @param database Database handle received in DatabaseOpen().
 * @param table_or_sql A name of a table or a text of an SQL request whose
 * results are displayed in the Experts journal.
 * @param flags Combination of flags defining the output formatting. If flags=0,
 * the columns and the strings are displayed, the header and the data are
 * separated by the frame, while the strings are aligned to the left.
 * @returns Return the number of exported strings or -1 in case of an error. To
 * get the error code, use GetLastError(), the possible responses are:
 *
 * ERR_INTERNAL_ERROR (4001) - critical runtime error;
 * ERR_NOT_ENOUGH_MEMORY (4004) - insufficient memory;
 * ERR_DATABASE_INTERNAL (5120) - internal database error;
 * ERR_DATABASE_INVALID_HANDLE (5121) - invalid database handle;
 */
long DatabasePrint(int database, const string table_or_sql, uint flags);

/**
 * Checks the presence of the table in a database.
 *
 * @param database Database handle received in DatabaseOpen().
 * @param table Table name.
 * @returns Return true if successful, otherwise false. To get the error code,
 * use GetLastError(), the possible responses are:
 *
 * ERR_INVALID_PARAMETER (4003) - no table name specified (empty string or NULL)
 * ERR_WRONG_STRING_PARAMETER (5040) - error converting a request into a UTF-8
 * string;
 * ERR_DATABASE_INTERNAL (5120) - internal database error;
 * ERR_DATABASE_INVALID_HANDLE (5121) - invalid database handle;
 * ERR_DATABASE_EXECUTE (5124) - request execution error;
 * ERR_DATABASE_NO_MORE_DATA (5126) - no table exists (not an error, normal
 * completion).
 */
bool DatabaseTableExists(int database, string table);
