#include "Include/constants/array.mqh"
#include "Include/global_variables.mqh"
#include "Include/types/data_types.mqh"

/**
 * Searches for a specified value in a multidimensional numeric array sorted
 * ascending. Search is performed through the elements of the first dimension.
 *
 * @param array Numeric array for search.
 * @param value Value for search.
 * @returns The function returns index of a found element. If the wanted value
 * isn't found, the function returns the index of an element nearest in value.
 */
int ArrayBsearch(const double array[], double value);
int ArrayBsearch(const float array[], float value);
int ArrayBsearch(const long array[], long value);
int ArrayBsearch(const int array[], int value);
int ArrayBsearch(const short array[], short value);
int ArrayBsearch(const char array[], char value);

/**
 * It copies an array into another one.
 *
 * @param dst_array Destination array
 * @param src_array Source array
 * @param dst_start Starting index from the destination array. By default, start
 * index is 0.
 * @param src_start Starting index for the source array. By default, start index
 * is 0.
 * @param count Number of elements that should be copied. By default, the whole
 * array is copied (count=WHOLE_ARRAY).
 * @returns It returns the number of copied elements.
 */
template <typename T>
int ArrayCopy(T dst_array[],
              const T src_array[],
              int dst_start = 0,
              int src_start = 0,
              int count = WHOLE_ARRAY);

/**
 * The function returns the result of comparing two arrays of the same type. It
 * can be used to compare arrays of simple types or custom structures without
 * complex objects, that is the custom structures that do not contain strings,
 * dynamic arrays, classes and other structures with complex objects.
 *
 * @param array1 First array.
 * @param array2 Second array.
 * @param start1 The element's initial index in the first array, from which
 * comparison starts. The default start index - 0.
 * @param start2 The element's initial index in the second array, from which
 * comparison starts. The default start index - 0.
 * @param count Number of elements to be compared. All elements of both arrays
 * participate in comparison by default (count=WHOLE_ARRAY).
 */
template <typename T>
int ArrayCompare(const T array1[],
                 const T array2[],
                 int start1 = 0,
                 int start2 = 0,
                 int count = WHOLE_ARRAY);

/**
 * It frees up a buffer of any dynamic array and sets the size of the zero
 * dimension to 0.
 *
 * @param array Dynamic array.
 */
template <typename T>
void ArrayFree(T array[]);

/**
 * It checks direction of an array index.
 *
 * @param array Checked array.
 * @returns Returns true, if the specified array has the AS_SERIES flag set,
 * i.e. access to the array is performed back to front as in timeseries. A
 * timeseries differs from a usual array in that the indexing of timeseries
 * elements is performed from its end to beginning (from the newest data to
 * old).
 */
template <typename T>
bool ArrayGetAsSeries(const T array[]);

/**
 * The function initializes a numeric array by a preset value.
 *
 * @param array Numeric array that should be initialized.
 * @param value New value that should be set to all array elements.
 * @returns Number of initialized elements.
 */
int ArrayInitialize(char array[], char value);
int ArrayInitialize(short array[], short value);
int ArrayInitialize(int array[], int value);
int ArrayInitialize(long array[], long value);
int ArrayInitialize(float array[], float value);
int ArrayInitialize(double array[], double value);
int ArrayInitialize(bool array[], bool value);
int ArrayInitialize(uint array[], uint value);

/**
 * The function fills an array with the specified value.
 *
 * @param array Array of simple type (char, uchar, short, ushort, int, uint,
 * long, ulong, bool, color, datetime, float, double).
 * @param start Starting index. In such a case, specified AS_SERIES flag is
 * ignored.
 * @param count Number of elements to fill.
 * @param value Value to fill the array with.
 */
template <typename T>
void ArrayFill(T array[], int start, int count, T value);

/**
 * The function checks whether an array is dynamic.
 *
 * @param array Checked array.
 * @returns It returns true if the selected array is dynamic, otherwise it
 * returns false.
 */
template <typename T>
bool ArrayIsDynamic(const T array[]);

/**
 * The function checks whether an array is a timeseries.
 *
 * @param array Checked array.
 * @returns It returns true, if a checked array is an array timeseries,
 * otherwise it returns false. Arrays passed as a parameter to the OnCalculate()
 * function must be checked for the order of accessing the array elements by
 * ArrayGetAsSeries().
 */
template <typename T>
bool ArrayIsSeries(const T array[]);

/**
 * Searches for the largest element in the first dimension of a multidimensional
 * numeric array.
 *
 * @param array A numeric array, in which search is made.
 * @param start Index to start checking with.
 * @param count Number of elements for search. By default, searches in the
 * entire array (count=WHOLE_ARRAY).
 * @returns The function returns an index of a found element taking into account
 * the array serial. In case of failure it returns -1.
 */
template <typename T>
int ArrayMaximum(const T array[], int start = 0, int count = WHOLE_ARRAY);

