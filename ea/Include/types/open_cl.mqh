/**
 * Any available device with OpenCL support is allowed;
 */
int CL_USE_ANY;

/**
 * Only OpenCL emulation on CPU is allowed;
 */
int CL_USE_CPU_ONLY;

/**
 * OpenCL emulation is prohibited and only specialized devices with OpenCL
 * support (video cards) can be used.
 */
int CL_USE_GPU_ONLY;

int CL_MEM_READ_WRITE;
int CL_MEM_WRITE_ONLY;
int CL_MEM_READ_ONLY;
int CL_MEM_ALLOC_HOST_PTR;

int CL_COMPLETE;
int CL_RUNNING;
int CL_SUBMITTED;
int CL_QUEUED;
