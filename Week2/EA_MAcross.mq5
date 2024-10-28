//+------------------------------------------------------------------+
//|                                                   EA_MAcross.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
#include <Indicators\Indicator.mqh>

input int FastMA_period = 12;
input int SlowMA_period = 26;
input double LotSize = 0.01;
input int StopLoss = 5;
input int TakeProfit = 15;

CTrade trade;  // Create a trade object
void CloseAllTrades(int positionType);
void OpenTrade(int tradeType);

void OnTick()
{
    // Calculate the Moving averages
    double fastMA_indicator = iMA(Symbol(), PERIOD_CURRENT, FastMA_period, 0, MODE_EMA, PRICE_CLOSE);
    double slowMA_indicator = iMA(Symbol(), PERIOD_CURRENT, SlowMA_period, 0, MODE_EMA, PRICE_CLOSE);
    double prefastMA_indicator = iMA(Symbol(), PERIOD_CURRENT, FastMA_period, 2, MODE_EMA, PRICE_CLOSE);
    double preslowMA_indicator = iMA(Symbol(), PERIOD_CURRENT, SlowMA_period, 2, MODE_EMA, PRICE_CLOSE);

    // Print the calculated indicators for debugging
    Print("Fast MA: ", fastMA_indicator, ", Slow MA: ", slowMA_indicator);
    Print("Previous Fast MA: ", prefastMA_indicator, ", Previous Slow MA: ", preslowMA_indicator);

    // Put the conditional buy, sell orders
    if (prefastMA_indicator <= preslowMA_indicator && fastMA_indicator > slowMA_indicator)
    {
        Print("Buy signal detected");
        CloseAllTrades(POSITION_TYPE_SELL);
        OpenTrade(POSITION_TYPE_BUY);
    }
    else if (prefastMA_indicator >= preslowMA_indicator && fastMA_indicator < slowMA_indicator)
    {
        Print("Sell signal detected");
        CloseAllTrades(POSITION_TYPE_BUY);
        OpenTrade(POSITION_TYPE_SELL);
    }
    else
    {
        Print("No crossover signal detected");
    }
}

void CloseAllTrades(int positionType)
{
    int totalPositions = PositionsTotal();
    for (int i = totalPositions - 1; i >= 0; i--)
    {
        ulong positionTicket = PositionGetTicket(i);
        if (PositionSelectByTicket(positionTicket))
        {
            if (PositionGetInteger(POSITION_TYPE) == positionType)
            {
                string symbol = PositionGetString(POSITION_SYMBOL);
                double volume = PositionGetDouble(POSITION_VOLUME);

                MqlTradeRequest request;
                MqlTradeResult result;
                ZeroMemory(request);
                ZeroMemory(result);

                request.action = TRADE_ACTION_DEAL;
                request.symbol = symbol;
                request.volume = volume;
                request.type = (positionType == POSITION_TYPE_BUY) ? ORDER_TYPE_SELL : ORDER_TYPE_BUY;
                request.position = positionTicket;

                if (!OrderSend(request, result))
                {
                    Print("Failed to close position: ", GetLastError());
                }
                else
                {
                    Print("Position closed successfully: ", result.comment);
                }
            }
        }
    }
}

void OpenTrade(int tradeType)
{
    double price = 0.0;
    if (tradeType == POSITION_TYPE_BUY)
    {
        SymbolInfoDouble(Symbol(), SYMBOL_ASK, price);
    }
    else
    {
        SymbolInfoDouble(Symbol(), SYMBOL_BID, price);
    }

    double sl;
    if (tradeType == POSITION_TYPE_BUY)
    {
        sl = price - StopLoss * SymbolInfoDouble(Symbol(), SYMBOL_POINT);
    }
    else
    {
        sl = price + StopLoss * SymbolInfoDouble(Symbol(), SYMBOL_POINT);
    }

    double tp;
    if (tradeType == POSITION_TYPE_BUY)
    {
        tp = price + TakeProfit * SymbolInfoDouble(Symbol(), SYMBOL_POINT);
    }
    else
    {
        tp = price - TakeProfit * SymbolInfoDouble(Symbol(), SYMBOL_POINT);
    }

    // Log the trade details
    Print("Attempting to open ", (tradeType == POSITION_TYPE_BUY ? "Buy" : "Sell"), " position at price: ", price, " SL: ", sl, " TP: ", tp);

    if (tradeType == POSITION_TYPE_BUY)
    {
        if (!trade.Buy(LotSize, Symbol(), price, sl, tp, "MA Crossover Buy"))
        {
            Print("Failed to open Buy position: ", GetLastError());
        }
        else
        {
            Print("Buy position opened successfully");
        }
    }
    else
    {
        if (!trade.Sell(LotSize, Symbol(), price, sl, tp, "MA Crossover Sell"))
        {
            Print("Failed to open Sell position: ", GetLastError());
        }
        else
        {
            Print("Sell position opened successfully");
        }
    }
}
//+------------------------------------------------------------------+
