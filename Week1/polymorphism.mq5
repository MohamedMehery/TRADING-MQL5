//+------------------------------------------------------------------+
//|                                                 polymorphism.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
class Trade
  {
   public:
      virtual void Execute()
        {
         Print("Executing base trade.");
        }
  };

class AdvancedTrade : public Trade
  {
   public:
      void Execute() override
        {
         Print("Executing advanced trade with additional features.");
        }
  };

void OnStart()
  {
   Trade baseTrade;
   AdvancedTrade advTrade;

   // Polymorphism in action
   baseTrade.Execute();       // Calls base class method
   advTrade.Execute();        // Calls overridden method
  }

//+------------------------------------------------------------------+
