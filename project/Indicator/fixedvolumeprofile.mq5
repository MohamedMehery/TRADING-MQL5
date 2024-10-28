//--- Define input parameters
input int bbars = 150;              // Number of bars to analyze
input int cnum = 9;                // Row size (number of levels)
input double percent = 49;        // Value Area Volume %
input color poc_color = clrAqua;     // POC line color
input int poc_width = 2;            // POC line width
input color vup_color = clrYellowGreen;    // Value Area Up color
input color vdown_color = clrLightSeaGreen;// Value Area Down color
input color up_color = clrPlum;     // UP Volume color
input color down_color = clrLightGreen; // Down Volume color
input bool show_poc = true;         // Show POC label

//--- Global variables
double top, bot, step, dist;
double levels[];
double volumes[];
double total_volumes[];
int poc_level_index;
double poc_level;
double va_total;
int up, down;


// Custom function to sum an array
double ArraySum(double &arr[])
{
   double sum = 0;
   for(int i = 0; i < ArraySize(arr); i++)
   {
      sum += arr[i];
   }
   return sum;
}
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   ArrayResize(levels, cnum + 1);
   ArrayResize(volumes, cnum * 2);
   ArrayResize(total_volumes, cnum);
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   //--- Calculate the highest and lowest prices for the given range
   top = iHigh(NULL, 0, bbars);
   bot = iLow(NULL, 0, bbars);
   step = (top - bot) / cnum;
   dist = (top - bot) / 500;

   //--- Fill levels
   for (int i = 0; i <= cnum; i++)
     {
      levels[i] = bot + step * i;
     }

   //--- Initialize volumes to zero
   ArrayFill(volumes, 0, ArraySize(volumes), 0.0);


//--- Corrected variables
string symbol = Symbol();           // Current symbol (EURUSD, etc.)


   //--- Calculate volumes for each level
   for (int bar = 0; bar < bbars; bar++)
     {
   // Get the open, close, high, low, and volume for the specific bar
   double open_price = iOpen(symbol, PERIOD_CURRENT, bar);
   double close_price = iClose(symbol, PERIOD_CURRENT, bar);
   double high_price = iHigh(symbol, PERIOD_CURRENT, bar);
   double low_price = iLow(symbol, PERIOD_CURRENT, bar);
   double volume = iVolume(symbol, PERIOD_CURRENT, bar);

   // Calculate the top and bottom of the candle body
   double body_top = MathMax(close_price, open_price);
   double body_bot = MathMin(close_price, open_price);

   // Calculate wick volumes
   double topwickvol = (high_price - body_top) * volume;
   double bottomwickvol = (body_bot - low_price) * volume;

      //--- Calculate volume for each price level
      for (int i = 0; i < cnum; i++)
        {
         if (body_bot < levels[i + 1] && body_top > levels[i])
           {
            volumes[i] += iVolume(symbol, PERIOD_CURRENT, bar);;
           }
        }
     }

   //--- Calculate total volumes and POC
   ArrayFill(total_volumes, 0, ArraySize(total_volumes), 0.0);
   for (int i = 0; i < cnum; i++)
     {
      total_volumes[i] = volumes[i] + volumes[i + cnum];
     }

   //--- Calculate POC level
   poc_level_index = ArrayMaximum(total_volumes);
   poc_level = (levels[poc_level_index] + levels[poc_level_index + 1]) / 2;

   //--- Draw POC line
   if (show_poc)
     {
      ObjectCreate(0, "POC_Line", OBJ_TREND, 0, iTime(_Symbol,PERIOD_CURRENT,bbars), poc_level, iTime(_Symbol,PERIOD_CURRENT,0), poc_level);
      ObjectSetInteger(0, "POC_Line", OBJPROP_COLOR, poc_color);
      ObjectSetInteger(0, "POC_Line", OBJPROP_WIDTH, poc_width);
     }

   //--- Value Area calculation
   va_total = total_volumes[poc_level_index];
   up = poc_level_index;
   down = poc_level_index;

   while (va_total < (ArraySum(total_volumes) * percent / 100.0))
     {
      if (up < cnum - 1)
        {
         va_total += total_volumes[++up];
        }
      if (down > 0)
        {
         va_total += total_volumes[--down];
        }
     }

   //--- Draw volume profile bars
   for (int i = 0; i < cnum; i++)
     {
      string box_name = "Vol_Box_" + IntegerToString(i);
      double box_top = levels[i + 1];
      double box_bottom = levels[i];
      double vol_size = volumes[i] / ArrayMaximum(volumes) * bbars / 3.0;
      
      ObjectCreate(0, box_name, OBJ_RECTANGLE, 0,iTime(_Symbol,PERIOD_CURRENT,bbars), box_top, iTime(_Symbol,PERIOD_CURRENT,bbars) + vol_size, box_bottom);
      ObjectSetInteger(0, box_name, OBJPROP_COLOR, i >= down && i <= up ? vup_color : up_color);
     }
  }
