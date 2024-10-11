//+------------------------------------------------------------------+
//|                                                  controlflow.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
      // Break example
   Print("Break example:");
   for (int i = 0; i < 5; i++)
   {
      if (i == 3)
         break; // Exit the loop when i equals 3
      Print("i = ", i);
   }

   // Continue example
   Print("Continue example:");
   for (int j = 0; j < 5; j++)
   {
      if (j == 2)
         continue; // Skip the rest of this iteration when j equals 2
      Print("j = ", j);
   }
  }
//+------------------------------------------------------------------+
