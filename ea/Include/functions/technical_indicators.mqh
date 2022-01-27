#include "Include/enums/indicator.mqh"
#include "Include/enums/price.mqh"
#include "Include/enums/timeseries.mqh"
#include "Include/types/data_types.mqh"

/**
 * The function creates Accelerator Oscillator in a global cache of the client
 * terminal and returns its handle. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * enumeration values, 0 means the current timeframe.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iAC(string symbol, ENUM_TIMEFRAMES period);

/**
 * The function returns the handle of the Accumulation/Distribution indicator.
 * It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * enumeration values, 0 means the current timeframe.
 * @param applied_volume The volume used. Can be any of ENUM_APPLIED_VOLUME
 * values.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iAD(string symbol,
        ENUM_TIMEFRAMES period,
        ENUM_APPLIED_VOLUME applied_volume);

/**
 * The function returns the handle of the Average Directional Movement Index
 * indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param adx_period Period to calculate the index.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iADX(string symbol, ENUM_TIMEFRAMES period, int adx_period);

/**
 * The function returns the handle of Average Directional Movement Index by
 * Welles Wilder.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param adx_period Period to calculate the index.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iADXWilder(string symbol, ENUM_TIMEFRAMES period, int adx_period);

/**
 * The function returns the handle of the Alligator indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param jaw_period Averaging period for the blue line (Alligator's Jaw)
 * @param jaw_shift The shift of the blue line relative to the price chart.
 * @param teeth_period Averaging period for the red line (Alligator's Teeth).
 * @param teeth_shift The shift of the red line relative to the price chart.
 * @param lips_period Averaging period for the green line (Alligator's lips).
 * @param lips_shift The shift of the green line relative to the price chart.
 * @param ma_method The method of averaging. Can be any of the ENUM_MA_METHOD
 * values.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iAlligator(string symbol,
               ENUM_TIMEFRAMES period,
               int jaw_period,
               int jaw_shift,
               int teeth_period,
               int teeth_shift,
               int lips_period,
               int lips_shift,
               ENUM_MA_METHOD ma_method,
               ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Adaptive Moving Average indicator. It
 * has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ama_period The calculation period, on which the efficiency coefficient
 * is calculated.
 * @param fast_ma_period Fast period for the smoothing coefficient calculation
 * for a rapid market.
 * @param slow_ma_period Slow period for the smoothing coefficient calculation
 * in the absence of trend.
 * @param ama_shift Shift of the indicator relative to the price chart.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iAMA(string symbol,
         ENUM_TIMEFRAMES period,
         int ama_period,
         int fast_ma_period,
         int slow_ma_period,
         int ama_shift,
         ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Awesome Oscillator indicator. It has
 * only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iAO(string symbol, ENUM_TIMEFRAMES period);

/**
 * The function returns the handle of the Average True Range indicator. It has
 * only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period The value of the averaging period for the indicator
 * calculation.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iATR(string symbol, ENUM_TIMEFRAMES period, int ma_period);

/**
 * The function returns the handle of the Bears Power indicator. It has only one
 * buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period The value of the averaging period for the indicator
 * calculation.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iBearsPower(string symbol, ENUM_TIMEFRAMES period, int ma_period);

/**
 * The function returns the handle of the Bollinger Bands® indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param bands_period The averaging period of the main line of the indicator.
 * @param bands_shift The shift the indicator relative to the price chart.
 * @param deviation Deviation from the main line.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iBands(string symbol,
           ENUM_TIMEFRAMES period,
           int bands_period,
           int bands_shift,
           double deviation,
           ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Bulls Power indicator. It has only one
 * buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period The averaging period for the indicator calculation.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iBullsPower(string symbol, ENUM_TIMEFRAMES period, int ma_period);

/**
 * The function returns the handle of the Commodity Channel Index indicator. It
 * has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period The averaging period for the indicator calculation.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iCCI(string symbol,
         ENUM_TIMEFRAMES period,
         int ma_period,
         ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Chaikin Oscillator indicator. It has
 * only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param fast_ma_period Fast averaging period for calculations.
 * @param slow_ma_period Slow averaging period for calculations.
 * @param ma_method Smoothing type. Can be one of the averaging constants of
 * ENUM_MA_METHOD.
 * @param applied_volume The volume used. Can be one of the constants of
 * ENUM_APPLIED_VOLUME.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iChaikin(string symbol,
             ENUM_TIMEFRAMES period,
             int fast_ma_period,
             int slow_ma_period,
             ENUM_MA_METHOD ma_method,
             ENUM_APPLIED_VOLUME applied_volume);

/**
 * The function returns the handle of a specified custom indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param name Custom indicator name. If the name starts with the reverse slash
 * '\\', the EX5 indicator file is searched for relative to the MQL5\\Indicators
 * indicator root directory. Thus, when calling iCustom(Symbol(), Period(),
 * "\\FirstIndicator"...), the indicator is downloaded as
 * MQL5\\Indicators\\FirstIndicator.ex5. If the path contains no file, the error
 * 4802 (ERR_INDICATOR_CANNOT_CREATE) occurs.
 *
 * If the path does not start with '\', the indicator is searched and downloaded
 * as follows:
 *
 * First, the indicator EX5 file is searched for in the folder where the EX5
 * file of the calling program is located. For example, the CrossMA.EX5 EA is
 * located in MQL5\Experts\MyExperts and contains the iCustom call (Symbol(),
 * Period(), "SecondIndicator"...). In this case, the indicator is searched for
 * in MQL5\Experts\MyExperts\SecondIndicator.ex5.
 *
 * If the indicator is not found in the same directory, the search is performed
 * relative to the MQL5\Indicators indicator root directory. In other words, the
 * search for the MQL5\Indicators\SecondIndicator.ex5 file is performed. If the
 * indicator is still not found, the function returns INVALID_HANDLE and the
 * error 4802 (ERR_INDICATOR_CANNOT_CREATE) is triggered.
 *
 * If the path to the indicator is set in the subdirectory (for example,
 * MyIndicators\ThirdIndicator), the search is first performed in the calling
 * program folder (the EA is located in MQL5\Experts\MyExperts) in
 * MQL5\Experts\MyExperts\MyIndicators\ThirdIndicator.ex5. If unsuccessful, the
 * search for the MQL5\Indicators\MyIndicators\ThirdIndicator.ex5 file is
 * performed. Make sure to use the double reverse slash '\\' as a separator in
 * the path, for example iCustom(Symbol(), Period(),
 * "MyIndicators\\ThirdIndicator"...)
 * @param ... input-parameters of a custom indicator, separated by commas. Type
 * and order of parameters must match. If there is no parameters specified, then
 * default values will be used.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iCustom(string symbol, ENUM_TIMEFRAMES period, string name, ...);

/**
 * The function returns the handle of the Double Exponential Moving Average
 * indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period (bars count) for calculations.
 * @param ma_shift Shift of the indicator relative to the price chart.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iDEMA(string symbol,
          ENUM_TIMEFRAMES period,
          int ma_period,
          int ma_shift,
          ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the DeMarker indicator. It has only one
 * buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period (bars count) for calculations.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iDeMarker(string symbol, ENUM_TIMEFRAMES period, int ma_period);

/**
 * The function returns the handle of the Envelopes indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period for the main line.
 * @param ma_shift The shift of the indicator relative to the price chart.
 * @param ma_method Smoothing type. Can be one of the values of ENUM_MA_METHOD.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @param deviation The deviation from the main line (in percents).
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iEnvelopes(string symbol,
               ENUM_TIMEFRAMES period,
               int ma_period,
               int ma_shift,
               ENUM_MA_METHOD ma_method,
               ENUM_APPLIED_PRICE applied_price,
               double deviation);

/**
 * The function returns the handle of the Force Index indicator. It has only one
 * buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period for the indicator calculations.
 * @param ma_method Smoothing type. Can be one of the values of ENUM_MA_METHOD.
 * @param applied_volume The volume used. Can be one of the values of
 * ENUM_APPLIED_VOLUME.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iForce(string symbol,
           ENUM_TIMEFRAMES period,
           int ma_period,
           ENUM_MA_METHOD ma_method,
           ENUM_APPLIED_VOLUME applied_volume);

/**
 * The function returns the handle of the Fractals indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iFractals(string symbol, ENUM_TIMEFRAMES period);

/**
 * The function returns the handle of the Fractal Adaptive Moving Average
 * indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Period (bars count) for the indicator calculations.
 * @param ma_shift Shift of the indicator in the price chart.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iFrAMA(string symbol,
           ENUM_TIMEFRAMES period,
           int ma_period,
           int ma_shift,
           ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Gator indicator. The Oscillator shows
 * the difference between the blue and red lines of Alligator (upper histogram)
 * and difference between red and green lines (lower histogram).
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param jaw_period Averaging period for the blue line (Alligator's Jaw).
 * @param jaw_shift The shift of the blue line relative to the price chart. It
 * isn't directly connected with the visual shift of the indicator histogram.
 * @param teeth_period Averaging period for the red line (Alligator's Teeth).
 * @param teeth_shift The shift of the red line relative to the price chart. It
 * isn't directly connected with the visual shift of the indicator histogram.
 * @param lips_period Averaging period for the green line (Alligator's lips).
 * @param lips_shift The shift of the green line relative to the price charts.
 * It isn't directly connected with the visual shift of the indicator histogram.
 * @param ma_method Smoothing type. Can be one of the values of ENUM_MA_METHOD.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iGator(string symbol,
           ENUM_TIMEFRAMES period,
           int jaw_period,
           int jaw_shift,
           int teeth_period,
           int teeth_shift,
           int lips_period,
           int lips_shift,
           ENUM_MA_METHOD ma_method,
           ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Ichimoku Kinko Hyo indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param tenkan_sen Averaging period for Tenkan Sen.
 * @param kijun_sen Averaging period for Kijun Sen.
 * @param senkou_span_b Averaging period for Senkou Span B.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iIchimoku(string symbol,
              ENUM_TIMEFRAMES period,
              int tenkan_sen,
              int kijun_sen,
              int senkou_span_b);

/**
 * The function returns the handle of the Market Facilitation Index indicator.
 * It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param applied_volume The volume used. Can be one of the constants of
 * ENUM_APPLIED_VOLUME.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iBWMFI(string symbol,
           ENUM_TIMEFRAMES period,
           ENUM_APPLIED_VOLUME applied_volume);

/**
 * The function returns the handle of the Momentum indicator. It has only one
 * buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param mom_period Averaging period (bars count) for the calculation of the
 * price change.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iMomentum(string symbol,
              ENUM_TIMEFRAMES period,
              int mom_period,
              ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Money Flow Index indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period (bars count) for the calculation.
 * @param applied_volume The volume used. Can be any of the ENUM_APPLIED_VOLUME
 * values.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iMFI(string symbol,
         ENUM_TIMEFRAMES period,
         int ma_period,
         ENUM_APPLIED_VOLUME applied_volume);

/**
 * The function returns the handle of the Moving Average indicator. It has only
 * one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period for the calculation of the moving average.
 * @param ma_shift Shift of the indicator relative to the price chart.
 * @param ma_method Smoothing type. Can be one of the ENUM_MA_METHOD values.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iMA(string symbol,
        ENUM_TIMEFRAMES period,
        int ma_period,
        int ma_shift,
        ENUM_MA_METHOD ma_method,
        ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Moving Average of Oscillator
 * indicator. The OsMA oscillator shows the difference between values of MACD
 * and its signal line. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param fast_ema_period Period for Fast Moving Average calculation.
 * @param slow_ema_period Period for Slow Moving Average calculation.
 * @param signal_period Averaging period for signal line calculation.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iOsMA(string symbol,
          ENUM_TIMEFRAMES period,
          int fast_ema_period,
          int slow_ema_period,
          int signal_period,
          ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Moving Averages Convergence/Divergence
 * indicator. In systems where OsMA is called MACD Histogram, this indicator is
 * shown as two lines. In the client terminal the Moving Averages
 * Convergence/Divergence looks like a histogram.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param fast_ema_period Period for Fast Moving Average calculation.
 * @param slow_ema_period Period for Slow Moving Average calculation.
 * @param signal_period Period for Signal line calculation.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iMACD(string symbol,
          ENUM_TIMEFRAMES period,
          int fast_ema_period,
          int slow_ema_period,
          int signal_period,
          ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the On Balance Volume indicator. It has
 * only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param applied_volume The volume used. Can be any of the ENUM_APPLIED_VOLUME
 * values.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iOBV(string symbol,
         ENUM_TIMEFRAMES period,
         ENUM_APPLIED_VOLUME applied_volume);

/**
 * The function returns the handle of the Parabolic Stop and Reverse system
 * indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param step The step of price increment, usually 0.02.
 * @param maximum The maximum step, usually 0.2.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iSAR(string symbol, ENUM_TIMEFRAMES period, double step, double maximum);

/**
 * The function returns the handle of the Relative Strength Index indicator. It
 * has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period for the RSI calculation.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iRSI(string symbol,
         ENUM_TIMEFRAMES period,
         int ma_period,
         ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Relative Vigor Index indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period for the RVI calculation.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iRVI(string symbol, ENUM_TIMEFRAMES period, int ma_period);

/**
 * The function returns the handle of the Standard Deviation indicator. It has
 * only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period for the indicator calculations.
 * @param ma_shift Shift of the indicator relative to the price chart.
 * @param ma_method Type of averaging. Can be any of the ENUM_MA_METHOD values.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iStdDev(string symbol,
            ENUM_TIMEFRAMES period,
            int ma_period,
            int ma_shift,
            ENUM_MA_METHOD ma_method,
            ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Stochastic Oscillator indicator.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param Kperiod Averaging period (bars count) for the %K line calculation.
 * @param Dperiod Averaging period (bars count) for the %D line calculation.
 * @param slowing Slowing value.
 * @param ma_method Type of averaging. Can be any of the ENUM_MA_METHOD values.
 * @param price_field Parameter of price selection for calculations. Can be one
 * of the ENUM_STO_PRICE values.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iStochastic(string symbol,
                ENUM_TIMEFRAMES period,
                int Kperiod,
                int Dperiod,
                int slowing,
                ENUM_MA_METHOD ma_method,
                ENUM_STO_PRICE price_field);

/**
 * The function returns the handle of the Triple Exponential Moving Average
 * indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period (bars count) for calculation.
 * @param ma_shift Shift of indicator relative to the price chart.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iTEMA(string symbol,
          ENUM_TIMEFRAMES period,
          int ma_period,
          int ma_shift,
          ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Triple Exponential Moving Averages
 * Oscillator indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param ma_period Averaging period (bars count) for calculations.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iTriX(string symbol,
          ENUM_TIMEFRAMES period,
          int ma_period,
          ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Larry Williams' Percent Range
 * indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param calc_period Period (bars count) for the indicator calculation.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iWPR(string symbol, ENUM_TIMEFRAMES period, int calc_period);

/**
 * The function returns the handle of the Variable Index Dynamic Average
 * indicator. It has only one buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param cmo_period Period (bars count) for the Chande Momentum Oscillator
 * calculation.
 * @param ema_period EMA period (bars count) for smoothing factor calculation.
 * @param ma_shift Shift of the indicator relative to the price chart.
 * @param applied_price The price used. Can be any of the price constants
 * ENUM_APPLIED_PRICE or a handle of another indicator.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iVIDyA(string symbol,
           ENUM_TIMEFRAMES period,
           int cmo_period,
           int ema_period,
           int ma_shift,
           ENUM_APPLIED_PRICE applied_price);

/**
 * The function returns the handle of the Volumes indicator. It has an only one
 * buffer.
 *
 * @param symbol The symbol name of the security, the data of which should be
 * used to calculate the indicator. The NULL value means the current symbol.
 * @param period The value of the period can be one of the ENUM_TIMEFRAMES
 * values, 0 means the current timeframe.
 * @param applied_volume The volume used. Can be any of the ENUM_APPLIED_VOLUME
 * values.
 * @returns Returns the handle of a specified technical indicator, in case of
 * failure returns INVALID_HANDLE. The computer memory can be freed from an
 * indicator that is no more utilized, using the IndicatorRelease() function, to
 * which the indicator handle is passed.
 */
int iVolumes(string symbol,
             ENUM_TIMEFRAMES period,
             ENUM_APPLIED_VOLUME applied_volume)
