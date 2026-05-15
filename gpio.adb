with ada.Real_Time; use ada.Real_Time;
with uart;use uart;

package body GPIO is

   BTN: GPIO_BTN;
   for BTN'address use system.storage_elements.To_address(16#41200000#);

   RGB: GPIO_RGB;
   for RGB'address use system.storage_elements.To_address(16#41210000#);


   procedure Init is
   begin
      RGB.control:=0; --out
      BTN.control:=1; --in
   end Init;

   
   function ReadButton0 return Boolean is 
   begin 
      if BTN.datos.btn0 = On then 
         return True;
      else
         return False;
      end if;
   end ReadButton0;
   
   function ReadButton1 return Boolean is 
   begin 
      if BTN.datos.btn1 = On then 
         return True;
      else
         return False;
      end if;
   end ReadButton1;
   
   procedure EnciendeRGB (color1, color2: RGBtype) is
   begin
      RGB.datos.rgbColor0:=color1;
      RGB.datos.rgbColor1:=color2;

   end EnciendeRGB;
   


   
end GPIO;
