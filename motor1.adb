with Ada.Real_Time; use ada.real_time;
with UART; use UART;
with System.storage_elements;


package body motor1 is
   
   
   
   P8LD: GPIO_motor;
   v1, v2 : boolean := TRUE;
   
  
   for P8LD'address use system.storage_elements.To_address(16#40000000#);

   procedure avance_linea_recta is
      
   begin
      P8LD.control:=0;
      P8Ld.data.sentidoI := adelante;
      P8Ld.data.sentidoD := adelante;
      v1:= TRUE;
      v2:= TRUE;
   end avance_linea_recta;
   
     
   
   procedure para is
   begin
      P8Ld.data.sentidoI := parado;
      P8Ld.data.sentidoD := parado;
      v1:= FALSE;
      v2:= FALSE;
   end para;
   
   procedure giro_derecha is
   begin
      P8Ld.data.sentidoI := adelante;
      P8Ld.data.sentidoD := adelante;
      v1:= FALSE;
      v2:= TRUE;
   end giro_derecha;
   
   procedure giro_izquierda is
   begin
      P8Ld.data.sentidoI := adelante;
      P8Ld.data.sentidoD := adelante;
      v1:= TRUE;
      v2:= FALSE;
   end giro_izquierda;
   
    

   task body punto2 is
      x, y: Time_Span;
      
   begin
      x := To_Time_Span(1.0);
      y := To_Time_Span(0.1);
      Put("Hola");
      
      loop
         avance_linea_recta;
         P8Ld.data.pwmi := v1;
         P8Ld.data.pwmd := v2;
         Put("ON - ");
         delay to_duration(y);
         Put("OFF - ");
         para;
         P8Ld.data.pwmi := v1;
         P8Ld.data.pwmd := v2;
         delay to_duration(x - y);
         
         
         giro_derecha;
         P8Ld.data.pwmi := v1;
         P8Ld.data.pwmd := v2;
         Put("ON - ");
         delay to_duration(y);
         Put("OFF - ");
         para;
         P8Ld.data.pwmi := v1;
         P8Ld.data.pwmd := v2;
         delay to_duration(x - y);
         
         
         giro_derecha;
         P8Ld.data.pwmi := v1;
         P8Ld.data.pwmd := v2;
         Put("ON - ");
         delay to_duration(y);
         Put("OFF - ");
         para;
         P8Ld.data.pwmi := v1;
         P8Ld.data.pwmd := v2;
         delay to_duration(x - y);
         
         
         --  avance_linea_recta;
         --  P8Ld.data.pwmi := v1;
         --  P8Ld.data.pwmd := v2;
         --  Put("recto - ");
         --  delay to_duration(x - y);
         --  giro_izquierda;
         --  P8Ld.data.pwmi := v1;
         --  P8Ld.data.pwmd := v2;
         --  Put("izquierda - ");
         --  delay to_duration(x - y);
         --  giro_derecha;
         --  P8Ld.data.pwmi := v1;
         --  P8Ld.data.pwmd := v2;
         --  Put("derecha - ");
         --  delay to_duration(x - y);
      end loop;
      
      
   end punto2;  
   
   

end motor1;
