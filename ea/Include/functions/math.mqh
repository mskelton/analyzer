#include "Include/enums/math.mqh"
#include "Include/types/data_types.mqh"

/**
 * The function returns the absolute value (modulus) of the specified numeric
 * value.
 *
 * @param value Numeric value.
 * @returns Value of double type more than or equal to zero.
 */
double MathAbs(double value);

/**
 * The function returns the arccosine of x within the range 0 to π in radians.
 *
 * @param val The val value between -1 and 1, the arc cosine of which is to be
 * calculated.
 * @returns Arc cosine of a number in radians. If val is less than -1 or more
 * than 1, the function returns NaN (indeterminate value).
 */
double MathArccos(double val);

/**
 * The function returns the arc sine of x within the range of -π/2 to π/2
 * radians.
 *
 * @param val The val value between -1 and 1, the arc sine of which is to be
 * calculated.
 * @returns Arc sine of the val number in radians within the range of -π/2 to
 * π/2 radians. If val is less than -1 or more than 1, the function returns NaN
 * (indeterminate value).
 */
double MathArcsin(double val);

/**
 * The function returns the arc tangent of x. If x is equal to 0, the function
 * returns 0.
 *
 * @param value A number representing a tangent.
 * @returns MathArctan returns a value within the range of -π/2 to π/2 radians.
 */
double MathArctan(double value);

/**
 * Return the angle (in radians) whose tangent is the quotient of two specified
 * numbers.
 *
 * @param y Y coordinate value.
 * @param x X coordinate value.
 * @returns MathArctan2 returns an angle, θ, within the range from -π to π
 * radians, so that MathTan(θ)=y/x.
 */
double MathArctan2(double y, double x);

/**
 * Determines the type of a real number and returns a result as a value from the
 * ENUM_FP_CLASS enumeration
 *
 * @param value The real number to be checked
 * @returns A value from the ENUM_FP_CLASS enumeration
 */
ENUM_FP_CLASS MathClassify(double value);

/**
 * The function returns integer numeric value closest from above.
 *
 * @param val Numeric value.
 * @returns Numeric value representing the smallest integer that exceeds or
 * equals to val.
 */
double MathCeil(double val);

/**
 * The function returns the cosine of an angle.
 *
 * @param value Angle in radians.
 * @returns Value of double type within the range of -1 to 1.
 */
double MathCos(double value);

/**
 * The function returns the value of e raised to the power of d.
 *
 * @param value A number specifying the power.
 * @returns A number of double type. In case of overflow the function returns
 * INF (infinity), in case of underflow MathExp returns 0.
 */
double MathExp(double value);

/**
 * The function returns integer numeric value closest from below.
 *
 * @param val Numeric value.
 * @returns A numeric value representing the largest integer that is less than
 * or equal to val.
 */
double MathFloor(double val);

/**
 * The function returns a natural logarithm.
 *
 * @param val Value logarithm of which is to be found.
 * @returns The natural logarithm of val in case of success. If val is negative,
 * the function returns NaN (undetermined value). If val is equal to 0, the
 * function returns INF (infinity).
 */
double MathLog(double val);

/**
 * Returns the logarithm of a number by base 10.
 *
 * @param val Numeric value the common logarithm of which is to be calculated.
 * @returns The common logarithm in case of success. If val is negative, the
 * function returns NaN (undetermined value). If val is equal to 0, the function
 * returns INF (infinity).
 */
double MathLog10(double val);

/**
 * The function returns the maximal value of two values.
 *
 * @param value1 First numeric value.
 * @param value2 Second numeric value.
 * @returns The largest of the two values.
 */
double MathMax(double value1, double value2);

/**
 * The function returns the minimal value of two values.
 *
 * @param value1 First numeric value.
 * @param value2 Second numeric value.
 * @returns The smallest of the two values.
 */
double MathMin(double value1, double value2);

/**
 * The function returns the real remainder of division of two numbers.
 *
 * @param value Dividend value.
 * @param value2 Divisor value.
 * @returns The MathMod function calculates the real remainder f from expression
 * val/y so that val = i * y + f , where i is an integer, f has the same sign as
 * val, and the absolute value of f is less than the absolute value of y.
 */
