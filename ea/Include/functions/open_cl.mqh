#include "Include/enums/open_cl.mqh"
#include "Include/global_variables.mqh"
#include "Include/types/data_types.mqh"

/**
 * Returns the type of an OpenCL handle as a value of the
 * ENUM_OPENCL_HANDLE_TYPE enumeration.
 *
 * @param handle A handle to an OpenCL object: a context, a kernel or an OpenCL
 * program.
 * @returns The type of the OpenCL handle as a value of the
 * ENUM_OPENCL_HANDLE_TYPE enumeration.
 */
ENUM_OPENCL_HANDLE_TYPE CLHandleType(int handle);

/**
 * Returns the value of an integer property for an OpenCL object or device.
 *
 * @param handle A handle to the OpenCL object or number of the OpenCL device.
 * Numbering of OpenCL devices starts with zero.
 * @param prop The type of a requested property from the
 * ENUM_OPENCL_PROPERTY_INTEGER enumeration, the value of which you want to
 * obtain.
 * @returns The value of the property if successful or -1 in case of an error.
 * For information about the error, use the GetLastError() function.
 */
long CLGetInfoInteger(int handle, ENUM_OPENCL_PROPERTY_INTEGER prop);

/**
 * Returns string value of a property for OpenCL object or device.
 *
 * @param handle OpenCL object handle or OpenCL device number. The numbering of
 * OpenCL devices starts with zero.
 * @param prop Type of requested property from ENUM_OPENCL_PROPERTY_STRING
 * enumeration, the value of which should be obtained.
 * @param value String for receiving the property value.
 * @returns true if successful, otherwise false. For information about the
 * error, use the GetLastError() function.
 */
bool CLGetInfoString(int handle,
                     ENUM_OPENCL_PROPERTY_STRING prop,
                     string& value);

/**
 * Creates an OpenCL context and returns its handle.
 *
 * @param device The ordinal number of the OpenCL-device in the system. Instead
 * of a specific number, you can specify one of the following values:
 * @returns A handle to the OpenCL context if successful, otherwise -1. For
 * information about the error, use the GetLastError() function.
 */
int CLContextCreate(int device);

/**
 * Removes an OpenCL context.
 *
 * @param context Handle of the OpenCL context.
 * @returns None. In the case of an internal error the value of _LastError
 * changes. For information about the error, use the GetLastError() function.
 */
void CLContextFree(int context);

/**
 * The function receives device property from OpenCL driver.
 *
 * @param handle OpenCL device index or OpenCL handle created by
 * CLContextCreate() function.
 * @param property_id ID of the OpenCL device property that should be received.
 * The values can be of one of the predetermined ones listed in the table below.
 * @param data The array for receiving data on the requested property.
 * @param size Size of the received data in the array data[].
 * @returns true if successful, otherwise false. For information about the
 * error, use the GetLastError() function.
 */
bool CLGetDeviceInfo(int handle, int property_id, uchar data[], uint& size);

/**
 * Creates an OpenCL program from a source code.
 *
 * @param context Handle of the OpenCL context.
 * @param source String with the source code of the OpenCL program.
 * @param &build_log A string for receiving the OpenCL compiler messages.
 * @returns A handle to an OpenCL object if successful. In case of error -1 is
 * returned. For information about the error, use the GetLastError() function.
 */
int CLProgramCreate(int context, const string source);
int CLProgramCreate(int context, const string source, string& build_log);

/**
 * Removes an OpenCL program.
 *
 * @param program Handle of the OpenCL object.
 * @returns None. In the case of an internal error the value of _LastError
 * changes. For information about the error, use the GetLastError() function.
 */
void CLProgramFree(int program);

/**
 * Creates the OpenCL program kernel and returns its handle.
 *
 * @param program Handle to an object of the OpenCL program.
 * @param kernel_name The name of the kernel function in the appropriate OpenCL
 * program, in which execution begins.
 * @returns A handle to an OpenCL object if successful. In case of error -1 is
 * returned. For information about the error, use the GetLastError() function.
 */
int CLKernelCreate(int program, const string kernel_name);

/**
 * Removes an OpenCL start function.
 *
 * @param kernel_name Handle of the kernel object.
 * @returns None. In the case of an internal error the value of _LastError
 * changes. For information about the error, use the GetLastError() function.
 */
void CLKernelFree(int kernel);

/**
 * Sets a parameter for the OpenCL function.
 *
 * @param kernel Handle to a kernel of the OpenCL program.
 * @param arg_index The number of the function argument, numbering starts with
 * zero.
 * @param arg_value The value of the function argument.
 * @returns Returns true if successful, otherwise returns false. For information
 * about the error, use the GetLastError() function.
 */
