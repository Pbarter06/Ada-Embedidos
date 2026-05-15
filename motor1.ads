package motor1 is
   
   --  type LedState is (Off, On);
   --  for LedState use ( Off => 2#0#, On => 2#1#);
   --  for LedState 'Size use 1;

   --  type Izquierda is record
   --     led1 : LedState;
   --     led2 : LedState;
   --  end record;
   --  
   --   for Izquierda use record
   --     led1 at 0 range 1..1;
   --     led2 at 0 range 2..2;
   --  end record;
   --  
   --  
   --  type Derecha is record
   --     led5 : LedState;
   --     led6 : LedState;
   --  end record;
   --  
   --  for Derecha use record
   --     led5 at 0 range 5..5;
   --     led6 at 0 range 6..6;
   --  end record;
   
   type sentido is (parado, atras, adelante);
   for sentido use (
                    parado=>2#00#,
                    atras=>2#01#,
                    adelante=>2#10#);
   for sentido'Size use 2;
   
   
   
   type datos is record
      pwmi:Boolean;
      pwmd: Boolean;
      sentidoD: sentido;
      sentidoI:sentido;
   end record;
   
   for datos use record
      pwmi at 0 range 0..0;
      pwmd at 0 range 4..4;
      sentidoD at 0 range 5..6;
      sentidoI at 0 range 1..2;
   end record;
   
   type GPIO_motor is record
      data: datos;
      control: integer;
   end record;
      

   procedure avance_linea_recta;
   
   procedure para;
   
   procedure giro_izquierda;
   
   procedure giro_derecha;
   
   task punto2;

end motor1;
