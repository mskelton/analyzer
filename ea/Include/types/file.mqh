/**
 * File open dialog;
 */
int FSD_WRITE_FILE;

/**
 * Allow selection of folders only;
 */
int FSD_SELECT_FOLDER;

/**
 * Allow selection of multiple files;
 */
int FSD_ALLOW_MULTISELECT;

/**
 * Selected files should exist;
 */
int FSD_FILE_MUST_EXIST;

/**
 * File is located in the common folder of all client terminals
 * \\Terminal\\Common\\Files.
 */
int FSD_COMMON_FOLDER;

/**
 * File is opened for reading. Flag is used in FileOpen(). When opening a file
 * specification of FILE_WRITE and/or FILE_READ is required.
 */
int FILE_READ;

/**
 * File is opened for writing. Flag is used in FileOpen(). When opening a file
 * specification of FILE_WRITE and/or FILE_READ is required.
 */
int FILE_WRITE;

/**
 * Binary read/write mode (without string to string conversion). Flag is used in
 * FileOpen().
 */
int FILE_BIN;

/**
 * CSV file (all its elements are converted to strings of the appropriate type,
 * Unicode or ANSI, and separated by separator). Flag is used in FileOpen().
 */
int FILE_CSV;

/**
 * Simple text file (the same as csv file, but without taking into account the
 * separators). Flag is used in FileOpen().
 */
int FILE_TXT;

/**
 * Strings of ANSI type (one byte symbols). Flag is used in FileOpen().
 */
int FILE_ANSI;

/**
 * Strings of UNICODE type (two byte symbols). Flag is used in FileOpen().
 */
int FILE_UNICODE;

/**
 * Shared access for reading from several programs. Flag is used in FileOpen(),
 * but it does not replace the necessity to indicate FILE_WRITE and/or the
 * FILE_READ flag when opening a file.
 */
int FILE_SHARE_READ;

/**
 * Possibility for the file rewrite using functions FileCopy() and FileMove().
 * The file should exist or should be opened for writing, otherwise the file
 * will not be opened.
 */
int FILE_SHARE_WRITE;

/**
 * The file path in the common folder of all client terminals
 * \\Terminal\\Common\\Files. Flag is used in FileOpen(), FileCopy(), FileMove()
 * and in FileIsExist() functions.
 */
int FILE_COMMON;

int CHAR_VALUE = 1;
int SHORT_VALUE = 2;
int INT_VALUE = 4;
