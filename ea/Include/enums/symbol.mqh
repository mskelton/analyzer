typedef enum ENUM_SYMBOL_INFO_INTEGER {
  /**
   * The sector of the economy to which the asset belongs
   */
  SYMBOL_SECTOR,
  /**
   * The industry or the economy branch to which the symbol belongs
   */
  SYMBOL_INDUSTRY,
  /**
   * It is a custom symbol – the symbol has been created synthetically based on
   * other symbols from the Market Watch and/or external data sources
   */
  SYMBOL_CUSTOM,
  /**
   * The color of the background used for the symbol in Market Watch
   */
  SYMBOL_BACKGROUND_COLOR,
  /**
   * The price type used for generating symbols bars, i.e. Bid or Last
   */
  SYMBOL_CHART_MODE,
  /**
   * Symbol with this name exists
   */
  SYMBOL_EXIST,
  /**
   * Symbol is selected in Market Watch
   */
  SYMBOL_SELECT,
  /**
   * Symbol is visible in Market Watch.
   *  
   * Some symbols (mostly, these are cross rates required for calculation of
   * margin requirements or profits in deposit currency) are selected
   * automatically, but may not be visible in Market Watch. To be displayed such
   * symbols have to be explicitly selected.
   */
  SYMBOL_VISIBLE,
  /**
   * Number of deals in the current session
   */
  SYMBOL_SESSION_DEALS,
  /**
   * Number of Buy orders at the moment
   */
  SYMBOL_SESSION_BUY_ORDERS,
  /**
   * Number of Sell orders at the moment
   */
  SYMBOL_SESSION_SELL_ORDERS,
  /**
   * Volume of the last deal
   */
  SYMBOL_VOLUME,
  /**
   * Maximal day volume
   */
  SYMBOL_VOLUMEHIGH,
  /**
   * Minimal day volume
   */
  SYMBOL_VOLUMELOW,
  /**
   * Time of the last quote
   */
  SYMBOL_TIME,
  /**
   * Time of the last quote in milliseconds since 1970.01.01
   */
  SYMBOL_TIME_MSC,
  /**
   * Digits after a decimal point
   */
  SYMBOL_DIGITS,
  /**
   * Indication of a floating spread
   */
  SYMBOL_SPREAD_FLOAT,
  /**
   * Spread value in points
   */
  SYMBOL_SPREAD,
  /**
   * Maximal number of requests shown in Depth of Market. For symbols that have
   * no queue of requests, the value is equal to zero.
   */
  SYMBOL_TICKS_BOOKDEPTH,
  /**
   * Contract price calculation mode
   */
  SYMBOL_TRADE_CALC_MODE,
  /**
   * Order execution type
   */
  SYMBOL_TRADE_MODE,
  /**
   * Date of the symbol trade beginning (usually used for futures)
   */
  SYMBOL_START_TIME,
  /**
   * Date of the symbol trade end (usually used for futures)
   */
  SYMBOL_EXPIRATION_TIME,
  /**
   * Minimal indention in points from the current close price to place Stop
   * orders
   */
  SYMBOL_TRADE_STOPS_LEVEL,
  /**
   * Distance to freeze trade operations in points
   */
  SYMBOL_TRADE_FREEZE_LEVEL,
  /**
   * Deal execution mode
   */
  SYMBOL_TRADE_EXEMODE,
  /**
   * Swap calculation model
   */
  SYMBOL_SWAP_MODE,
  /**
   * Day of week to charge 3 days swap rollover
   */
  SYMBOL_SWAP_ROLLOVER3DAYS,
  /**
   * Calculating hedging margin using the larger leg (Buy or Sell)
   */
  SYMBOL_MARGIN_HEDGED_USE_LEG,
  /**
   * Flags of allowed order expiration modes
   */
  SYMBOL_EXPIRATION_MODE,
  /**
   * Flags of allowed order filling modes
   */
  SYMBOL_FILLING_MODE,
  /**
   * Flags of allowed order types
   */
  SYMBOL_ORDER_MODE,
  /**
   * Expiration of Stop Loss and Take Profit orders, if
   * SYMBOL_EXPIRATION_MODE=SYMBOL_EXPIRATION_GTC (Good till canceled)
   */
  SYMBOL_ORDER_GTC_MODE,
  /**
   * Option type
   */
  SYMBOL_OPTION_MODE,
  /**
   * Option right (Call/Put)
   */
  SYMBOL_OPTION_RIGHT,
} ENUM_SYMBOL_INFO_INTEGER;

