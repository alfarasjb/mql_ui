

class CChartObject{

   protected:
   
      string               Modify_Name;
      
   private:
   
      void     Name(string name) { Modify_Name = name; }
      string   Name()            { return Modify_Name; }
      
   public:
      
      int                  DefScaleFactor;
      
      // PROPERTIES
      string               DefFontStyle, DefFontStyleBold;
      
      int                  DefLineWidth, DefX, DefY, DefFontSize;
      
      bool                 DefRay, DefHidden, DefBack, DefSelectable;
      long                 DefZOrder;
      
      ENUM_BASE_CORNER     DefCorner;
      ENUM_BORDER_TYPE     DefBorderType;
      ENUM_LINE_STYLE      DefLineStyle;
      ENUM_ANCHOR_POINT    DefAnchor;
      ENUM_ALIGN_MODE      DefAlign;
      
      color                DefButtonTextColor, DefButtonBordColor, DefLineColor, DefFontColor, DefBGColor, DefButtonBGColor, DefBorderColor;
     
      // SETTER
      bool     LINE_COLOR(color line_color);
      bool     LINE_STYLE(ENUM_LINE_STYLE line_style);
      bool     RAY(bool ray);
      bool     HIDDEN(bool hidden);
      bool     SELECTABLE(bool selectable);
      bool     WIDTH(int width);
      bool     BORDER_TYPE(ENUM_BORDER_TYPE border_type);
      bool     BACK(bool back);
      bool     XDIST(int x_dist);
      bool     YDIST(int y_dist);
      bool     XSIZE(int x_size); // X SIZE
      bool     YSIZE(int y_size); // Y SIZE
      bool     CORNER(ENUM_BASE_CORNER corner); // CORNER
      bool     BG_COLOR(color bg_color); // BG COLOR
      bool     BORDER_COLOR(color border_color); // BORDER COLOR 
      bool     FONT_SIZE(int font_size); // FONTSIZE
      bool     TEXT (string text); // TEXT
      bool     ANCHOR(ENUM_ANCHOR_POINT anchor);
      bool     FONT_STYLE(string font_style);
      bool     Z_ORDER(long z_order);
      bool     ALIGN(ENUM_ALIGN_MODE align);
      bool     STATE(bool state);
      bool     READ_ONLY(bool read_only);
      
      // UTILITY
      int      scale(int size) { return (size * DefScaleFactor) / 100 ; }
      
      
      // constructor
      void     CChartObject();
      
      void     CTrend(string name, double price, datetime start_date, datetime end_date, ENUM_LINE_STYLE line_style, color line_color, int width = NULL, bool hidden = NULL, bool ray = NULL, bool selectable = NULL);
      
      void     CRectLabel(string name, int x, int y, int width, int height, 
                  color bg_color = clrBlack, color border_color = clrGray, 
                  ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, ENUM_BORDER_TYPE border_type = BORDER_RAISED, 
                  ENUM_LINE_STYLE line_style = STYLE_SOLID, int line_width = 1, 
                  bool back = false, bool selectable = false, bool hidden = true);
                  
      void     CTextLabel(string name, int x, int y, string label_text, int font_size = 8, string font_style = "Calibri", color font_color = clrWhite, ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, 
                  ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT, bool back = false, bool selectable = false, bool hidden = true);
                  
      void     CEdit(string name, int x, int y, int width, int height, string label_text, int font_size, string font_style, color font_color, color bg_color, color border_color, bool read_only,
                  ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, ENUM_ALIGN_MODE align = ALIGN_CENTER, bool back = false, bool hidden = true);
                  
      void     CButton(string name, int x, int y, int width, int height, int font_size, string font_style, string text, color font_color = clrWhite, color bg_color = clrGray, color border_color = clrGray,
                  ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, bool hidden = true, long z_order = 0, bool state = NULL);
};

CChartObject::CChartObject(void){

   int APP_SCREEN_DPI = TerminalInfoInteger(TERMINAL_SCREEN_DPI);
   DefScaleFactor    = (APP_SCREEN_DPI * 100) / 96;
   DefFontStyle      = "Calibri";
   DefFontStyleBold  = "Calibri";
   
   DefLineWidth      = 1;
   DefX              = 10;
   DefY              = 150;
   DefFontSize       = 8;
   
   DefRay            = false;
   DefHidden         = true;
   DefBack           = false;
   DefSelectable     = false;
   DefZOrder         = 0; 
   
   DefCorner         = CORNER_LEFT_LOWER;
   DefBorderType     = BORDER_RAISED;
   DefLineStyle      = STYLE_SOLID;
   DefAnchor         = ANCHOR_LEFT;
   DefAlign          = ALIGN_CENTER;
   
   DefLineColor      = clrRed;
   DefFontColor      = clrWhite;
   DefBGColor        = clrBlack;
   DefBorderColor    = clrGray;
}

