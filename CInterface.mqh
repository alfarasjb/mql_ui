
#include <B63/CChartObject.mqh>

struct Button{
   // use this for creating button objects
   string button_name;
   ENUM_ORDER_TYPE      button_order_type;
};

struct RectLabel{
   string rect_name;
};

struct Terminal{
   string terminal_name;
};



struct Toggle{
   string switch_name;
   string on_name;
   string off_name;
};

struct AdjustButton{
   string name;
   string parent;
   string function;
};

struct AdjustRow{
   string field_name;
   AdjustButton increment;
   AdjustButton decrement;
};

struct Edit{};

class CInterface:public CChartObject{
   protected:
   private:
   public:
      
      // ATTRIBUTES
      int                  UI_X, UI_Y, UI_WIDTH, UI_HEIGHT, UI_LINE_WIDTH;
      ENUM_BORDER_TYPE     UI_BORDER;
      color                UI_BG_COLOR, UI_SWITCH_ON, UI_SWITCH_OFF;
   
      CInterface();
      CInterface(int ui_x, int ui_y, int ui_width, int ui_height);
      
      // UI TERMINAL
      void        UI_Terminal(Terminal &terminal, string name);
      
      
      
      // ELEMENTS
      void        UI_Button(Button &button, string name, int x, int y_adjust, double width_factor, double height_factor, color button_color, string label_handle, string label_name, int label_adjust, int label_x_offset);
      void        UI_Switch(string name, int x, int y, int width, int height, bool state);
      void        UI_Row();
      void        UI_TextField();
      
      // EVENT HANDLING
      
      // UTILITIES
      void        UI_Reset_Object(string sparam);
      
};

CInterface::CInterface(void){}

CInterface::CInterface(int ui_x, int ui_y, int ui_width, int ui_height){
   UI_X = ui_x;
   UI_Y = ui_y;
   UI_WIDTH = 235;
   UI_HEIGHT = UI_Y - 5;
   
   UI_BORDER = BORDER_RAISED;
   UI_BG_COLOR = clrBlack;
   
}


void CInterface::UI_Terminal(Terminal &terminal, string name){
   /*
   Contains:
   1. Terminal Dimensions (x, y, height, width)
   2. Main Padding
   */
   terminal.terminal_name = name;
   Print("TERMINAL: ", name);
   CRectLabel(
      name,
      UI_X,
      UI_Y, 
      UI_WIDTH,
      UI_HEIGHT,
      UI_BG_COLOR
   );
}


void CInterface::UI_Button(Button &button, string name, int x, int y_adjust, double width_factor, double height_factor, color button_color, string label_handle, string label_name, int label_adjust, int label_x_offset){
   button.button_name = name;
   
   int DefButtonWidth = 105;
   int DefButtonHeight = 50; 
   int APP_YOffset = DefButtonHeight + UI_Y - 185;
   int OrdButtonYOffset = APP_YOffset - 13;
   
   int y = APP_YOffset - y_adjust;
   
   int width = (int)(DefButtonWidth * width_factor);
   int height = (int)(DefButtonHeight * height_factor);
   
   int label_offset = OrdButtonYOffset - label_adjust;
   
   long ZOrder = 5;
   
   CButton(name, x, y, width, height, DefFontSize, DefFontStyle, "");
   CTextLabel(label_handle, x + 10 + label_x_offset, label_offset, label_name, DefFontSize, DefFontStyle, DefFontColor);

}
void CInterface::UI_Switch(string name, int x, int y, int width, int height, bool state){
   string on_name = name + "ON";
   string off_name = name + "OFF";
   string off_text = " ";
   string on_text = " ";
   
   UI_SWITCH_ON = state ? clrWhite : clrDimGray;
   UI_SWITCH_OFF = state ? clrDodgerBlue : clrWhite;
   CButton(on_name, x + width - 2, y, width, height, DefFontSize, DefFontStyle, on_text, DefFontColor, UI_SWITCH_ON, DefBorderColor, DefCorner, DefHidden, DefZOrder, state);

   CButton(off_name, x, y, width, height, DefFontSize, DefFontStyle, off_text, DefFontColor, UI_SWITCH_OFF, DefBorderColor, DefCorner, DefHidden, DefZOrder, !state);
}

void CInterface::UI_Row(void){}

void CInterface::UI_TextField(void){}

void CInterface::UI_Reset_Object(string sparam){
   Sleep(50);
   ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
}