typedef enum ENUM_SYMBOL_INFO_DOUBLE {
  /**
   * Bid - best sell offer
   */
  SYMBOL_BID,
  /**
   * Maximal Bid of the day
   */
  SYMBOL_BIDHIGH,
  /**
   * Minimal Bid of the day
   */
  SYMBOL_BIDLOW,
  /**
   * Ask - best buy offer
   */
  SYMBOL_ASK,
  /**
   * Maximal Ask of the day
   */
  SYMBOL_ASKHIGH,
  /**
   * Minimal Ask of the day
   */
  SYMBOL_ASKLOW,
  /**
   * Price of the last deal
   */
  SYMBOL_LAST,
  /**
   * Maximal Last of the day
   */
  SYMBOL_LASTHIGH,
  /**
   * Minimal Last of the day
   */
  SYMBOL_LASTLOW,
  /**
   * Volume of the last deal
   */
  SYMBOL_VOLUME_REAL,
  /**
   * Maximum Volume of the day
   */
  SYMBOL_VOLUMEHIGH_REAL,
  /**
   * Minimum Volume of the day
   */
  SYMBOL_VOLUMELOW_REAL,
  /**
   * The strike price of an option. The price at which an option buyer can buy
   * (in a Call option) or sell (in a Put option) the underlying asset, and the
   * option seller is obliged to sell or buy the appropriate amount of the
   * underlying asset.
   */
  SYMBOL_OPTION_STRIKE,
  /**
   * Symbol point value
   */
  SYMBOL_POINT,
  /**
   * Value of SYMBOL_TRADE_TICK_VALUE_PROFIT
   */
  SYMBOL_TRADE_TICK_VALUE,
  /**
   * Calculated tick price for a profitable position
   */
  SYMBOL_TRADE_TICK_VALUE_PROFIT,
  /**
   * Calculated tick price for a losing position
   */
  SYMBOL_TRADE_TICK_VALUE_LOSS,
  /**
   * Minimal price change
   */
  SYMBOL_TRADE_TICK_SIZE,
  /**
   * Trade contract size
   */
  SYMBOL_TRADE_CONTRACT_SIZE,
  /**
   * Accrued interest – accumulated coupon interest, i.e. part of the coupon
   * interest calculated in proportion to the number of days since the coupon
   * bond issuance or the last coupon interest payment
   */
  SYMBOL_TRADE_ACCRUED_INTEREST,
  /**
   * Face value – initial bond value set by the issuer
   */
  SYMBOL_TRADE_FACE_VALUE,
  /**
   * Liquidity Rate is the share of the asset that can be used for the margin.
   */
  SYMBOL_TRADE_LIQUIDITY_RATE,
  /**
   * Minimal volume for a deal
   */
  SYMBOL_VOLUME_MIN,
  /**
   * Maximal volume for a deal
   */
  SYMBOL_VOLUME_MAX,
  /**
   * Minimal volume change step for deal execution
   */
  SYMBOL_VOLUME_STEP,
  /**
   * Maximum allowed aggregate volume of an open position and pending orders in
   * one direction (buy or sell) for the symbol. For example, with the
   * limitation of 5 lots, you can have an open buy position with the volume of
   * 5 lots and place a pending order Sell Limit with the volume of 5 lots. But
   * in this case you cannot place a Buy Limit pending order (since the total
   * volume in one direction will exceed the limitation) or place Sell Limit
   * with the volume more than 5 lots.
   */
  SYMBOL_VOLUME_LIMIT,
  /**
   * Long swap value
   */
  SYMBOL_SWAP_LONG,
  /**
   * Short swap value
   */
  SYMBOL_SWAP_SHORT,
  /**
   * Initial margin means the amount in the margin currency required for opening
   * a position with the volume of one lot. It is used for checking a client's
   * assets when he or she enters the market.
   *
   * The SymbolInfoMarginRate() function provides data on the amount of charged
   * margin depending on the order type and direction.
   */
  SYMBOL_MARGIN_INITIAL,
  /**
   * The maintenance margin. If it is set, it sets the margin amount in the
   * margin currency of the symbol, charged from one lot. It is used for
   * checking a client's assets when his/her account state changes. If the
   * maintenance margin is equal to 0, the initial margin is used.
   *
   * The SymbolInfoMarginRate() function provides data on the amount of charged
   * margin depending on the order type and direction.
   */
  SYMBOL_MARGIN_MAINTENANCE,
  /**
   * Summary volume of current session deals
   */
  SYMBOL_SESSION_VOLUME,
  /**
   * Summary turnover of the current session
   */
  SYMBOL_SESSION_TURNOVER,
  /**
   * Summary open interest
   */
  SYMBOL_SESSION_INTEREST,
  /**
   * Current volume of Buy orders
   */
  SYMBOL_SESSION_BUY_ORDERS_VOLUME,
  /**
   * Current volume of Sell orders
   */
  SYMBOL_SESSION_SELL_ORDERS_VOLUME,
  /**
   * Open price of the current session
   */
  SYMBOL_SESSION_OPEN,
  /**
   * Close price of the current session
   */
  SYMBOL_SESSION_CLOSE,
  /**
   * Average weighted price of the current session
   */
  SYMBOL_SESSION_AW,
  /**
   * Settlement price of the current session
   */
  SYMBOL_SESSION_PRICE_SETTLEMENT,
  /**
   * Minimal price of the current session
   */
  SYMBOL_SESSION_PRICE_LIMIT_MIN,
  /**
   * Maximal price of the current session
   */
  SYMBOL_SESSION_PRICE_LIMIT_MAX,
  /**
   * Contract size or margin value per one lot of hedged positions (oppositely
   * directed positions of one symbol). Two margin calculation methods are
   * possible for hedged positions. The calculation method is defined by the
   * broker.
   *
   * Basic calculation: If the initial margin (SYMBOL_MARGIN_INITIAL) is
   * specified for a symbol, the hedged margin is specified as an absolute value
   * (in monetary terms).If the initial margin is not specified (equal to 0),
   * SYMBOL_MARGIN_HEDGED is equal to the size of the contract, that will be
   * used to calculate the margin by the appropriate formula in accordance with
   * the type of the financial instrument (SYMBOL_TRADE_CALC_MODE).  
   *
   * Calculation for the largest position: The SYMBOL_MARGIN_HEDGED value is not
   * taken into account.The volume of all short and all long positions of a
   * symbol is calculated.For each direction, a weighted average open price and
   * a weighted average rate of conversion to the deposit currency is
   * calculated.Next, using the appropriate formula chosen in accordance with
   * the symbol type (SYMBOL_TRADE_CALC_MODE) the margin is calculated for the
   * short and the long part.The largest one of the values is used as the
   * margin.
   */
  SYMBOL_MARGIN_HEDGED,
  /**
   * Change of the current price relative to the end of the previous trading day
   * in %
   */
  SYMBOL_PRICE_CHANGE,
  /**
   * Price volatility in %
   */
  SYMBOL_PRICE_VOLATILITY,
  /**
   * Theoretical option price
   */
  SYMBOL_PRICE_THEORETICAL,
  /**
   * Option/warrant delta shows the value the option price changes by, when the
   * underlying asset price changes by 1
   */
  SYMBOL_PRICE_DELTA,
  /**
   * Option/warrant theta shows the number of points the option price is to lose
   * every day due to a temporary breakup, i.e. when the expiration date
   * approaches
   */
  SYMBOL_PRICE_THETA,
  /**
   * Option/warrant gamma shows the change rate of delta – how quickly or slowly
   * the option premium changes
   */
  SYMBOL_PRICE_GAMMA,
  /**
   * Option/warrant vega shows the number of points the option price changes by
   * when the volatility changes by 1%
   */
  SYMBOL_PRICE_VEGA,
  /**
   * Option/warrant rho reflects the sensitivity of the theoretical option price
   * to the interest rate changing by 1%
   */
  SYMBOL_PRICE_RHO,
  /**
   * Option/warrant omega. Option elasticity shows a relative percentage change
   * of the option price by the percentage change of the underlying asset price
   */
  SYMBOL_PRICE_OMEGA,
  /**
   * Option/warrant sensitivity shows by how many points the price of the
   * option's underlying asset should change so that the price of the option
   * changes by one point
   */
  SYMBOL_PRICE_SENSITIVITY,
} ENUM_SYMBOL_INFO_DOUBLE;

