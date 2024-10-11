//+------------------------------------------------------------------+
//|                                                    variables.mq5 |
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
   string hellomessage = "hello_message";
   datetime today = D'2024.10.11 12:00';
   Print("Today date:", today);
   
   enum Day {Saterday=6, Sunday=7, Monday=1, Tueday, Wenesday, Thursday, Friday};
   Day thisday = Friday;
   
   Print("today is ", thisday);
  }
//+------------------------------------------------------------------+
