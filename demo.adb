with UART; use UART;
with Ada.Real_Time; use ada.real_time;
with gpio; use gpio;
with motor1; use motor1;
with System.Multiprocessors;use System.Multiprocessors;

procedure Demo is

   --btn0, btn1: boolean:= false;
   
   --v1,v2:Boolean;
   
   --P8LD: GPIO_motor;
   
   
 
   
   
begin
    -- UART0 => Cora board

   InitUART(nUart => 0);
  
   Init;
   init_sensor;
   --Put("HOLA");
 --    loop
 --  btn0:=ReadButton0;
 --  btn1:=ReadButton1;
 --  
 --  if btn0=false and btn1=false then
 --  	EnciendeRGB(red, red);
 --  elsif btn0=false and btn1=true then
 --  	EnciendeRGB(green, green);
 --  elsif btn0=true and btn1=false then
 --  	EnciendeRGB(blue, blue);
 --  else
 --  	EnciendeRGB(violet, violet);
 --  end if;
 --  
 --       delay 0.25;
 --  
 --    end loop;
 
   avance_linea_recta;
   delay 400.0;
   

   
   
   
   
delay until Ada.Real_Time.Time_Last;
   
end Demo;
