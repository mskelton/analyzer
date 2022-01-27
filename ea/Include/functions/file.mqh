#include "Include/enums/file.mqh"
#include "Include/types/data_types.mqh"
#include "Include/types/file.mqh"

/**
 * Create a file or folder opening/creation dialog.
 *
 * @param caption Dialog window header.
 * @param initial_dir Initial directory name relative to MQL5\\Files, the
 * contents of which is to be displayed in the dialog box. If the value is NULL,
 * MQL5\\Files is displayed in the dialog.
 * @param filter Extension filter of the files to be displayed in the selection
 * dialog window. Files of other formats are hidden.
 * @param flags Combination of flags defining the dialog window mode.
 * @param filenames Array of strings the names of selected files/folders are
 * placed to.
 * @param default_filename Default file/folder name. If specified, a name is
 * automatically added to the open dialog and returned in the filenames[] array
 * when testing.
 * @returns In case of a successful completion, the function returns the number
 * of selected files whose names can be obtained in filenames[]. If a user
 * closes the dialog without selecting a file, the function returns 0. In case
 * of unsuccessful execution, a value less than 0 is returned. The error code
 * can be obtained using GetLastError().
 */
int FileSelectDialog(string caption,
                     string initial_dir,
                     string filter,
                     uint flags,
                     string filenames[],
                     string default_filename);

/**
 * The function starts the search of files or subdirectories in a directory in
 * accordance with the specified filter.
 *
 * @param file_filter Search filter. A subdirectory (or sequence of nested
 * subdirectories) relative to the \\Files directory, in which files should be
 * searched for, can be specified in the filter.
 * @param returned_filename The returned parameter, where, in case of success,
 * the name of the first found file or subdirectory is placed. Only the file
 * name is returned (including the extension), the directories and
 * subdirectories are not included no matter if they are specified or not in the
 * search filter.
 * @param common_flag Flag determining the location of the file. If common_flag
 * = FILE_COMMON, then the file is located in a shared folder for all client
 * terminals \\Terminal\\Common\\Files. Otherwise, the file is located in a
 * local folder.
 * @returns Returns handle of the object searched, which should be used for
 * further sorting of files and subdirectories by the FileFindNext() function,
 * or INVALID_HANDLE when there is no file and subdirectory corresponding to the
 * filter (in the particular case - when the directory is empty). After
 * searching, the handle must be closed using the FileFindClose() function.
 */
long FileFindFirst(const string file_filter,
                   string& returned_filename,
                   int common_flag = 0);

/**
 * The function continues the search started by FileFindFirst().
 *
 * @param search_handle Search handle, retrieved by FileFindFirst().
 * @param returned_filename The name of the next file or subdirectory found.
 * Only the file name is returned (including the extension), the directories and
 * subdirectories are not included no matter if they are specified or not in the
 * search filter.
 * @returns If successful returns true, otherwise false.
 */
bool FileFindNext(long search_handle, string& returned_filename);

/**
 * The function closes the search handle.
 *
 * @param search_handle Search handle, retrieved by FileFindFirst().
 * @returns No value returned.
 */
void FileFindClose(long search_handle);

/**
 * Checks the existence of a file.
 *
 * @param file_name The name of the file being checked
 * @param common_flag Flag determining the location of the file. If common_flag
 * = FILE_COMMON, then the file is located in a shared folder for all client
 * terminals \\Terminal\\Common\\Files. Otherwise, the file is located in a
 * local folder.
 * @returns Returns true, if the specified file exists.
 */
bool FileIsExist(const string file_name, int common_flag = 0);

/**
 * The function opens the file with the specified name and flag.
 *
 * @param file_name The name of the file can contain subfolders. If the file is
 * opened for writing, these subfolders will be created if there are no such
 * ones.
 * @param open_flags combination of flags determining the operation mode for the
 * file.
 * @param delimiter value to be used as a separator in txt or csv-file. If the
 * csv-file delimiter is not specified, it defaults to a tab. If the txt-file
 * delimiter is not specified, then no separator is used. If the separator is
 * clearly set to 0, then no separator is used.
 * @param codepage The value of the code page. For the most-used code pages
 * provide appropriate constants.
 * @returns If a file has been opened successfully, the function returns the
 * file handle, which is then used to access the file data. In case of failure
 * returns INVALID_HANDLE.
 */
