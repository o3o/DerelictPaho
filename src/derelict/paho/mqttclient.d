module derelict.paho.mqttclient;

import derelict.paho.types;

private {
   import derelict.util.loader;
   import derelict.util.system;
   import derelict.util.exception;

   static if (Derelict_OS_Windows) {
      enum libNames = "libpaho-mqtt3c.dll";
   } else static if (Derelict_OS_Posix) {
      enum libNames = "libpaho-mqtt3c.so";
   } else {
      static assert(0, "Need to implement paho-mqtt libNames for this operating system." );
   }
}


extern(C) nothrow {
   alias da_MQTTClient_create = int function(MQTTClient*, char*, char*, int, void*);
}


__gshared {
   da_MQTTClient_create MQTTClient_create;
}

class DerelictPahoMQTTClientLoader: SharedLibLoader {
   public this() {
      super(libNames);
   }

   protected override void loadSymbols() {
      bindFunc( cast( void** )&MQTTClient_create, "MQTTClient_create" );
   }
}

__gshared DerelictPahoMQTTClientLoader DerelictPahoMQTTClient;

shared static this() {
   DerelictPahoMQTTClient = new DerelictPahoMQTTClientLoader;
}
