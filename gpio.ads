with System.storage_elements;
with System.Multiprocessors;
use System.Multiprocessors;

package GPIO is

   --botones
   type ButtonState is (Off, On);
   for ButtonState use ( Off => 2#0#, On => 2#1#);
   for ButtonState 'Size use 1;

   type Ctrl_BTN is record
      btn0 : ButtonState;
      btn1 : ButtonState;
   end record;

   for Ctrl_BTN use record
      btn0 at 0 range 0..0;
      btn1 at 0 range 1..1;
   end record;

   type GPIO_BTN is record
      datos : Ctrl_BTN;
      control : Integer;
   end record;


   --leds GRB
   type RGBtype is (off, red, green, blue, violet);
   for RGBtype use (
                    off=>2#000#,
                    red=>2#001#,
                    green=>2#010#,
                    blue=>2#100#,
                    violet=>2#101#);
   for RGBtype'Size use 3;

   type Ctrl_RGB is record
      rgbColor0:RGBtype;
      rgbColor1:RGBtype;
   end record;

   for Ctrl_RGB use record
      rgbColor0 at 0 range 0..2;
      rgbColor1 at 0 range 3..5;
   end record;

   type GPIO_RGB is record
      datos:Ctrl_RGB;
      control: integer;
   end record;

procedure Init;
function ReadButton0 return Boolean;
function ReadButton1 return Boolean;
procedure EnciendeRGB (color1, color2: RGBtype);

end GPIO;
