typedef enum ENUM_OPENCL_HANDLE_TYPE {
  /**
   * Incorrect handle
   */
  OPENCL_INVALID,
  /**
   * A handle of the OpenCL context
   */
  OPENCL_CONTEXT,
  /**
   * A handle of the OpenCL program
   */
  OPENCL_PROGRAM,
  /**
   * A handle of the OpenCL kernel
   */
  OPENCL_KERNEL,
  /**
   * A handle of the OpenCL buffer
   */
  OPENCL_BUFFER
} ENUM_OPENCL_HANDLE_TYPE;

typedef enum ENUM_OPENCL_PROPERTY_INTEGER {
  /**
   * Dedicated OpenCL accelerators (for example, the IBM CELL Blade). These
   * devices communicate with the host processor using a peripheral interconnect
   * such as PCIe.
   */
  CL_DEVICE_ACCELERATOR,
  /**
   * An OpenCL device that is the host processor. The host processor runs the
   * OpenCL implementations and is a single or multi-core CPU.
   */
  CL_DEVICE_CPU,
  /**
   * An OpenCL device that is a GPU.
   */
  CL_DEVICE_GPU,
  /**
   * The default OpenCL device in the system. The default device cannot be a
   * CL_DEVICE_TYPE_CUSTOM device.
   */
  CL_DEVICE_DEFAULT,
  /**
   * Dedicated accelerators that do not support programs written in OpenCL C.
   */
  CL_DEVICE_CUSTOM
} ENUM_OPENCL_PROPERTY_INTEGER;

typedef enum ENUM_CL_DEVICE_TYPE {
  /**
   * The number of devices with OpenCL support. This property does not require
   * specification of the first parameter, i.e. you can pass a zero value for
   * the handle parameter.
   */
  CL_DEVICE_COUNT,
  /**
   * Type of device
   */
  CL_DEVICE_TYPE,
  /**
   * Unique vendor identifier
   */
  CL_DEVICE_VENDOR_ID,
  /**
   * Number of parallel calculated tasks in OpenCL device. One working group
   * solves one computational task. The lowest value is 1
   */
  CL_DEVICE_MAX_COMPUTE_UNITS,
  /**
   * Highest set frequency of the device in MHz.
   */
  CL_DEVICE_MAX_CLOCK_FREQUENCY,
  /**
   * Size of the global memory of the device in bytes
   */
  CL_DEVICE_GLOBAL_MEM_SIZE,
  /**
   * Size of the processed data (scene) local memory in bytes
   */
  CL_DEVICE_LOCAL_MEM_SIZE,
  /**
   * The total number of the local working groups available for an OpenCL
   * device.
   */
  CL_DEVICE_MAX_WORK_GROUP_SIZE
} ENUM_CL_DEVICE_TYPE;

typedef enum ENUM_OPENCL_PROPERTY_STRING {
  /**
   * CL_PLATFORM_PROFILE - OpenCL Profile.  Profile name may be one of the
   * following values:
   *
   * FULL_PROFILE - implementation supports OpenCL (functionality is defined as
   * the part of the kernel specification without requiring additional
   * extensions for OpenCL support);
   * EMBEDDED_PROFILE - implementation supports OpenCL as a supplement. Amended
   * profile is defined as a subset for each OpenCL version.
   */
  CL_PLATFORM_PROFILE,
  /**
   * OpenCL version
   */
  CL_PLATFORM_VERSION,
  /**
   * Platform vendor name
   */
  CL_PLATFORM_VENDOR,
  /**
   * List of extensions supported by the platform. Extension names should be
   * supported by all devices related to this platform
   */
  CL_PLATFORM_EXTENSIONS,
  /**
   * Device name
   */
  CL_DEVICE_NAME,
  /**
   * Vendor name
   */
  CL_DEVICE_VENDOR,
  /**
   * OpenCL driver version in major_number.minor_number format
   */
  CL_DRIVER_VENDOR,
  /**
   * OpenCL device profile. Profile name may be one of the following values:
   *
   * FULL_PROFILE - implementation supports OpenCL (functionality is defined as
   * the part of the kernel specification without requiring additional
   * extensions for OpenCL support);
   * EMBEDDED_PROFILE - implementation supports OpenCL as a supplement. Amended
   * profile is defined as a subset for each OpenCL version.
   */
  CL_DEVICE_PROFILE,
  /**
   * OpenCL version in
   * "OpenCL<space><major_version.minor_version><space><vendor-specific
   * information>" format
   */
  CL_DEVICE_VERSION,
  /**
   * List of extensions supported by the device. The list may contain extensions
   * supported by the vendor, as well as one or more approved names:
   *
   * • cl_khr_int64_base_atomics
   * • cl_khr_int64_extended_atomics
   * • cl_khr_fp16
   * • cl_khr_gl_sharing
   * • cl_khr_gl_event
   * • cl_khr_d3d10_sharing
   * • cl_khr_dx9_media_sharing
   * • cl_khr_d3d11_sharing
   */
  CL_DEVICE_EXTENSIONS,
  /**
   * The list of supported kernels separated by ";".
   */
  CL_DEVICE_BUILT_IN_KERNELS,
  /**
   * The maximum version supported by the compiler for this device. Version
   * format:
   * "OpenCL<space>C<space><major_version.minor_version><space><vendor-specific
   * information>"
   */
  CL_DEVICE_OPENCL_C_VERSION
} ENUM_OPENCL_PROPERTY_STRING;
