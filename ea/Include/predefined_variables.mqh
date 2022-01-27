#include "Include/enums/timeframes.mqh"
#include "Include/types/data_types.mqh"

/**
 * The _AppliedTo variable allows finding out the type of data, used for
 * indicator calculation:
 */
int _AppliedTo;

/**
 * The _Digits variable stores number of digits after a decimal point, which
 * defines the price accuracy of the symbol of the current chart.
 *
 * You may also use the Digits() function.
 */
uint _Digits;

/**
 * The _Point variable contains the point size of the current symbol in the
 * quote currency.
 *
 * You may also use the Point() function.
 */
double _Point;

/**
 * The _LastError variable contains code of the last error, that occurred during
 * the mql5-program run. Its value can be reset to zero by ResetLastError().
 *
 * To obtain the code of the last error, you may also use the GetLastError()
 * function.
 */
int _LastError;

/**
 * The _Period variable contains the value of the timeframe of the current
 * chart.
 *
 * Also you may use the Period() function.
 */
ENUM_TIMEFRAMES _Period;

/**
 * Variable for storing the current state when generating pseudo-random
 * integers. _RandomSeed changes its value when calling MathRand(). Use
 * MathSrand() to set the required initial condition.
 *
 * x random number received by MathRand() function is calculated in the
 * following way at each call:
 */
int _RandomSeed;

/**
 * The _StopFlag variable contains the flag of the mql5-program stop. When the
 * client terminal is trying to stop the program, it sets the _StopFlag variable
 * to true.
 *
 * To check the state of the _StopFlag you may also use the IsStopped()
 * function.
 */
bool _StopFlag;

/**
 * The _Symbol variable contains the symbol name of the current chart.
 *
 * You may also use the Symbol() function.
 */
string _Symbol;

/**
 * The _UninitReason variable contains the code of the program uninitialization
 * reason.
 *
 * Usually, this code is obtained by UninitializeReason() the function.
 */
int _UninitReason;

/**
 * The _IsX64 variable allows finding out the bit version of the terminal, in
 * which an MQL5 application is running: _IsX64=0 for the 32-bit terminal and
 * _IsX64!=0 for the 64-bit terminal.
 *
 * Also, function TerminalInfoInteger(TERMINAL_X64) can be used.
 */
int _IsX64;
