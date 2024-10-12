//+------------------------------------------------------------------+
//|                                                          oop.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
// Define a class called Trade
class Trade
  {
   private:
      string symbol;
      double lotSize;

   public:
      // Constructor to initialize the object
      Trade(string sym, double lot)
        {
         symbol = sym;
         lotSize = lot;
        }

      // Method to print trade details
      void PrintTradeDetails()
        {
         Print("Symbol: ", symbol, ", Lot size: ", lotSize);
        }
       // Private method
      private:
       void PrintPrivateMessage()
        {
         Print("This is a private message.");
        }       
  };

class AdvancedTrade : public Trade
  {
   private:
      double stopLoss;

   public:
      AdvancedTrade(string sym, double lot, double sl) : Trade(sym, lot)
        {
         stopLoss = sl;
        }

      // Method to print advanced trade details
      void PrintAdvancedDetails()
        {
         PrintTradeDetails(); // Calling the base class method
         Print("Stop Loss: ", stopLoss);
        }
  };
  
  
// Main function
void OnStart()
  {
   // Create an object of the Trade class
   Trade myTrade("EURUSD", 1.5);
   Print("symbol = , symbol ask = ", SYMBOL_ASKLOW, SYMBOL_ASK);
   
   // Call the method to print trade details
   myTrade.PrintTradeDetails();
    // But we cannot call private methods outside the class (uncomment to see an error)
   //myTrade.PrintPrivateMessage();
   
      // Create an object of the derived class
   AdvancedTrade advTrade("USDJPY", 1.0, 100);
   
   // Call the method from the derived class
   advTrade.PrintAdvancedDetails();
  }

//+------------------------------------------------------------------+