typedef enum ENUM_SYMBOL_INFO_STRING {
  /**
   * The underlying asset of a derivative
   */
  SYMBOL_BASIS,
  /**
   * The name of the sector or category to which the financial symbol belongs
   */
  SYMBOL_CATEGORY,
  /**
   * The country to which the financial symbol belongs
   */
  SYMBOL_COUNTRY,
  /**
   * The sector of the economy to which the financial symbol belongs
   */
  SYMBOL_SECTOR_NAME,
  /**
   * The industry branch or the industry to which the financial symbol belongs
   */
  SYMBOL_INDUSTRY_NAME,
  /**
   * Basic currency of a symbol
   */
  SYMBOL_CURRENCY_BASE,
  /**
   * Profit currency
   */
  SYMBOL_CURRENCY_PROFIT,
  /**
   * Margin currency
   */
  SYMBOL_CURRENCY_MARGIN,
  /**
   * Feeder of the current quote
   */
  SYMBOL_BANK,
  /**
   * Symbol description
   */
  SYMBOL_DESCRIPTION,
  /**
   * The name of the exchange in which the financial symbol is traded
   */
  SYMBOL_EXCHANGE,
  /**
   * The formula used for the custom symbol pricing. If the name of a financial
   * symbol used in the formula starts with a digit or contains a special
   * character (">" ", ".", "-", "&", "#" and so on) quotation marks should be
   * used around this symbol name.
   *
   * Synthetic symbol: "\@ESU19"/iEURCAD
   * Calendar spread: "Si-9.13"-"Si-6.13"
   * Euro index: 34.38805726 * pow(EURUSD,0.3155) * pow(EURGBP,0.3056) *
   * pow(EURJPY,0.1891) * pow(EURCHF,0.1113) * pow(EURSEK,0.0785)
   */
  SYMBOL_FORMULA,
  /**
   * The name of a symbol in the ISIN system (International Securities
   * Identification Number). The International Securities Identification Number
   * is a 12-digit alphanumeric code that uniquely identifies a security. The
   * presence of this symbol property is determined on the side of a trade
   * server.
   */
  SYMBOL_ISIN,
  /**
   * The address of the web page containing symbol information. This address
   * will be displayed as a link when viewing symbol properties in the terminal
   */
  SYMBOL_PAGE,
  /**
   * Path in the symbol tree
   */
  SYMBOL_PATH,
} ENUM_SYMBOL_INFO_STRING;

typedef enum ENUM_SYMBOL_CHART_MODE {
  /**
   * Bars are based on Bid prices
   */
  SYMBOL_CHART_MODE_BID,
  /**
   * Bars are based on Last prices
   */
  SYMBOL_CHART_MODE_LAST,
} ENUM_SYMBOL_CHART_MODE;

