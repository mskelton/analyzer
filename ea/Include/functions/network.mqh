#include "Include/types/data_types.mqh"

/**
 * Create a socket with specified flags and return its handle.
 *
 * @param flags Combination of flags defining the mode of working with a socket.
 * Currently, only one flag is supported — SOCKET_DEFAULT.
 * @returns In case of a successful socket creation, return its handle,
 * otherwise INVALID_HANDLE.
 */
int SocketCreate(uint flags);

/**
 * Close a socket.
 *
 * @param socket Handle of a socket to be closed. The handle is returned by the
 * SocketCreate function. When an incorrect handle is passed, the error 5270
 * (ERR_NETSOCKET_INVALIDHANDLE) is written to _LastError.
 * @returns Returns true if successful, otherwise false.
 */
bool SocketClose(const int socket);

/**
 * Connect to the server with timeout control.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @param server Domain name of the server you want to connect to or its IP
 * address.
 * @param port Connection port number.
 * @param timeout_receive_ms Connection timeout in milliseconds. If connection
 * is not established within that time interval, attempts are stopped.
 * @returns If connection is successful, return true, otherwise false.
 */
bool SocketConnect(int socket,
                   const string server,
                   uint port,
                   uint timeout_receive_ms);

/**
 * Checks if the socket is currently connected.
 *
 * @param socket Socket handle returned by the SocketCreate() function. When an
 * incorrect handle is passed to _LastError, the error 5270
 * (ERR_NETSOCKET_INVALIDHANDLE) is activated.
 * @returns Returns true if the socket is connected, otherwise - false.
 */
bool SocketIsConnected(const int socket);

/**
 * Get a number of bytes that can be read from a socket.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed to _LastError, the error 5270
 * (ERR_NETSOCKET_INVALIDHANDLE) is activated.
 * @returns Number of bytes that can be read. In case of an error, 0 is
 * returned.
 */
uint SocketIsReadable(const int socket);

/**
 * Check whether data can be written to a socket at the current time.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @returns Return true if writing is possible, otherwise false.
 */
bool SocketIsWritable(const int socket);

/**
 * Set timeouts for receiving and sending data for a socket system object.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @param timeout_send_ms Data sending timeout in milliseconds.
 * @param timeout_receive_ms Data obtaining timeout in milliseconds.
 * @returns Returns true if successful, otherwise false.
 */
bool SocketTimeouts(int socket, uint timeout_send_ms, uint timeout_receive_ms);

/**
 * Read data from a socket.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed to _LastError, the error 5270
 * (ERR_NETSOCKET_INVALIDHANDLE) is activated.
 * @param buffer Reference to the uchar type array the data is read in. Dynamic
 * array size is increased by the number of read bytes. The array size cannot
 * exceed INT_MAX (2147483647).
 * @param buffer_maxlen Number of bytes to read to the buffer[] array. Data not
 * fitting into the array remain in the socket. They can be received by the next
 * SocketRead call. buffer_maxlen cannot exceed INT_MAX (2147483647).
 * @param timeout_ms Data reading timeout in milliseconds. If data is not
 * obtained within this time, attempts are stopped and the function returns -1.
 * @returns If successful, return the number of read bytes. In case of an error,
 * -1 is returned.
 */
int SocketRead(int socket, uchar buffer[], uint buffer_maxlen, uint timeout_ms);

/**
 * Write data to a socket.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @param buffer Reference to the uchar type array with the data to be sent to
 * the socket.
 * @param buffer_len 'buffer' array size.
 * @returns If successful, return the number of bytes written to a socket. In
 * case of an error, -1 is returned.
 */
int SocketSend(int socket, const uchar buffer[], uint buffer_len);

/**
 * Initiate secure TLS (SSL) connection to a specified host via TLS Handshake
 * protocol. During Handshake, a client and a server agree on connection
 * parameters: applied protocol version and data encryption method.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @param host Address of a host a secure connection is established with.
 * @returns Returns true if successful, otherwise false.
 */
bool SocketTlsHandshake(int socket, const string host);

/**
 * Get data on the certificate used to secure network connection.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @param subject Certificate owner name. Corresponds to the Subject field.
 * @param issuer Certificate issuer name. Corresponds to the Issuer field.
 * @param serial Certificate serial number. Corresponds to the SerialNumber
 * field.
 * @param thumbprint Certificate print. Corresponds to the SHA-1 hash from the
 * entire certificate file (all fields including the issuer signature).
 * @param expiration Certificate expiration date in the datetime format.
 * @returns Returns true if successful, otherwise false.
 */
