//+------------------------------------------------------------------+
//|                                               input-tutorial.mq5 |
//|                                                           Mehery |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Mehery"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property script_show_inputs
//--- input parameters
extern int      Stoplosspips;
extern int      Takeprofitpips;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   double takeprofitlevel,stoplosslevel;
   double Bid = SymbolInfoDouble(_Symbol , SYMBOL_BID);
   
   takeprofitlevel = Bid + (Takeprofitpips * Point()) ;
   stoplosslevel = Bid - (Stoplosspips * Point());
   
  Alert("Take profit level = " , takeprofitlevel);
  Alert("stop loss level = " , stoplosslevel);
  }
//+------------------------------------------------------------------+
