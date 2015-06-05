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
/*
   int 	MQTTClient_disconnect (MQTTClient handle, int timeout)
   int 	MQTTClient_isConnected (MQTTClient handle)
   int 	MQTTClient_subscribe (MQTTClient handle, char *topic, int qos)
   int 	MQTTClient_subscribeMany (MQTTClient handle, int count, char **topic, int *qos)
   int 	MQTTClient_unsubscribe (MQTTClient handle, char *topic)
   int 	MQTTClient_unsubscribeMany (MQTTClient handle, int count, char **topic)
   int 	MQTTClient_publish (MQTTClient handle, char *topicName, int payloadlen, void *payload, int qos, int retained, MQTTClient_deliveryToken *dt)
   int 	MQTTClient_publishMessage (MQTTClient handle, char *topicName, MQTTClient_message *msg, MQTTClient_deliveryToken *dt)
   int 	MQTTClient_waitForCompletion (MQTTClient handle, MQTTClient_deliveryToken dt, unsigned long timeout)
   int 	MQTTClient_getPendingDeliveryTokens (MQTTClient handle, MQTTClient_deliveryToken **tokens)
   void 	MQTTClient_yield (void)
   int 	MQTTClient_receive (MQTTClient handle, char **topicName, int *topicLen, MQTTClient_message **message, unsigned long timeout)
   void 	MQTTClient_freeMessage (MQTTClient_message **msg)
   void 	MQTTClient_free (void *ptr)
   void 	MQTTClient_destroy (MQTTClient *handle)
 */
extern(C) nothrow {
   alias da_MQTTClient_create = int function(MQTTClient*, const char*, const char*, int, void*);
   alias da_MQTTClient_connect = int function(MQTTClient handle, MQTTClient_connectOptions* options);
   alias da_MQTTClient_disconnect = int function(MQTTClient, int);
   alias da_MQTTClient_isConnected = int function(MQTTClient);
   alias da_MQTTClient_subscribe = int function(MQTTClient, char*, int);
   alias da_MQTTClient_subscribeMany = int function(MQTTClient, int, char**, int*);
   alias da_MQTTClient_unsubscribe = int function(MQTTClient, char*);
   alias da_MQTTClient_unsubscribeMany = int function(MQTTClient, int, char**);
   alias da_MQTTClient_publish = int function(MQTTClient, char*, int, void*, int, int, MQTTClient_deliveryToken*);
   alias da_MQTTClient_publishMessage = int function(MQTTClient, char*, MQTTClient_message*, MQTTClient_deliveryToken*);
   alias da_MQTTClient_waitForCompletion = int function(MQTTClient, MQTTClient_deliveryToken, ulong);
   alias da_MQTTClient_getPendingDeliveryTokens = int	function(MQTTClient, MQTTClient_deliveryToken**);
   alias da_MQTTClient_yield = void function();
   alias da_MQTTClient_receive = int function(MQTTClient, char**, int*, MQTTClient_message**, ulong);
   alias da_MQTTClient_freeMessage = void function(MQTTClient_message**);
   alias da_MQTTClient_free = void function(void*);
   alias da_MQTTClient_destroy = void function(MQTTClient*);
}

__gshared {
   da_MQTTClient_create MQTTClient_create;
   da_MQTTClient_connect MQTTClient_connect;
   da_MQTTClient_disconnect MQTTClient_disconnect;
   da_MQTTClient_isConnected MQTTClient_isConnected;
   da_MQTTClient_subscribe MQTTClient_subscribe;
   da_MQTTClient_subscribeMany MQTTClient_subscribeMany;
   da_MQTTClient_unsubscribe MQTTClient_unsubscribe;
   da_MQTTClient_unsubscribeMany MQTTClient_unsubscribeMany;
   da_MQTTClient_publish MQTTClient_publish;
   da_MQTTClient_publishMessage MQTTClient_publishMessage;
   da_MQTTClient_waitForCompletion MQTTClient_waitForCompletion;
   da_MQTTClient_getPendingDeliveryTokens MQTTClient_getPendingDeliveryTokens;
   da_MQTTClient_yield MQTTClient_yield;
   da_MQTTClient_receive MQTTClient_receive;
   da_MQTTClient_freeMessage MQTTClient_freeMessage;
   da_MQTTClient_free MQTTClient_free;
   da_MQTTClient_destroy MQTTClient_destroy;
}

class DerelictPahoMQTTClientLoader: SharedLibLoader {
   public this() {
      super(libNames);
   }

   protected override void loadSymbols() {
      bindFunc( cast( void** )&MQTTClient_create, "MQTTClient_create" );
      bindFunc( cast( void** )&MQTTClient_disconnect,"MQTTClient_disconnect");
      bindFunc( cast( void** )&MQTTClient_isConnected, "MQTTClient_isConnected");
      bindFunc( cast( void** )&MQTTClient_subscribe, "MQTTClient_subscribe");
      bindFunc( cast( void** )&MQTTClient_subscribeMany, "MQTTClient_subscribeMany");
      bindFunc( cast( void** )&MQTTClient_unsubscribe, "MQTTClient_unsubscribe");
      bindFunc( cast( void** )&MQTTClient_unsubscribeMany, "MQTTClient_unsubscribeMany");
      bindFunc( cast( void** )&MQTTClient_publish, "MQTTClient_publish");
      bindFunc( cast( void** )&MQTTClient_publishMessage, "MQTTClient_publishMessage");
      bindFunc( cast( void** )&MQTTClient_waitForCompletion, "MQTTClient_waitForCompletion");
      bindFunc( cast( void** )&MQTTClient_getPendingDeliveryTokens, "MQTTClient_getPendingDeliveryTokens");
      bindFunc( cast( void** )&MQTTClient_yield, "MQTTClient_yield");
      bindFunc( cast( void** )&MQTTClient_receive, "MQTTClient_receive");
      bindFunc( cast( void** )&MQTTClient_freeMessage, "MQTTClient_freeMessage");
      bindFunc( cast( void** )&MQTTClient_free, "MQTTClient_free");
      bindFunc( cast( void** )&MQTTClient_destroy, "MQTTClient_destroy");
   }
}

__gshared DerelictPahoMQTTClientLoader DerelictPahoMQTTClient;

shared static this() {
   DerelictPahoMQTTClient = new DerelictPahoMQTTClientLoader;
}