typedef enum SYMBOL_EXPIRATION {
  /**
   * The order is valid during the unlimited time period, until it is explicitly
   * canceled
   */
  SYMBOL_EXPIRATION_GTC,
  /**
   * The order is valid till the end of the day
   */
  SYMBOL_EXPIRATION_DAY,
  /**
   * The expiration time is specified in the order
   */
  SYMBOL_EXPIRATION_SPECIFIED,
  /**
   * The expiration date is specified in the order
   */
  SYMBOL_EXPIRATION_SPECIFIED_DAY,
} SYMBOL_EXPIRATION;

typedef enum ENUM_SYMBOL_ORDER_GTC_MODE {
  /**
   * Pending orders and Stop Loss/Take Profit levels are valid for an unlimited
   * period until their explicit cancellation
   */
  SYMBOL_ORDERS_GTC,
  /**
   * Orders are valid during one trading day. At the end of the day, all Stop
   * Loss and Take Profit levels, as well as pending orders are deleted.
   */
  SYMBOL_ORDERS_DAILY,
  /**
   * When a trade day changes, only pending orders are deleted, while Stop Loss
   * and Take Profit levels are preserved.
   */
  SYMBOL_ORDERS_DAILY_EXCLUDING_STOPS,
} ENUM_SYMBOL_ORDER_GTC_MODE;

typedef enum ENUM_SYMBOL_ORDER {
  /**
   * Market orders are allowed (Buy and Sell)
   */
  SYMBOL_ORDER_MARKET,
  /**
   * Limit orders are allowed (Buy Limit and Sell Limit)
   */
  SYMBOL_ORDER_LIMIT,
  /**
   * Stop orders are allowed (Buy Stop and Sell Stop)
   */
  SYMBOL_ORDER_STOP,
  /**
   * Stop-limit orders are allowed (Buy Stop Limit and Sell Stop Limit)
   */
  SYMBOL_ORDER_STOP_LIMIT,
  /**
   * Stop Loss is allowed
   */
  SYMBOL_ORDER_SL,
  /**
   * Take Profit is allowed
   */
  SYMBOL_ORDER_TP,
  /**
   * Close By operation is allowed, i.e. closing a position by another open
   * position on the same instruments but in the opposite direction. The
   * property is set for accounts with the hedging accounting system
   * (ACCOUNT_MARGIN_MODE_RETAIL_HEDGING)
   */
  SYMBOL_ORDER_CLOSEBY,
} ENUM_SYMBOL_ORDER;

typedef enum ENUM_SYMBOL_CALC_MODE {
  /**
   * Forex mode - calculation of profit and margin for Forex
   */
  SYMBOL_CALC_MODE_FOREX,
  /**
   * Forex No Leverage mode – calculation of profit and margin for Forex symbols
   * without taking into account the leverage
   */
  SYMBOL_CALC_MODE_FOREX_NO_LEVERAGE,
  /**
   * Futures mode - calculation of margin and profit for futures
   */
  SYMBOL_CALC_MODE_FUTURES,
  /**
   * CFD mode - calculation of margin and profit for CFD
   */
  SYMBOL_CALC_MODE_CFD,
  /**
   * CFD index mode - calculation of margin and profit for CFD by indexes
   */
  SYMBOL_CALC_MODE_CFDINDEX,
  /**
   * CFD Leverage mode - calculation of margin and profit for CFD at leverage
   * trading
   */
  SYMBOL_CALC_MODE_CFDLEVERAGE,
  /**
   * Exchange mode – calculation of margin and profit for trading securities on
   * a stock exchange
   */
  SYMBOL_CALC_MODE_EXCH_STOCKS,
  /**
   * Futures mode –  calculation of margin and profit for trading futures
   * contracts on a stock exchange
   */
  SYMBOL_CALC_MODE_EXCH_FUTURES,
  /**
   * FORTS Futures mode –  calculation of margin and profit for trading futures
   * contracts on FORTS. The margin may be reduced by the amount of
   * MarginDiscount deviation according to the following rules:
   *
   * 1. If the price of a long position (buy order) is less than the estimated
   * price, MarginDiscount = Lots*((PriceSettle-PriceOrder)*TickPrice/TickSize)
   * 2. If the price of a short position (sell order) exceeds the estimated
   * price, MarginDiscount = Lots*((PriceOrder-PriceSettle)*TickPrice/TickSize)
   * where:
   *
   * PriceSettle – estimated (clearing) price of the previous session
   * PriceOrder – average weighted position price or open price set in the order
   * (request)
   * TickPrice – tick price (cost of the price change by one
   * point)
   * TickSize – tick size (minimum price change step)
   */
  SYMBOL_CALC_MODE_EXCH_FUTURES_FORTS,
  /**
   * Exchange Bonds mode – calculation of margin and profit for trading bonds on
   * a stock exchange
   */
  SYMBOL_CALC_MODE_EXCH_BONDS,
  /**
   * Exchange MOEX Stocks mode – calculation of margin and profit for trading
   * securities on MOEX
   */
  SYMBOL_CALC_MODE_EXCH_STOCKS_MOEX,
  /**
   * Exchange MOEX Bonds mode – calculation of margin and profit for trading
   * bonds on MOEX
   */
  SYMBOL_CALC_MODE_EXCH_BONDS_MOEX,
  /**
   * Collateral mode - a symbol is used as a non-tradable asset on a trading
   * account. The market value of an open position is calculated based on the
   * volume, current market price, contract size and liquidity ratio. The value
   * is included into Assets, which are added to Equity. Open positions of such
   * symbols increase the Free Margin amount and are used as additional margin
   * (collateral) for open positions of tradable instruments.
   */
  SYMBOL_CALC_MODE_SERV_COLLATERAL,
} ENUM_SYMBOL_CALC_MODE;