template <typename T>
bool CLSetKernelArg(int kernel, uint arg_index, T arg_value);

/**
 * Sets an OpenCL buffer as a parameter of the OpenCL function.
 *
 * @param kernel Handle to a kernel of the OpenCL program.
 * @param arg_index The number of the function argument, numbering starts with
 * zero.
 * @param cl_mem_handle A handle to an OpenCL buffer.
 * @returns Returns true if successful, otherwise returns false. For information
 * about the error, use the GetLastError() function.
 */
bool CLSetKernelArgMem(int kernel, uint arg_index, int cl_mem_handle);

/**
 * Sets the local buffer as an argument of the kernel function.
 *
 * @param kernel Handle to a kernel of the OpenCL program.
 * @param arg_index The number of the function argument, numbering starts with
 * zero.
 * @param local_mem_size Buffer size in bytes.
 * @returns Returns true if successful, otherwise returns false. For information
 * about the error, use the GetLastError() function.
 */
bool CLSetKernelArgMemLocal(int kernel, uint arg_index, ulong local_mem_size);

/**
 * Creates an OpenCL buffer and returns its handle.
 *
 * @param context A handle to context OpenCL.
 * @param size Buffer size in bytes.
 * @param flags Buffer properties that are set using a combination of flags.
 * @returns A handle to an OpenCL buffer if successful. In case of error -1 is
 * returned. For information about the error, use the GetLastError() function.
 */
int CLBufferCreate(int context, uint size, uint flags);

/**
 * Deletes an OpenCL buffer.
 *
 * @param buffer A handle to an OpenCL buffer.
 * @returns None. In the case of an internal error the value of _LastError
 * changes. For information about the error, use the GetLastError() function.
 */
void CLBufferFree(int buffer);

/**
 * Writes into the OpenCL buffer and returns the number of written elements.
 *
 * @param buffer A handle of the OpenCL buffer.
 * @param data An array of values that should be written in the OpenCL buffer.
 * Passed by reference.
 * @param buffer_offset An offset in the OpenCL buffer in bytes, from which
 * writing begins. By default, writing start with the very beginning of the
 * buffer.
 * @param data_offset The index of the first array element, starting from which
 * values from the array are written in the OpenCL buffer. By default, values
 * from the very beginning of the array are taken.
 * @param data_count The number of values that should be written. All the values
 * of the array, by default.
 * @returns The number of written elements. 0 is returned in case of an error.
 * For information about the error, use the GetLastError() function.
 */
template <typename T>
uint CLBufferWrite(int buffer,
                   const T data[],
                   uint buffer_offset = 0,
                   uint data_offset = 0,
                   uint data_count = WHOLE_ARRAY);

/**
 * Reads an OpenCL buffer into an array and returns the number of read elements.
 *
 * @param buffer A handle of the OpenCL buffer.
 * @param data An array for receiving values from the OpenCL buffer. Passed by
 * reference.
 * @param buffer_offset An offset in the OpenCL buffer in bytes, from which
 * reading begins. By default, reading start with the very beginning of the
 * buffer.
 * @param data_offset The index of the first array element for writing the
 * values of the OpenCL buffer. By default, writing of the read values into an
 * array starts from the zero index.
 * @param data_count The number of values that should be read. The whole OpenCL
 * buffer is read by default.
 * @returns The number of read elements. 0 is returned in case of an error. For
 * information about the error, use the GetLastError() function.
 */
template <typename T>
uint CLBufferRead(int buffer,
                  const T data[],
                  uint buffer_offset = 0,
                  uint data_offset = 0,
                  uint data_count = WHOLE_ARRAY);

/**
 * The function runs an OpenCL program. There are 3 versions of the function:
 *
 * @param kernel Handle to the OpenCL kernel.
 * @param work_dim Dimension of the tasks space.
 * @param global_work_offset Initial offset in the tasks space.
 * @param global_work_size The size of a subset of tasks.
 * @param local_work_size The size of the group's local task subset.
 * @returns Returns true if successful, otherwise returns false. For information
 * about the error, use the GetLastError() function.
 */
bool CLExecute(int kernel);
bool CLExecute(int kernel,
               uint work_dim,
               const uint global_work_offset[],
               const uint global_work_size[]);
bool CLExecute(int kernel,
               uint work_dim,
               const uint global_work_offset[],
               const uint global_work_size[],
               const uint local_work_size[]);

/**
 * Returns the OpenCL program execution status.
 *
 * @param kernel Handle to a kernel of the OpenCL program.
 * @returns Returns the OpenCL program status. The value can be one of the
 * following:
 */
int CLExecutionStatus(int kernel);
