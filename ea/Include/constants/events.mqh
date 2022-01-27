/**
 * The EA has stopped working calling the ExpertRemove() function
 */
int REASON_PROGRAM;

/**
 * Program removed from a chart
 */
int REASON_REMOVE;

/**
 * Program recompiled
 */
int REASON_RECOMPILE;

/**
 * A symbol or a chart period is changed
 */
int REASON_CHARTCHANGE;

/**
 * Chart closed
 */
int REASON_CHARTCLOSE;

/**
 * Inputs changed by a user
 */
int REASON_PARAMETERS;

/**
 * Another account has been activated or reconnection to the trade server has
 * occurred due to changes in the account settings
 */
int REASON_ACCOUNT;

/**
 * Another chart template applied
 */
int REASON_TEMPLATE;

/**
 * The OnInit() handler returned a non-zero value
 */
int REASON_INITFAILED;

/**
 * Terminal closed
 */
int REASON_CLOSE;