typedef enum ENUM_SYMBOL_TRADE_MODE {
  /**
   * Trade is disabled for the symbol
   */
  SYMBOL_TRADE_MODE_DISABLED,
  /**
   * Allowed only long positions
   */
  SYMBOL_TRADE_MODE_LONGONLY,
  /**
   * Allowed only short positions
   */
  SYMBOL_TRADE_MODE_SHORTONLY,
  /**
   * Allowed only position close operations
   */
  SYMBOL_TRADE_MODE_CLOSEONLY,
  /**
   * No trade restrictions
   */
  SYMBOL_TRADE_MODE_FULL,
} ENUM_SYMBOL_TRADE_MODE;

typedef enum ENUM_SYMBOL_SWAP_MODE {
  /**
   * Swaps disabled (no swaps)
   */
  SYMBOL_SWAP_MODE_DISABLED,
  /**
   * Swaps are charged in points
   */
  SYMBOL_SWAP_MODE_POINTS,
  /**
   * Swaps are charged in money in base currency of the symbol
   */
  SYMBOL_SWAP_MODE_CURRENCY_SYMBOL,
  /**
   * Swaps are charged in money in margin currency of the symbol
   */
  SYMBOL_SWAP_MODE_CURRENCY_MARGIN,
  /**
   * Swaps are charged in money, in client deposit currency
   */
  SYMBOL_SWAP_MODE_CURRENCY_DEPOSIT,
  /**
   * Swaps are charged as the specified annual interest from the instrument
   * price at calculation of swap (standard bank year is 360 days)
   */
  SYMBOL_SWAP_MODE_INTEREST_CURRENT,
  /**
   * Swaps are charged as the specified annual interest from the open price of
   * position (standard bank year is 360 days)
   */
  SYMBOL_SWAP_MODE_INTEREST_OPEN,
  /**
   * Swaps are charged by reopening positions. At the end of a trading day the
   * position is closed. Next day it is reopened by the close price +/-
   * specified number of points (parameters SYMBOL_SWAP_LONG and
   * SYMBOL_SWAP_SHORT)
   */
  SYMBOL_SWAP_MODE_REOPEN_CURRENT,
  /**
   * Swaps are charged by reopening positions. At the end of a trading day the
   * position is closed. Next day it is reopened by the current Bid price +/-
   * specified number of points (parameters SYMBOL_SWAP_LONG and
   * SYMBOL_SWAP_SHORT)
   */
  SYMBOL_SWAP_MODE_REOPEN_BID,
} ENUM_SYMBOL_SWAP_MODE;

typedef enum ENUM_DAY_OF_WEEK {
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
} ENUM_DAY_OF_WEEK;

typedef enum ENUM_SYMBOL_OPTION_RIGHT {
  /**
   * A call option gives you the right to buy an asset at a specified price
   */
  SYMBOL_OPTION_RIGHT_CALL,
  /**
   * A put option gives you the right to sell an asset at a specified price
   */
  SYMBOL_OPTION_RIGHT_PUT,
} ENUM_SYMBOL_OPTION_RIGHT;

typedef enum ENUM_SYMBOL_SECTOR {
  SECTOR_UNDEFINED,
  SECTOR_BASIC_MATERIALS,
  SECTOR_COMMUNICATION_SERVICES,
  SECTOR_CONSUMER_CYCLICAL,
  SECTOR_CONSUMER_DEFENSIVE,
  SECTOR_CURRENCY,
  SECTOR_CURRENCY_CRYPTO,
  SECTOR_ENERGY,
  SECTOR_FINANCIAL,
  SECTOR_HEALTHCARE,
  SECTOR_INDUSTRIALS,
  SECTOR_REAL_ESTATE,
  SECTOR_TECHNOLOGY,
  SECTOR_UTILITIES
} ENUM_SYMBOL_SECTOR;

