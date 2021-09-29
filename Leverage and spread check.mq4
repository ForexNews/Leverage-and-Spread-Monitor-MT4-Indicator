#property copyright    "ForexNew.org Opensource"
#property link         "https://forexnew.org/"
#property version      "1.00"
#property description  "Check Leverage and Spread For MetaTrader 4"
#property strict
#property indicator_chart_window

extern int Text_Size=9;  // Text Size
extern color Text_Color=MintCream;  // Text Color
extern color Panel_Color=SteelBlue;  // Panel Color
extern int Panel_Width=155;  // Panel Width
extern int Panel_Height=65;  // Panel Height
string Font_Setting="Arial Black";
double point;

int init()
{
   Check_Leverage_Spread();
   return(INIT_SUCCEEDED);
}

int start()
{
   Check_Leverage_Spread();
   return(INIT_SUCCEEDED);
}

void Check_Leverage_Spread()
{
   int    leverage = AccountLeverage();
   int    spread = MarketInfo( _Symbol, MODE_SPREAD );
   
 // Create panel and text Label on the screen //
      ObjectCreate("Main_Panel",OBJ_RECTANGLE_LABEL,0,0,0,0,0,0);
      ObjectSet("Main_Panel",OBJPROP_BGCOLOR,Panel_Color);
      ObjectSet("Main_Panel",OBJPROP_CORNER,0);
      ObjectSet("Main_Panel",OBJPROP_BACK,true);
      ObjectSet("Main_Panel",OBJPROP_XDISTANCE,10);
      ObjectSet("Main_Panel",OBJPROP_YDISTANCE,25);
      ObjectSet("Main_Panel",OBJPROP_XSIZE,Panel_Width);
      ObjectSet("Main_Panel",OBJPROP_YSIZE,Panel_Height);
      ObjectSet("Main_Panel", OBJPROP_SELECTABLE, false);
      ObjectSet("Main_Panel", OBJPROP_HIDDEN, true);
   
 // Leverage Label //
      ObjectCreate("Leverage_Label", OBJ_LABEL, 0, 0, 0);
      ObjectSet("Leverage_Label", OBJPROP_CORNER, 0);
      ObjectSet("Leverage_Label", OBJPROP_XDISTANCE, 25);
      ObjectSet("Leverage_Label", OBJPROP_YDISTANCE, 35);
      ObjectSetText("Leverage_Label", "Leverage = 1:"+leverage, Text_Size, Font_Setting, Text_Color);
      ObjectSet("Leverage_Label", OBJPROP_SELECTABLE, false);
      ObjectSet("Leverage_Label", OBJPROP_HIDDEN, true);
      
// Spread Label //      
      ObjectCreate("Spread_Label", OBJ_LABEL, 0, 0, 0);
      ObjectSet("Spread_Label", OBJPROP_CORNER, 0);
      ObjectSet("Spread_Label", OBJPROP_XDISTANCE, 25);
      ObjectSet("Spread_Label", OBJPROP_YDISTANCE, 60);
      ObjectSetText("Spread_Label", "Spread = "+spread+" Points", Text_Size, Font_Setting, Text_Color);
      ObjectSet("Spread_Label", OBJPROP_SELECTABLE, false);
      ObjectSet("Spread_Label", OBJPROP_HIDDEN, true);
   
      WindowRedraw();
}


// Delete panel and text label when removing the indicator //
void OnDeinit(const int reason)
{
   ObjectsDeleteAll(0,"Main_Panel");
   ObjectsDeleteAll(0,"Leverage_Label");
   ObjectsDeleteAll(0,"Spread_Label");
}