int FileOpen(string file_name,
             int open_flags,
             short delimiter = '\t',
             uint codepage = CP_ACP);

/**
 * Close the file previously opened by FileOpen().
 *
 * @param file_handle File descriptor returned by FileOpen().
 */
void FileClose(int file_handle);

/**
 * The function copies the original file from a local or shared folder to
 * another file.
 *
 * @param src_file_name File name to copy.
 * @param common_flag Flag determining the location of the file. If common_flag
 * = FILE_COMMON, then the file is located in a shared folder for all client
 * terminals \\Terminal\\Common\\Files. Otherwise, the file is located in a
 * local folder (for example, common_flag=0).
 * @param dst_file_name Result file name.
 * @param mode_flags Access flags. The parameter can contain only 2 flags:
 * FILE_REWRITE and/or FILE_COMMON - other flags are ignored. If the file
 * already exists, and the FILE_REWRITE flag hasn't been specified, then the
 * file will not be rewritten, and the function will return false.
 * @returns In case of failure the function returns false.
 */
bool FileCopy(const string src_file_name,
              int common_flag,
              const string dst_file_name,
              int mode_flags);

/**
 * Deletes the specified file in a local folder of the client terminal.
 *
 * @param file_name File name.
 * @param common_flag Flag determining the file location. If common_flag =
 * FILE_COMMON, then the file is located in a shared folder for all client
 * terminals \\Terminal\\Common\\Files. Otherwise, the file is located in a
 * local folder.
 * @returns In case of failure the function returns false.
 */
bool FileDelete(const string file_name, int common_flag = 0);

/**
 * Moves a file from a local or shared folder to another folder.
 *
 * @param src_file_name File name to move/rename.
 * @param common_flag Flag determining the location of the file. If common_flag
 * = FILE_COMMON, then the file is located in a shared folder for all client
 * terminals \\Terminal\\Common\\Files. Otherwise, the file is located in a
 * local folder (common_flag=0).
 * @param dst_file_name File name after operation
 * @param mode_flags Access flags. The parameter can contain only 2 flags:
 * FILE_REWRITE and/or FILE_COMMON - other flags are ignored. If the file
 * already exists and the FILE_REWRITE flag isn't specified, the file will not
 * be rewritten, and the function will return false.
 * @returns In case of failure the function returns false.
 */
bool FileMove(const string src_file_name,
              int common_flag,
              const string dst_file_name,
              int mode_flags);

/**
 * Writes to a disk all data remaining in the input/output file buffer.
 *
 * @param file_handle File descriptor returned by FileOpen().
 */
void FileFlush(int file_handle);

/**
 * Gets an integer property of a file. There are two variants of the function.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param file_name File name.
 * @param property_id File property ID. The value can be one of the values of
 * the ENUM_FILE_PROPERTY_INTEGER enumeration. If the second variant of the
 * function is used, you can receive only the values of the following
 * properties: FILE_EXISTS, FILE_CREATE_DATE, FILE_MODIFY_DATE, FILE_ACCESS_DATE
 * and FILE_SIZE.
 * @param common_folder Points to the file location. If the parameter is false,
 * terminal data folder is viewed. Otherwise it is assumed that the file is in
 * the shared folder of all terminals \\Terminal\\Common\\Files (FILE_COMMON).
 * @returns The value of the property. In case of an error, -1 is returned. To
 * get an error code use the GetLastError() function.
 */
long FileGetInteger(int file_handle, ENUM_FILE_PROPERTY_INTEGER property_id);
long FileGetInteger(const string file_name,
                    ENUM_FILE_PROPERTY_INTEGER property_id,
                    bool common_folder = false);