int SocketTlsCertificate(int socket,
                         string& subject,
                         string& issuer,
                         string& serial,
                         string& thumbprint,
                         datetime& expiration);

/**
 * Read data from secure TLS connection.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed to _LastError, the error 5270
 * (ERR_NETSOCKET_INVALIDHANDLE) is activated.
 * @param buffer Reference to the uchar type array the data is read in. Dynamic
 * array size is increased by the number of read bytes. The array size cannot
 * exceed INT_MAX (2147483647).
 * @param buffer_maxlen Number of bytes to read to the buffer[] array. Data not
 * fitting into the array remain in the socket. They can be received by the next
 * SocketTLSRead call. buffer_maxlen cannot exceed INT_MAX (2147483647).
 * @returns If successful, return the number of read bytes. In case of an error,
 * -1 is returned.
 */
int SocketTlsRead(int socket, uchar buffer[], uint buffer_maxlen);

/**
 * Read all available data from secure TLS connection.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed to _LastError, the error 5270
 * (ERR_NETSOCKET_INVALIDHANDLE) is activated.
 * @param buffer Reference to the uchar type array the data is read in. Dynamic
 * array size is increased by the number of read bytes. The array size cannot
 * exceed INT_MAX (2147483647).
 * @param buffer_maxlen Number of bytes to read to the buffer[] array. Data not
 * fitting into the array remain in the socket. They can be received by the next
 * SocketTlsReadAvailable or SocketTlsRead call. buffer_maxlen cannot exceed
 * INT_MAX (2147483647).
 * @returns If successful, return the number of read bytes. In case of an error,
 * -1 is returned.
 */
int SocketTlsReadAvailable(int socket,
                           uchar buffer[],
                           const uint buffer_maxlen);

/**
 * Send data via secure TLS connection.
 *
 * @param socket Socket handle returned by the SocketCreate function. When an
 * incorrect handle is passed, the error 5270 (ERR_NETSOCKET_INVALIDHANDLE) is
 * written to _LastError.
 * @param buffer Reference to the uchar type array with the data to be sent.
 * @param buffer_len 'buffer' array size.
 * @returns If successful, return the number of bytes written to a socket. In
 * case of an error, -1 is returned.
 */
int SocketTlsSend(int socket, const uchar buffer[], uint buffer_len);

/**
 * The function sends an HTTP request to a specified server. The function has
 * two versions:
 *
 * @param method HTTP method.
 * @param url URL.
 * @param headers Request headers of type "key: value", separated by a line
 * break "\\r\\n".
 * @param cookie Cookie value.
 * @param referer Value of the Referer header of the HTTP request.
 * @param timeout Timeout in milliseconds.
 * @param data Data array of the HTTP message body.
 * @param data_size Size of the data[] array.
 * @param result An array containing server response data.
 * @param result_headers Server response headers.
 * @returns HTTP server response code or -1 for an error.
 */
int WebRequest(const string method,
               const string url,
               const string cookie,
               const string referer,
               int timeout,
               const char data[],
               int data_size,
               char result[],
               string& result_headers);
int WebRequest(const string method,
               const string url,
               const string headers,
               int timeout,
               const char data[],
               char result[],
               string& result_headers);

/**
 * Sends a file at the address, specified in the setting window of the "FTP"
 * tab.
 *
 * @param filename Name of sent file.
 * @param ftp_path FTP catalog. If a directory is not specified, directory
 * described in settings is used.
 * @returns In case of failure returns 'false'.
 */
bool SendFTP(string filename, string ftp_path = "");

/**
 * Sends an email at the address specified in the settings window of the "Email"
 * tab.
 *
 * @param subject Email header.
 * @param some_text Email body.
 * @returns true – if an email is put into the send queue, otherwise - false.
 */
bool SendMail(string subject, string some_text);

/**
 * Sends push notifications to the mobile terminals, whose MetaQuotes IDs are
 * specified in the "Notifications" tab.
 *
 * @param text The text of the notification. The message length should not
 * exceed 255 characters.
 * @returns true if a notification has been successfully sent from the terminal;
 * in case of failure returns false. When checking after a failed push of
 * notification, GetLastError () may return one of the following errors:
 *
 * 4515 – ERR_NOTIFICATION_SEND_FAILED,
 * 4516 – ERR_NOTIFICATION_WRONG_PARAMETER,
 * 4517 – ERR_NOTIFICATION_WRONG_SETTINGS,
 * 4518 – ERR_NOTIFICATION_TOO_FREQUENT.
 */
bool SendNotification(string text);
