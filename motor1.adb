with Ada.Real_Time; use ada.real_time;
with UART;          use UART;
with System.storage_elements;

package body motor1 is

   P8LD   : GPIO_motor;
   v1, v2 : boolean := TRUE;

   for P8LD'address use system.storage_elements.To_address (16#40000000#);

   -- PRACTICA 7

   SWT : GPIO_sensor;
   for SWT'address use system.storage_elements.To_address (16#40001000#);
    
   
   procedure init_sensor is
   begin
      SWT.control := 16#FF#;
   end init_sensor;
   
   procedure avance_linea_recta is

   begin
      P8LD.control := 0;
      P8Ld.data.sentidoI := adelante;
      P8Ld.data.sentidoD := adelante;
      v1 := TRUE;
      v2 := TRUE;
   end avance_linea_recta;

   procedure para is
   begin
      P8Ld.data.sentidoI := parado;
      P8Ld.data.sentidoD := parado;
      v1 := FALSE;
      v2 := FALSE;
   end para;

   procedure giro_derecha is
   begin
      P8Ld.data.sentidoI := adelante;
      P8Ld.data.sentidoD := adelante;
      v1 := FALSE;
      v2 := TRUE;
   end giro_derecha;

   procedure giro_izquierda is
   begin
      P8Ld.data.sentidoI := adelante;
      P8Ld.data.sentidoD := adelante;
      v1 := TRUE;
      v2 := FALSE;
   end giro_izquierda;

   --task body punto2 is
   --   x, y : Time_Span;
   --
   --begin
   --   x := To_Time_Span (1.0);
   --   y := To_Time_Span (0.1);
   --   Put ("Hola");
   --
   --   loop
   --      avance_linea_recta;
   --      P8Ld.data.pwmi := v1;
   --      P8Ld.data.pwmd := v2;
   --      Put ("ON - ");
   --      delay to_duration (y);
   --      Put ("OFF - ");
   --      para;
   --      P8Ld.data.pwmi := v1;
   --      P8Ld.data.pwmd := v2;
   --      delay to_duration (x - y);
   --
   --      Put ("Derecha - ");
   --      giro_derecha;
   --      P8Ld.data.pwmi := v1;
   --      P8Ld.data.pwmd := v2;
   --      Put ("ON - ");
   --      delay to_duration (y);
   --      Put ("OFF - ");
   --      para;
   --      P8Ld.data.pwmi := v1;
   --      P8Ld.data.pwmd := v2;
   --      delay to_duration (x - y);
   --
   --      Put ("Izquierda - ");
   --      giro_izquierda;
   --      P8Ld.data.pwmi := v1;
   --      P8Ld.data.pwmd := v2;
   --      Put ("ON - ");
   --      delay to_duration (y);
   --      Put ("OFF - ");
   --      para;
   --      P8Ld.data.pwmi := v1;
   --      P8Ld.data.pwmd := v2;
   --      delay to_duration (x - y);
   --
   --      --  avance_linea_recta;
   --      --  P8Ld.data.pwmi := v1;
   --      --  P8Ld.data.pwmd := v2;
   --      --  Put("recto - ");
   --      --  delay to_duration(x - y);
   --      --  giro_izquierda;
   --      --  P8Ld.data.pwmi := v1;
   --      --  P8Ld.data.pwmd := v2;
   --      --  Put("izquierda - ");
   --      --  delay to_duration(x - y);
   --      --  giro_derecha;
   --      --  P8Ld.data.pwmi := v1;
   --      --  P8Ld.data.pwmd := v2;
   --      --  Put("derecha - ");
   --      --  delay to_duration(x - y);
   --   end loop;
   --
   --end punto2;

   task body punto2 is
      Izq, Der : Boolean;
       x, y : Time_Span;
   begin
      SWT.control := 16#FF#;
      x := To_Time_Span (1.0);
      y := To_Time_Span (0.1);

      loop
         Izq := LeerSensorIzquierda;
         Der := LeerSensorDerecha;
         
         if not Izq and not Der then
            Put ("Sin obstaculos - adelante");
            avance_linea_recta;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
            delay to_duration (y);
            para;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
            delay to_duration(x - y);
   

         elsif not Izq and Der then
            Put ("Obstaculo derecha - giro izquierda");
            giro_derecha;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
            delay to_duration (y);
            para;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
            delay to_duration(x - y);

         elsif Izq and not Der then
            Put ("Obstaculo izquierda - giro derecha");
            giro_izquierda;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
            delay to_duration (y);
            para;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
            delay to_duration(x - y);

         else
            Put ("Obstaculo ambos sensores - parado");
            para;
            P8Ld.data.pwmi := v1;
            P8Ld.data.pwmd := v2;
         end if;

         P8LD.data.pwmi := v1;
         P8LD.data.pwmd := v2;
         

         delay 0.2;
      end loop;
   end punto2;

   function LeerSensorIzquierda return Boolean is
   begin
      return not SWT.data.izquierda;
   end LeerSensorIzquierda;

   function LeerSensorDerecha return Boolean is
   begin
      return not SWT.data.derecha;
   end LeerSensorDerecha;

end motor1;