double MathMod(double value, double value2);

/**
 * The function raises a base to a specified power.
 *
 * @param base Base.
 * @param exponent Exponent value.
 * @returns Value of base raised to the specified power.
 */
double MathPow(double base, double exponent);

/**
 * Returns a pseudorandom integer within the range of 0 to 32767.
 *
 * @returns Integer value within the range of 0 to 32767.
 */
int MathRand();

/**
 * The function returns a value rounded off to the nearest integer of the
 * specified numeric value.
 *
 * @param value Numeric value before rounding.
 * @returns Value rounded till to the nearest integer.
 */
double MathRound(double value);

/**
 * Returns the sine of a specified angle.
 *
 * @param value Angle in radians.
 * @returns Sine of an angle measured in radians. Returns value within the range
 * of -1 to 1.
 */
double MathSin(double value);

/**
 * Returns the square root of a number.
 *
 * @param value Positive numeric value.
 * @returns Square root of value. If value is negative, MathSqrt returns NaN
 * (indeterminate value).
 */
double MathSqrt(double value);

/**
 * Sets the starting point for generating a series of pseudorandom integers.
 *
 * @param seed Starting number for the sequence of random numbers.
 */
void MathSrand(int seed);

/**
 * The function returns a tangent of a number.
 *
 * @param rad Angle in radians.
 * @returns Tangent of rad. If rad is greater than or equal to 263, or less than
 * or equal to -263, a loss of significance in the result occurs, in which case
 * the function returns an indefinite number.
 */
double MathTan(double rad);

/**
 * It checks the correctness of a real number.
 *
 * @param number Checked numeric value.
 * @returns It returns true, if the checked value is an acceptable real number.
 * If the checked value is a plus or minus infinity, or "not a number" (NaN),
 * the function returns false.
 */
bool MathIsValidNumber(double number);

/**
 * Returns the value of the expression MathExp(x)-1.
 *
 * @param value The number specifying the power.
 * @returns A value of the double type. In case of overflow the function returns
 * INF (infinity), in case of underflow MathExpm1 returns 0.
 */
double MathExpm1(double value);

/**
 * Returns the value of the expression MathLog(1+x).
 *
 * @param value The value, the logarithm of which is to be calculated.
 * @returns The natural logarithm of the value (value + 1) if successful. If
 * value is < -1, the function returns NaN (undefined value). If value is equal
 * to -1, the function returns INF (infinity).
 */
double MathLog1p(double value);

/**
 * Returns the hyperbolic arccosine.
 *
 * @param value The value, the hyperbolic arccosine of which is to be
 * calculated.
 * @returns The hyperbolic arccosine of the number. If value is less than +1,
 * the function returns NaN (undefined value).
 */
double MathArccosh(double value);

/**
 * Returns the hyperbolic arcsine.
 *
 * @param val The value, the hyperbolic arcsine of which is to be calculated.
 * @returns The hyperbolic arcsine of the number.
 */
double MathArcsinh(double value);

/**
 * Returns the hyperbolic arctangent.
 *
 * @param value Number within the range of -1 < value < 1, which represents the
 * tangent.
 * @returns The hyperbolic arctangent of the number.
 */
double MathArctanh(double value);

/**
 * Returns the hyperbolic cosine of the number.
 *
 * @param value Value.
 * @returns The hyperbolic cosine of the number, value within the range of +1 to
 * positive infinity.
 */
double MathCosh(double value);

/**
 * Returns the hyperbolic sine of the number.
 *
 * @param value Value.
 * @returns The hyperbolic sine of the number.
 */
double MathSinh(double value);

/**
 * Returns the hyperbolic tangent of the number.
 *
 * @param value Value.
 * @returns The hyperbolic tangent of the number, value within the range of -1
 * to +1.
 */
double MathTanh(double value);

/**
 * Change the order of bytes in the ushort type value.
 *
 * @param value Value for changing the order of bytes.
 * @returns Value with the reverse byte order.
 */
ushort MathSwap(ushort value);
uint MathSwap(uint value);
ulong MathSwap(ulong value);
