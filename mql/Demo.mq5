//+------------------------------------------------------------------+
//|                                                         Demo.mq5 |
//|                                                            Mayur |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Mayur"
#property link      ""
#property version   "1.00"

#define MAGIC 3086 // Magic number is the ID of your EA
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
    // Initialize request variable
    MqlTradeRequest request = {0};
    // Initialize result variable
    MqlTradeResult result = {0};
    
    // Initialize the parameters of request
    // ------------------------------------
    // TRADE_ACTION_DEAL will place an order
    // for immediate execution
    request.action = TRADE_ACTION_DEAL;
    // magic is just the ID for the EA
    request.magic = MAGIC;
    // which symbol are you trading with
    request.symbol = Symbol();
    // volume of the lot
    request.volume = 0.1;
    // buy or sell
    request.type = ORDER_TYPE_BUY;
    // price at which this current operation
    // should be executed
    // we will ask the current price, so the
    // order will be execute immediately.
    request.price = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
    // deviation will specify the maximum deviation
    // from the asked price. This is used to avoid
    // slippage. The units is points. 
    request.deviation = 5;
     
    // Send the order
    if(!OrderSend(request, result)) {
      // print error, in case it occurs
      PrintFormat("OrderSend Error: %d", GetLastError());
    }
    
    // print results
    PrintFormat("ReturnCode: %u, deal: %I64u, order: %I64u",
                     result.retcode, result.deal, result.order);
    ExpertRemove();
  }
//+------------------------------------------------------------------+
