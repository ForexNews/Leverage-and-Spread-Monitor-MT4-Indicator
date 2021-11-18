# Leverage and Spread Monitor Indicator
![Leverage and Spread Check MT4 Indicator Screen](https://forexnew.org/Download/check-leverage-spread-indicator.png)
- Combination of leverage and spread indicator.
- Tools for automating checking the leverage and spread on your trading account.
- Coding for MetaTrader 4 platform and all broker forex.
- Useful to monitor, if broker forex changing leverage, and spread during the economic news announcements.
- Real-time spread checking of the current symbol.
- Real-time leverage checking of trading account.
 
## Inputs Parameter
![Leverage and Spread Check MT4 Indicator Input](https://forexnew.org/Download/check-leverage-spread-input.png)
- Text Size : 9
- Text Color : MintCream
- Panel Color : SteelBlue
- Panel Width : 155
- Panel Height : 65

## Formula
- Current spread = [Ask Price - Bid Price]

## More Information
- If you looking for the broker forex spread comparison table.
- Please try to visit this page: [Broker Forex Reviews](https://forexnew.org/โบรกเกอร์-forex/)

### MQL4 Code

```
#property copyright    "ForexNew.org Opensource"
#property link         "https://forexnew.org/"
#property version      "1.0"
#property description  "- Leverage and Spread Monitor"
#property description  "- Indicator for Metatrader 4"
#property strict
#property indicator_chart_window

extern int Text_Size=9;  // Text Size
extern color Text_Color=MintCream;  // Text Color
extern color Panel_Color=SteelBlue;  // Panel Color
extern int Panel_Width=155;  // Panel Width
extern int Panel_Height=65;  // Panel Height
string Font_Setting="Arial Black";

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
   int leverage = AccountLeverage();
   int spread = MarketInfo( _Symbol, MODE_SPREAD );
   
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
   
   ObjectCreate("Leverage_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Leverage_Label", OBJPROP_CORNER, 0);
   ObjectSet("Leverage_Label", OBJPROP_XDISTANCE, 25);
   ObjectSet("Leverage_Label", OBJPROP_YDISTANCE, 35);
   ObjectSetText("Leverage_Label", "Leverage = 1:"+leverage, Text_Size, Font_Setting, Text_Color);
   ObjectSet("Leverage_Label", OBJPROP_SELECTABLE, false);
   ObjectSet("Leverage_Label", OBJPROP_HIDDEN, true);
         
   ObjectCreate("Spread_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Spread_Label", OBJPROP_CORNER, 0);
   ObjectSet("Spread_Label", OBJPROP_XDISTANCE, 25);
   ObjectSet("Spread_Label", OBJPROP_YDISTANCE, 60);
   ObjectSetText("Spread_Label", "Spread = "+spread+" Points", Text_Size, Font_Setting, Text_Color);
   ObjectSet("Spread_Label", OBJPROP_SELECTABLE, false);
   ObjectSet("Spread_Label", OBJPROP_HIDDEN, true);
   
   ObjectCreate("Custom_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Custom_Label","Copyright: ForexNew.org - Free Opensource",9, "Arial", DeepSkyBlue);
   ObjectSet("Custom_Label", OBJPROP_CORNER, 2);
   ObjectSet("Custom_Label", OBJPROP_XDISTANCE, 10);
   ObjectSet("Custom_Label", OBJPROP_YDISTANCE, 10);
   ObjectSet("Custom_Label", OBJPROP_SELECTABLE, false);
   ObjectSet("Custom_Label", OBJPROP_HIDDEN, true);
   WindowRedraw();
}

// Delete panel and text label when removing the indicator //
void OnDeinit(const int reason)
{
   ObjectsDeleteAll(0,"Main_Panel");
   ObjectsDeleteAll(0,"Leverage_Label");
   ObjectsDeleteAll(0,"Spread_Label");
   ObjectsDeleteAll(0,"Custom_Label");
}
```
#### Visit our website
- [ForexNew.org](https://forexnew.org/)