void CChartObject::CTrend(
   string name, 
   double price, 
   datetime start_date, 
   datetime end_date, 
   ENUM_LINE_STYLE line_style, 
   color line_color, 
   int width = NULL, 
   bool hidden = NULL, 
   bool ray = NULL, 
   bool selectable = NULL){
   
   
   
   Name(name);  
   
   if (ObjectFind(name) < 0) bool ret = ObjectCreate(0, name, OBJ_TREND, 0, start_date, price, end_date, price);
   LINE_STYLE(line_style);
   LINE_COLOR(line_color);
   
   if (width != NULL)      WIDTH(width);
   if (hidden != NULL)     HIDDEN(hidden);
   if (ray != NULL)        RAY(ray);
   if (selectable != NULL) SELECTABLE(selectable);
 }
   
void CChartObject::CRectLabel(
   string name, 
   int x, 
   int y, 
   int width, 
   int height, 
   color bg_color = clrBlack, 
   color border_color = clrGray, 
   ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, 
   ENUM_BORDER_TYPE border_type = BORDER_RAISED, 
   ENUM_LINE_STYLE line_style = STYLE_SOLID, 
   int line_width = 1, 
   bool back = false, 
   bool selectable = false, 
   bool hidden = true){
   
   Name(name);
   
   if (ObjectFind(name) < 0) bool ret = ObjectCreate(0, name, OBJ_RECTANGLE_LABEL, 0, 0, 0);
   
   XDIST(x);   
   XSIZE(width);
   YDIST(y);
   YSIZE(height);
   CORNER(corner);
   BG_COLOR(bg_color);
   BORDER_TYPE(border_type);
   LINE_STYLE(line_style);
   WIDTH(line_width);
   BACK(back);
   SELECTABLE(selectable);
   HIDDEN(hidden);
}

void CChartObject::CTextLabel(
   string name, 
   int x, 
   int y, 
   string label_text, 
   int font_size = 8, 
   string font_style = "Calibri", 
   color font_color = clrWhite, 
   ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, 
   ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT, 
   bool back = false, 
   bool selectable = false, 
   bool hidden = true){
   
   Name(name);
   
   if (ObjectFind(name) < 0) bool ret = ObjectCreate(0, name, OBJ_LABEL, 0, 0, 0);
   
   XDIST(x);
   YDIST(y);
   CORNER(corner);
   FONT_SIZE(font_size);
   TEXT(label_text);
   FONT_STYLE(font_style);
   LINE_COLOR(font_color);
   ANCHOR(anchor);
   BACK(back);
   SELECTABLE(selectable);
   HIDDEN(hidden);
}

void CChartObject::CEdit(
   string name, 
   int x, 
   int y, 
   int width, 
   int height, 
   string label_text, 
   int font_size, 
   string font_style,
   color font_color, 
   color bg_color,
   color border_color, 
   bool read_only,
   ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, 
   ENUM_ALIGN_MODE align = ALIGN_CENTER, 
   bool back = false, 
   bool hidden = true){

   Name(name);
   
   if (ObjectFind(name) < 0) bool ret = ObjectCreate(0, name, OBJ_EDIT, 0, 0, 0);
   
   XDIST(x);
   YDIST(y);
   XSIZE(width);
   YSIZE(height);
   CORNER(corner);
   FONT_SIZE(font_size);
   FONT_STYLE(font_style);
   TEXT(label_text);
   ALIGN(align);
   LINE_COLOR(font_color);
   BG_COLOR(bg_color);
   BORDER_COLOR(border_color);
   BACK(back);
   HIDDEN(hidden);
   READ_ONLY(read_only);   
}
                  