/**
 * Defines the end of a file in the process of reading.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The function returns true if the file end has been reached in the
 * process of reading or moving of the file pointer.
 */
bool FileIsEnding(int file_handle);

/**
 * Defines the line end in a text file in the process of reading.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns Returns true if in the process of reading txt or csv-file reached
 * the end of the line (the characters CR-LF).
 */
bool FileIsLineEnding(int file_handle);

/**
 * Reads from a file of BIN type arrays of any type except string (may be an
 * array of structures, not containing strings, and dynamic arrays).
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param array An array where the data will be loaded.
 * @param start Start position to read from the array.
 * @param count Number of elements to read. By default, reads the entire array
 * (count=WHOLE_ARRAY).
 * @returns Number of elements read.
 */
template <typename T>
uint FileReadArray(int file_handle,
                   T array[],
                   int start = 0,
                   int count = WHOLE_ARRAY);

/**
 * Reads from the file of CSV type string from the current position to a
 * delimiter (or till the end of the text line) and converts the read string to
 * a bool type value.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns Line read may be set to "true", "false" or the symbolic
 * representation of integers "0" or "1". A nonzero value is converted to a
 * logical true. The function returns the converted value.
 */
bool FileReadBool(int file_handle);

/**
 * Reads from the file of CSV type a string of one of the formats: "YYYY.MM.DD
 * HH:MI:SS", "YYYY.MM.DD" or "HH:MI:SS" - and converts it into a value of
 * datetime type.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The value of datetime type.
 */
datetime FileReadDatetime(int file_handle);

/**
 * Reads from the file of CSV type a string of one of the formats: "YYYY.MM.DD
 * HH:MI:SS", "YYYY.MM.DD" or "HH:MI:SS" - and converts it into a value of
 * datetime type.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The value of datetime type.
 */
datetime FileReadDatetime(int file_handle);

/**
 * Reads from the file of CSV type a string of one of the formats: "YYYY.MM.DD
 * HH:MI:SS", "YYYY.MM.DD" or "HH:MI:SS" - and converts it into a value of
 * datetime type.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The value of datetime type.
 */
datetime FileReadDatetime(int file_handle);

/**
 * The function reads int, short or char value from the current position of the
 * file pointer depending on the length specified in bytes.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param size Number of bytes (up to 4 inclusive) that should be read. The
 * corresponding constants are provided: CHAR_VALUE = 1, SHORT_VALUE = 2 and
 * INT_VALUE = 4, so the function can read the whole value of char, short or int
 * type.
 * @returns A value of the int type. The result of this function must be
 * explicitly cast to a target type, i.e. to the type of data that you need to
 * read. Since a value of the int type is returned, it can be easily converted
 * to any integer value. The file pointer is shifted by the number of bytes
 * read.
 */
int FileReadInteger(int file_handle, int size = INT_VALUE);

/**
 * The function reads an integer of long type (8 bytes) from the current
 * position of the binary file.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The value of long type.
 */
long FileReadLong(int file_handle);

/**
 * The function reads from the CSV file a string from the current position till
 * a separator (or till the end of a text string) and converts the read string
 * to a value of double type.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The value of double type.
 */
double FileReadNumber(int file_handle);

/**
 * The function reads a string from the current position of a file pointer in a
 * file.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param length Number of characters to read.
 * @returns Line read (string).
 */
string FileReadString(int file_handle, int length = -1);

/**
 * The function reads contents into a structure passed as a parameter from a
 * binary-file, starting with the current position of the file pointer.
 *
 * @param file_handle File descriptor of an open bin-file.
 * @param struct_object The object of this structure. The structure should not
 * contain strings, dynamic arrays or virtual functions.
 * @param size Number of bytes that should be read. If size is not specified or
 * the indicated value is greater than the size of the structure, the exact size
 * of the specified structure is used.
 * @returns If successful the function returns the number of bytes read. File
 * pointer is moved by the same number of bytes.
 */
