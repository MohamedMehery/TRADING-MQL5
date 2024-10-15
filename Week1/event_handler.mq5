//+------------------------------------------------------------------+
//|                                                event_handler.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
// Global variables
double lotSize = 1.0;

// Event handler for initialization
int OnInit()
  {
   Print("Hi Program initialized.");
   return(INIT_SUCCEEDED);
  }

// Event handler for each market tick
void OnTick()
  {
   Print("New market tick detected.");
  }

// Event handler for de-initialization
void OnDeinit(const int reason)
  {
   Print("Program deinitialized.");
  }

//+------------------------------------------------------------------+