void CChartObject:: CButton(
   string name, 
   int x, 
   int y, 
   int width, 
   int height, 
   int font_size, 
   string font_style,
   string text, 
   color font_color = clrWhite, 
   color bg_color = clrGray, 
   color border_color = clrGray,
   ENUM_BASE_CORNER corner = CORNER_LEFT_LOWER, 
   bool hidden = true, 
   long z_order = 0, 
   bool state = NULL){

   Name(name);
   
   if (ObjectFind(0, name) < 0) bool ret = ObjectCreate(0, name, OBJ_BUTTON, 0, 0, 0);
   
   XDIST(x);
   YDIST(y);
   XSIZE(width);
   YSIZE(height); 
   CORNER(corner);
   FONT_SIZE(font_size);
   FONT_STYLE(font_style);
   TEXT(text);
   LINE_COLOR(font_color);
   BG_COLOR(bg_color);
   BORDER_COLOR(border_color);
   HIDDEN(hidden);
   Z_ORDER(z_order);
   if (state != NULL) STATE(state);
      
   
}
   
   
bool CChartObject::LINE_COLOR(color line_color)                   { return ObjectSetInteger(0, Name(), OBJPROP_COLOR, line_color); }
bool CChartObject::BG_COLOR(color bg_color)                       { return ObjectSetInteger(0, Name(), OBJPROP_BGCOLOR, bg_color); }
bool CChartObject::BORDER_COLOR(color border_color)               { return ObjectSetInteger(0, Name(), OBJPROP_BORDER_COLOR, border_color); }
bool CChartObject::LINE_STYLE(ENUM_LINE_STYLE line_style)         { return ObjectSetInteger(0, Name(), OBJPROP_STYLE, line_style); }
bool CChartObject::BORDER_TYPE(ENUM_BORDER_TYPE border_type)      { return ObjectSetInteger(0, Name(), OBJPROP_BORDER_TYPE, border_type); }
bool CChartObject::CORNER(ENUM_BASE_CORNER corner)                { return ObjectSetInteger(0, Name(), OBJPROP_CORNER, corner); }
bool CChartObject::ANCHOR(ENUM_ANCHOR_POINT anchor)               { return ObjectSetInteger(0, Name(), OBJPROP_ANCHOR, anchor); }
bool CChartObject::ALIGN(ENUM_ALIGN_MODE align)                   { return ObjectSetInteger(0, Name(), OBJPROP_ALIGN, align); }
bool CChartObject::WIDTH(int width)                               { return ObjectSetInteger(0, Name(), OBJPROP_WIDTH, width); }        
bool CChartObject::XDIST(int x_dist)                              { return ObjectSetInteger(0, Name(), OBJPROP_XDISTANCE, scale(x_dist)); }     
bool CChartObject::YDIST(int y_dist)                              { return ObjectSetInteger(0, Name(), OBJPROP_YDISTANCE, scale(y_dist)); }
bool CChartObject::XSIZE(int x_size)                              { return ObjectSetInteger(0, Name(), OBJPROP_XSIZE, scale(x_size)); }
bool CChartObject::YSIZE(int y_size)                              { return ObjectSetInteger(0, Name(), OBJPROP_YSIZE, scale(y_size)); }
bool CChartObject::FONT_SIZE(int font_size)                       { return ObjectSetInteger(0, Name(), OBJPROP_FONTSIZE, font_size); }
bool CChartObject::TEXT (string text)                             { return ObjectSetString(0, Name(), OBJPROP_TEXT, text); }
bool CChartObject::FONT_STYLE(string font_style)                  { return ObjectSetString(0, Name(), OBJPROP_FONT, font_style); }
bool CChartObject::Z_ORDER(long z_order)                          { return ObjectSetInteger(0, Name(), OBJPROP_ZORDER, z_order); }
bool CChartObject::STATE(bool state)                              { return ObjectSetInteger(0, Name(), OBJPROP_STATE, state); }
bool CChartObject::READ_ONLY(bool read_only)                      { return ObjectSetInteger(0, Name(), OBJPROP_READONLY, read_only); }
bool CChartObject::RAY(bool ray)                                  { return ObjectSetInteger(0, Name(), OBJPROP_RAY, ray); }
bool CChartObject::HIDDEN(bool hidden)                            { return ObjectSetInteger(0, Name(), OBJPROP_HIDDEN, hidden); }
bool CChartObject::SELECTABLE(bool selectable)                    { return ObjectSetInteger(0, Name(), OBJPROP_SELECTABLE, selectable); }
bool CChartObject::BACK(bool back)                                { return ObjectSetInteger(0, Name(), OBJPROP_BACK, back); }