typedef enum ENUM_SYMBOL_INDUSTRY {
  /**
   * Undefined
   */
  INDUSTRY_UNDEFINED,
  /**
   * Agricultural inputs
   */
  INDUSTRY_AGRICULTURAL_INPUTS,
  /**
   * Aluminium
   */
  INDUSTRY_ALUMINIUM,
  /**
   * Building materials
   */
  INDUSTRY_BUILDING_MATERIALS,
  /**
   * Chemicals
   */
  INDUSTRY_CHEMICALS,
  /**
   * Coking coal
   */
  INDUSTRY_COKING_COAL,
  /**
   * Copper
   */
  INDUSTRY_COPPER,
  /**
   * Gold
   */
  INDUSTRY_GOLD,
  /**
   * Lumber and wood production
   */
  INDUSTRY_LUMBER_WOOD,
  /**
   * Other industrial metals and mining
   */
  INDUSTRY_INDUSTRIAL_METALS,
  /**
   * Other precious metals and mining
   */
  INDUSTRY_PRECIOUS_METALS,
  /**
   * Paper and paper products
   */
  INDUSTRY_PAPER,
  /**
   * Silver
   */
  INDUSTRY_SILVER,
  /**
   * Specialty chemicals
   */
  INDUSTRY_SPECIALTY_CHEMICALS,
  /**
   * Steel
   */
  INDUSTRY_STEEL,
  /**
   * Advertising agencies
   */
  INDUSTRY_ADVERTISING,
  /**
   * Broadcasting
   */
  INDUSTRY_BROADCASTING,
  /**
   * Electronic gaming and multimedia
   */
  INDUSTRY_GAMING_MULTIMEDIA,
  /**
   * Entertainment
   */
  INDUSTRY_ENTERTAINMENT,
  /**
   * Internet content and information
   */
  INDUSTRY_INTERNET_CONTENT,
  /**
   * Publishing
   */
  INDUSTRY_PUBLISHING,
  /**
   * Telecom services
   */
  INDUSTRY_TELECOM,
  /**
   * Apparel manufacturing
   */
  INDUSTRY_APPAREL_MANUFACTURING,
  /**
   * Apparel retail
   */
  INDUSTRY_APPAREL_RETAIL,
  /**
   * Auto manufacturers
   */
  INDUSTRY_AUTO_MANUFACTURERS,
  /**
   * Auto parts
   */
  INDUSTRY_AUTO_PARTS,
  /**
   * Auto and truck dealerships
   */
  INDUSTRY_AUTO_DEALERSHIP,
  /**
   * Department stores
   */
  INDUSTRY_DEPARTMENT_STORES,
  /**
   * Footwear and accessories
   */
  INDUSTRY_FOOTWEAR_ACCESSORIES,
  /**
   * Furnishing, fixtures and appliances
   */
  INDUSTRY_FURNISHINGS,
  /**
   * Gambling
   */
  INDUSTRY_GAMBLING,
  /**
   * Home improvement retail
   */
  INDUSTRY_HOME_IMPROV_RETAIL,
  /**
   * Internet retail
   */
  INDUSTRY_INTERNET_RETAIL,
  /**
   * Leisure
   */
  INDUSTRY_LEISURE,
  /**
   * Lodging
   */
  INDUSTRY_LODGING,
  /**
   * Luxury goods
   */
  INDUSTRY_LUXURY_GOODS,
  /**
   * Packaging and containers
   */
  INDUSTRY_PACKAGING_CONTAINERS,
  /**
   * Personal services
   */
  INDUSTRY_PERSONAL_SERVICES,
  /**
   * Recreational vehicles
   */
  INDUSTRY_RECREATIONAL_VEHICLES,
  /**
   * Residential construction
   */
  INDUSTRY_RESIDENT_CONSTRUCTION,
  /**
   * Resorts and casinos
   */
  INDUSTRY_RESORTS_CASINOS,
  /**
   * Restaurants
   */
  INDUSTRY_RESTAURANTS,
  /**
   * Specialty retail
   */
  INDUSTRY_SPECIALTY_RETAIL,
  /**
   * Textile manufacturing
   */
  INDUSTRY_TEXTILE_MANUFACTURING,
  /**
   * Travel services
   */
  INDUSTRY_TRAVEL_SERVICES,
  /**
   * Beverages - Brewers
   */
  INDUSTRY_BEVERAGES_BREWERS,
  /**
   * Beverages - Non-alcoholic
   */
  INDUSTRY_BEVERAGES_NON_ALCO,
  /**
   * Beverages - Wineries and distilleries
   */
  INDUSTRY_BEVERAGES_WINERIES,
  /**
   * Confectioners
   */
  INDUSTRY_CONFECTIONERS,
  /**
   * Discount stores
   */
  INDUSTRY_DISCOUNT_STORES,
  /**
   * Education and training services
   */
  INDUSTRY_EDUCATION_TRAINIG,
  /**
   * Farm products
   */
  INDUSTRY_FARM_PRODUCTS,
  /**
   * Food distribution
   */
  INDUSTRY_FOOD_DISTRIBUTION,
  /**
   * Grocery stores
   */
  INDUSTRY_GROCERY_STORES,
  /**
   * Household and personal products
   */
  INDUSTRY_HOUSEHOLD_PRODUCTS,
  /**
   * Packaged foods
   */
  INDUSTRY_PACKAGED_FOODS,
  /**
   * Tobacco
   */
  INDUSTRY_TOBACCO,
  /**
   * Oil and gas drilling
   */
  INDUSTRY_OIL_GAS_DRILLING,
  /**
   * Oil and gas extraction and processing
   */
  INDUSTRY_OIL_GAS_EP,
  /**
   * Oil and gas equipment and services
   */
  INDUSTRY_OIL_GAS_EQUIPMENT,
  /**
   * Oil and gas integrated
   */
  INDUSTRY_OIL_GAS_INTEGRATED,
  /**
   * Oil and gas midstream
   */
  INDUSTRY_OIL_GAS_MIDSTREAM,
  /**
   * Oil and gas refining and marketing
   */
  INDUSTRY_OIL_GAS_REFINING,
  /**
   * Thermal coal
   */
  INDUSTRY_THERMAL_COAL,
  /**
   * Uranium
   */
  INDUSTRY_URANIUM,
  /**
   * Exchange traded fund
   */
  INDUSTRY_EXCHANGE_TRADED_FUND,
  /**
   * Assets management
   */
  INDUSTRY_ASSETS_MANAGEMENT,
  /**
   * Banks - Diversified
   */
  INDUSTRY_BANKS_DIVERSIFIED,
  /**
   * Banks - Regional
   */
  INDUSTRY_BANKS_REGIONAL,
  /**
   * Capital markets
   */
  INDUSTRY_CAPITAL_MARKETS,
  /**
   * Closed-End fund - Debt
   */
  INDUSTRY_CLOSE_END_FUND_DEBT,
  /**
   * Closed-end fund - Equity
   */
  INDUSTRY_CLOSE_END_FUND_EQUITY,
  /**
   * Closed-end fund - Foreign
   */
  INDUSTRY_CLOSE_END_FUND_FOREIGN,
  /**
   * Credit services
   */
  INDUSTRY_CREDIT_SERVICES,
  /**
   * Financial conglomerates
   */
  INDUSTRY_FINANCIAL_CONGLOMERATE,
  /**
   * Financial data and stock exchange
   */
  INDUSTRY_FINANCIAL_DATA_EXCHANGE,
  /**
   * Insurance brokers
   */
  INDUSTRY_INSURANCE_BROKERS,
  /**
   * Insurance - Diversified
   */
  INDUSTRY_INSURANCE_DIVERSIFIED,
  /**
   * Insurance - Life
   */
  INDUSTRY_INSURANCE_LIFE,
  /**
   * Insurance - Property and casualty
   */
  INDUSTRY_INSURANCE_PROPERTY,
  /**
   * Insurance - Reinsurance
   */
  INDUSTRY_INSURANCE_REINSURANCE,
  /**
   * Insurance - Specialty
   */
  INDUSTRY_INSURANCE_SPECIALTY,
  /**
   * Mortgage finance
   */
  INDUSTRY_MORTGAGE_FINANCE,
  /**
   * Shell companies
   */
  INDUSTRY_SHELL_COMPANIES,
  /**
   * Biotechnology
   */
  INDUSTRY_BIOTECHNOLOGY,
  /**
   * Diagnostics and research
   */
  INDUSTRY_DIAGNOSTICS_RESEARCH,
  /**
   * Drugs manufacturers - general
   */
  INDUSTRY_DRUGS_MANUFACTURERS,
  /**
   * Drugs manufacturers - Specialty and generic
   */
  INDUSTRY_DRUGS_MANUFACTURERS_SPEC,
  /**
   * Healthcare plans
   */
  INDUSTRY_HEALTHCARE_PLANS,
  /**
   * Health information services
   */
  INDUSTRY_HEALTH_INFORMATION,
  /**
   * Medical care facilities
   */
  INDUSTRY_MEDICAL_FACILITIES,
  /**
   * Medical devices
   */
  INDUSTRY_MEDICAL_DEVICES,
  /**
   * Medical distribution
   */
  INDUSTRY_MEDICAL_DISTRIBUTION,
  /**
   * Medical instruments and supplies
   */
  INDUSTRY_MEDICAL_INSTRUMENTS,
  /**
   * Pharmaceutical retailers
   */
  INDUSTRY_PHARM_RETAILERS,
  /**
   * Aerospace and defense
   */
  INDUSTRY_AEROSPACE_DEFENSE,
  /**
   * Airlines
   */
  INDUSTRY_AIRLINES,
  /**
   * Airports and air services
   */
  INDUSTRY_AIRPORTS_SERVICES,
  /**
   * Building products and equipment
   */
  INDUSTRY_BUILDING_PRODUCTS,
  /**
   * Business equipment and supplies
   */
  INDUSTRY_BUSINESS_EQUIPMENT,
  /**
   * Conglomerates
   */
  INDUSTRY_CONGLOMERATES,
  /**
   * Consulting services
   */
  INDUSTRY_CONSULTING_SERVICES,
  /**
   * Electrical equipment and parts
   */
  INDUSTRY_ELECTRICAL_EQUIPMENT,
  /**
   * Engineering and construction
   */
  INDUSTRY_ENGINEERING_CONSTRUCTION,
  /**
   * Farm and heavy construction machinery
   */
  INDUSTRY_FARM_HEAVY_MACHINERY,
  /**
   * Industrial distribution
   */
  INDUSTRY_INDUSTRIAL_DISTRIBUTION,
  /**
   * Infrastructure operations
   */
  INDUSTRY_INFRASTRUCTURE_OPERATIONS,
  /**
   * Integrated freight and logistics
   */
  INDUSTRY_FREIGHT_LOGISTICS,
  /**
   * Marine shipping
   */
  INDUSTRY_MARINE_SHIPPING,
  /**
   * Metal fabrication
   */
  INDUSTRY_METAL_FABRICATION,
  /**
   * Pollution and treatment controls
   */
  INDUSTRY_POLLUTION_CONTROL,
  /**
   * Railroads
   */
  INDUSTRY_RAILROADS,
  /**
   * Rental and leasing services
   */
  INDUSTRY_RENTAL_LEASING,
  /**
   * Security and protection services
   */
  INDUSTRY_SECURITY_PROTECTION,
  /**
   * Specialty business services
   */
  INDUSTRY_SPEALITY_BUSINESS_SERVICES,
  /**
   * Specialty industrial machinery
   */
  INDUSTRY_SPEALITY_MACHINERY,
  /**
   * Stuffing and employment services
   */
  INDUSTRY_STUFFING_EMPLOYMENT,
  /**
   * Tools and accessories
   */
  INDUSTRY_TOOLS_ACCESSORIES,
  /**
   * Trucking
   */
  INDUSTRY_TRUCKING,
  /**
   * Waste management
   */
  INDUSTRY_WASTE_MANAGEMENT,
  /**
   * Real estate - Development
   */
  INDUSTRY_REAL_ESTATE_DEVELOPMENT,
  /**
   * Real estate - Diversified
   */
  INDUSTRY_REAL_ESTATE_DIVERSIFIED,
  /**
   * Real estate services
   */
  INDUSTRY_REAL_ESTATE_SERVICES,
  /**
   * REIT - Diversified
   */
  INDUSTRY_REIT_DIVERSIFIED,
  /**
   * REIT - Healthcase facilities
   */
  INDUSTRY_REIT_HEALTCARE,
  /**
   * REIT - Hotel and motel
   */
  INDUSTRY_REIT_HOTEL_MOTEL,
  /**
   * REIT - Industrial
   */
  INDUSTRY_REIT_INDUSTRIAL,
  /**
   * REIT - Mortgage
   */
  INDUSTRY_REIT_MORTAGE,
  /**
   * REIT - Office
   */
  INDUSTRY_REIT_OFFICE,
  /**
   * REIT - Residential
   */
  INDUSTRY_REIT_RESIDENTAL,
  /**
   * REIT - Retail
   */
  INDUSTRY_REIT_RETAIL,
  /**
   * REIT - Specialty
   */
  INDUSTRY_REIT_SPECIALITY,
  /**
   * Communication equipment
   */
  INDUSTRY_COMMUNICATION_EQUIPMENT,
  /**
   * Computer hardware
   */
  INDUSTRY_COMPUTER_HARDWARE,
  /**
   * Consumer electronics
   */
  INDUSTRY_CONSUMER_ELECTRONICS,
  /**
   * Electronic components
   */
  INDUSTRY_ELECTRONIC_COMPONENTS,
  /**
   * Electronics and computer distribution
   */
  INDUSTRY_ELECTRONIC_DISTRIBUTION,
  /**
   * Information technology services
   */
  INDUSTRY_IT_SERVICES,
  /**
   * Scientific and technical instruments
   */
  INDUSTRY_SCIENTIFIC_INSTRUMENTS,
  /**
   * Semiconductor equipment and materials
   */
  INDUSTRY_SEMICONDUCTOR_EQUIPMENT,
  /**
   * Semiconductors
   */
  INDUSTRY_SEMICONDUCTORS,
  /**
   * Software - Application
   */
  INDUSTRY_SOFTWARE_APPLICATION,
  /**
   * Software - Infrastructure
   */
  INDUSTRY_SOFTWARE_INFRASTRUCTURE,
  /**
   * Solar
   */
  INDUSTRY_SOLAR,
  /**
   * Utilities - Diversified
   */
  INDUSTRY_UTILITIES_DIVERSIFIED,
  /**
   * Utilities - Independent power producers
   */
  INDUSTRY_UTILITIES_POWERPRODUCERS,
  /**
   * Utilities - Renewable
   */
  INDUSTRY_UTILITIES_RENEWABLE,
  /**
   * Utilities - Regulated electric
   */
  INDUSTRY_UTILITIES_REGULATED_ELECTRIC,
  /**
   * Utilities - Regulated gas
   */
  INDUSTRY_UTILITIES_REGULATED_GAS,
  /**
   * Utilities - Regulated water
   */
  INDUSTRY_UTILITIES_REGULATED_WATER,
  /**
   * Start of the utilities services types enumeration. Corresponds to
   * INDUSTRY_UTILITIES_DIVERSIFIED.
   */
  INDUSTRY_UTILITIES_FIRST,
  /**
   * End of the utilities services types enumeration. Corresponds to
   * INDUSTRY_UTILITIES_REGULATED_WATER.
   */
  INDUSTRY_UTILITIES_LAST
} ENUM_SYMBOL_INDUSTRY;

typedef enum ENUM_SYMBOL_OPTION_MODE {
  /**
   * European option may only be exercised on a specified date (expiration,
   * execution date, delivery date)
   */
  SYMBOL_OPTION_MODE_EUROPEAN,
  /**
   * American option may be exercised on any trading day or before expiry. The
   * period within which a buyer can exercise the option is specified for it
   */
  SYMBOL_OPTION_MODE_AMERICAN,
} ENUM_SYMBOL_OPTION_MODE;