/**
 * Searches for the lowest element in the first dimension of a multidimensional
 * numeric array.
 *
 * @param array A numeric array, in which search is made.
 * @param start Index to start checking with.
 * @param count Number of elements for search. By default, searches in the
 * entire array (count=WHOLE_ARRAY).
 * @returns The function returns an index of a found element taking into account
 * the array serial. In case of failure it returns -1.
 */
template <typename T>
int ArrayMinimum(const T array[], int start = 0, int count = WHOLE_ARRAY);

/**
 * Prints an array of a simple type or a simple structure into journal.
 *
 * @param array Array of a simple type or a simple structure.
 * @param digits The number of decimal places for real types. The default value
 * is _Digits.
 * @param separator Separator of the structure element field values. The default
 * value NULL means an empty line. A space is used as a separator in that case.
 * @param start The index of the first printed array element. It is printed from
 * the zero index by default.
 * @param count Number of the array elements to be printed. The entire array is
 * displayed by default (count=WHOLE_ARRAY).
 * @param flags Combination of flags setting the output mode. All flags are
 * enabled by default:
 */
template <typename T>
void ArrayPrint(const T array[],
                uint digits = _Digits,
                const string separator = "",
                ulong start = 0,
                ulong count = WHOLE_ARRAY,
                ulong flags = ARRAYPRINT_HEADER | ARRAYPRINT_INDEX |
                              ARRAYPRINT_LIMIT | ARRAYPRINT_ALIGN);

/**
 * The function returns the number of elements in a selected array dimension.
 *
 * @param array Checked array.
 * @param rank_index Index of dimension.
 * @returns Number of elements in a selected array dimension.
 */
template <typename T>
int ArrayRange(const T array[], int rank_index);

/**
 * The function sets a new size for the first dimension
 *
 * @param array Array for changing sizes.
 * @param new_size New size for the first dimension.
 * @param reserve_size Distributed size to get reserve.
 * @returns If executed successfully, it returns count of all elements contained
 * in the array after resizing, otherwise, returns -1, and array is not resized.
 */
template <typename T>
int ArrayResize(T array[], int new_size, int reserve_size = 0);

/**
 * Inserts the specified number of elements from a source array to a receiving
 * one starting from a specified index.
 *
 * @param dst_array Receiving array the elements should be added to.
 * @param src_array Source array the elements are to be added from.
 * @param dst_start Index in the receiving array for inserting elements from the
 * source array.
 * @param src_start Index in the receiving array, starting from which the
 * elements of the source array are taken for insertion.
 * @param count Number of elements to be added from the source array. The
 * WHOLE_ARRAY means all elements from the specified index up to the end of the
 * array.
 * @returns Returns true if successful, otherwise - false. To get information
 * about the error, call the GetLastError() function. Possible errors:
 */
template <typename T>
bool ArrayInsert(T dst_array[],
                 const T src_array[],
                 uint dst_start,
                 uint src_start = 0,
                 uint count = WHOLE_ARRAY);

/**
 * Removes the specified number of elements from the array starting with a
 * specified index.
 *
 * @param array Array.
 * @param start Index, starting from which the array elements are removed.
 * @param count Number of removed elements. The WHOLE_ARRAY value means removing
 * all elements from the specified index up the end of the array.
 * @returns Returns true if successful, otherwise - false. To get information
 * about the error, call the GetLastError() function. Possible errors:
 */
template <typename T>
bool ArrayRemove(T array[], uint start, uint count = WHOLE_ARRAY);

/**
 * Reverses the specified number of elements in the array starting with a
 * specified index.
 *
 * @param array Array.
 * @param start Index the array reversal starts from.
 * @param count Number of reversed elements. If WHOLE_ARRAY, then all array
 * elements are moved in the inversed manner starting with the specified start
 * index up to the end of the array.
 * @returns Returns true if successful, otherwise - false.
 */
template <typename T>
bool ArrayReverse(T array[], uint start = 0, uint count = WHOLE_ARRAY);

/**
 * The function sets the AS_SERIES flag to a selected object of a dynamic array,
 * and elements will be indexed like in timeseries.
 *
 * @param array Numeric array to set.
 * @param flag Array indexing direction.
 * @returns The function returns true on success, otherwise - false.
 */
template <typename T>
bool ArraySetAsSeries(const T array[], bool flag);

/**
 * The function returns the number of elements of a selected array.
 *
 * @param array Array of any type.
 * @returns Value of int type.
 */
template <typename T>
int ArraySize(const T array[]);

/**
 * Sorts the values in the first dimension of a multidimensional numeric array
 * in the ascending order.
 *
 * @param array Numeric array for sorting.
 * @returns The function returns true on success, otherwise - false.
 */
template <typename T>
bool ArraySort(T array[]);

/**
 * Swaps the contents of two dynamic arrays of the same type. For
 * multidimensional arrays, the number of elements in all dimensions except the
 * first one should match.
 *
 * @param array1 Array of numerical type.
 * @param array2 Array of numerical type.
 * @returns Returns true if successful, otherwise false. In this case,
 * GetLastError() returns the ERR_INVALID_ARRAY error code.
 */
template <typename T>
bool ArraySwap(T array1[], T array2[]);