template <typename T>
uint FileReadStruct(int file_handle, const T struct_object, int size = -1);

/**
 * The function moves the position of the file pointer by a specified number of
 * bytes relative to the specified position.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param offset The shift in bytes (may take a negative value).
 * @param origin The starting point for the displacement. Can be one of values
 * of ENUM_FILE_POSITION.
 * @returns If successful the function returns true, otherwise false. To obtain
 * information about the error call the GetLastError() function.
 */
bool FileSeek(int file_handle, long offset, ENUM_FILE_POSITION origin);

/**
 * The function returns the file size in bytes.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns The value of type int.
 */
ulong FileSize(int file_handle);

/**
 * The file returns the current position of the file pointer of an open file.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @returns Current position of the file descriptor in bytes from the beginning
 * of the file.
 */
ulong FileTell(int file_handle);

/**
 * The function is intended for writing of data into a CSV file, delimiter being
 * inserted automatically unless it is equal to 0. After writing into the file,
 * the line end character "\r\n" will be added.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param ... The list of parameters separated by commas, to write to the file.
 * The number of written parameters can be up to 63.
 * @returns Number of bytes written.
 */
uint FileWrite(int file_handle, ...);

/**
 * The function writes arrays of any type except for string to a BIN file (can
 * be an array of structures not containing strings or dynamic arrays).
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param array Array for recording.
 * @param start Initial index in the array (number of the first recorded
 * element).
 * @param count Number of items to write (WHOLE_ARRAY means that all items
 * starting with the number start until the end of the array will be written).
 * @returns Number of recorded items.
 */
template <typename T>
uint FileWriteArray(int file_handle,
                    const T array[],
                    int start = 0,
                    int count = WHOLE_ARRAY);

/**
 * The function writes the value of a double parameter to a a bin-file, starting
 * from the current position of the file pointer.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param value The value of double type.
 * @returns If successful the function returns the number of bytes written (in
 * this case sizeof(double)=8). The file pointer is shifted by the same number
 * of bytes.
 */
uint FileWriteDouble(int file_handle, double value);

/**
 * The function writes the value of the float parameter to a bin-file, starting
 * from the current position of the file pointer.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param value The value of float type.
 * @returns If successful the function returns the number of bytes written (in
 * this case sizeof(float)=4). The file pointer is shifted by the same number of
 * bytes.
 */
uint FileWriteFloat(int file_handle, float value);

/**
 * The function writes the value of the int parameter to a bin-file, starting
 * from the current position of the file pointer.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param value Integer value.
 * @param size Number of bytes (up to 4 inclusive), that should be written. The
 * corresponding constants are provided: CHAR_VALUE=1, SHORT_VALUE=2 and
 * INT_VALUE=4, so the function can write the integer value of char, uchar,
 * short, ushort, int, or uint type.
 * @returns If successful the function returns the number of bytes written. The
 * file pointer is shifted by the same number of bytes.
 */
uint FileWriteInteger(int file_handle, int value, int size = INT_VALUE);

/**
 * The function writes the value of the long-type parameter to a bin-file,
 * starting from the current position of the file pointer.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param value Value of type long.
 * @returns If successful the function returns the number of bytes written (in
 * this case sizeof(long)=8). The file pointer is shifted by the same number of
 * bytes.
 */
uint FileWriteLong(int file_handle, long value);

/**
 * The function writes the value of a string-type parameter into a BIN, CSV or
 * TXT file starting from the current position of the file pointer. When writing
 * to a CSV or TXT file: if there is a symbol in the string '\n' (LF) without
 * previous character '\r' (CR), then before '\n' the missing '\r' is added.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param text_string String.
 * @param length The number of characters that you want to write. This option is
 * needed for writing a string into a BIN file. If the size is not specified,
 * then the entire string without the trailer 0 is written. If you specify a
 * size smaller than the length of the string, then a part of the string without
 * the trailer 0 is written. If you specify a size greater than the length of
 * the string, the string is filled by the appropriate number of zeros. For
 * files of CSV and TXT type, this parameter is ignored and the string is
 * written entirely.
 * @returns If successful the function returns the number of bytes written. The
 * file pointer is shifted by the same number of bytes.
 */
uint FileWriteString(int file_handle,
                     const string text_string,
                     int length = -1);

/**
 * The function writes into a bin-file contents of a structure passed as a
 * parameter, starting from the current position of the file pointer.
 *
 * @param file_handle File descriptor returned by FileOpen().
 * @param struct_object Reference to the object of this structure. The structure
 * should not contain strings, dynamic arrays or virtual functions.
 * @param size Number of bytes that you want to record. If size is not specified
 * or the specified number of bytes is greater than the size of the structure,
 * the entire structure is written.
 * @returns If successful the function returns the number of bytes written. The
 * file pointer is shifted by the same number of bytes.
 */
template <typename T>
uint FileWriteStruct(int file_handle, const T struct_object, int size = -1);

/**
 * Reads all data of a specified binary file into a passed array of numeric
 * types or simple structures. The function allows you to quickly read data of a
 * known type into the appropriate array.
 *
 * @param file_name The name of the file from which data will be read.
 * @param buffer An array of numeric types or simple structures.
 * @param common_flag A file flag indicating the operation mode. If the
 * parameter is not specified, the file is searched in the subfolder MQL5\\Files
 * (or in <testing_agent_directory>\\MQL5\\Files in case of testing).
 * @returns The number of elements read or -1 in case of an error.
 */
template <typename T>
long FileLoad(const string file_name, T buffer[], int common_flag = 0);

/**
 * Writes to a binary file all elements of an array passed as a parameter. The
 * function allows you to quickly write arrays of numeric types or simple
 * structures as one string.
 *
 * @param file_name The name of the file, to the data array will be written.
 * @param buffer An array of numeric types or simple structures.
 * @param common_flag A file flag indicating the operation mode. If the
 * parameter is not specified, the file will be written to the subfolder
 * MQL5\\Files (or to <testing_agent_directory>\\MQL5\\Files in case of
 * testing).
 * @returns In case of failure returns false.
 */
template <typename T>
bool FileSave(const string file_name, T buffer[], int common_flag = 0);

/**
 * Creates a directory in the Files folder (depending on the common_flag value)
 *
 * @param folder_name Name of the directory to be created. Contains the relative
 * path to the folder.
 * @param common_flag Flag defining the directory location. If
 * common_flag=FILE_COMMON, the directory is located in the common folder of all
 * client terminals \\Terminal\\Common\\Files. Otherwise, the directory is in
 * the local folder (MQL5\\Files or MQL5\\Tester\\Files when testing).
 * @returns Returns true if successful, otherwise false.
 */
bool FolderCreate(string folder_name, int common_flag = 0);

/**
 * The function removes the specified directory. If the folder is not empty,
 * then it can't be removed.
 *
 * @param folder_name The name of the directory you want to delete. Contains the
 * full path to the folder.
 * @param common_flag Flag determining the location of the directory. If
 * common_flag=FILE_COMMON, then the directory is in the shared folder for all
 * client terminals \\Terminal\\Common\\Files. Otherwise, the directory is in a
 * local folder (MQL5\\Files or MQL5\\Tester\\Files in the case of testing).
 * @returns Returns true if successful, otherwise false.
 */
bool FolderDelete(string folder_name, int common_flag = 0);

/**
 * The function deletes all files in a specified folder.
 *
 * @param folder_name The name of the directory where you want to delete all
 * files. Contains the full path to the folder.
 * @param common_flag Flag determining the location of the directory. If
 * common_flag = FILE_COMMON, then the directory is in the shared folder for all
 * client terminals \\Terminal\\Common\\Files. Otherwise, the directory is in a
 * local folder(MQL5\\Files or MQL5\\Tester\\Files in case of testing).
 * @returns Returns true if successful, otherwise false.
 */
bool FolderClean(string folder_name, int common_flag = 0);
