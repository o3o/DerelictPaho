import derelict.paho;
import std.string;
import std.stdio;

int main(string[] args) {
   DerelictPahoMQTTClient.load();

   enum ADDRESS ="tcp://localhost:1883";
   enum CLIENTID ="ExampleClientPub";
   enum TOPIC = "MQTT Examples";
   enum PAYLOAD = "Hello World!";
   enum QOS = 1;
   enum TIMEOUT= 10000L;


   MQTTClient client;
   MQTTClient_connectOptions conn_opts;
   MQTTClient_message pubmsg;
   MQTTClient_deliveryToken token;
   int rc = 0;

   MQTTClient_create(&client, toStringz(ADDRESS), toStringz(CLIENTID), MQTTCLIENT_PERSISTENCE_NONE, null);
   conn_opts.keepAliveInterval = 20;
   conn_opts.cleansession = 1;

   if ((rc = MQTTClient_connect(client, &conn_opts)) != MQTTCLIENT_SUCCESS) {
      writefln("Failed to connect, return code %d\n", rc);
   } else {
         pubmsg.payload = PAYLOAD;
         pubmsg.payloadlen = strlen(PAYLOAD);
      /*
         pubmsg.qos = QOS;
         pubmsg.retained = 0;
         MQTTClient_publishMessage(client, TOPIC, &pubmsg, &token);
         printf("Waiting for up to %d seconds for publication of %s\n"
         "on topic %s for client with ClientID: %s\n",
         (int)(TIMEOUT/1000), PAYLOAD, TOPIC, CLIENTID);
         rc = MQTTClient_waitForCompletion(client, token, TIMEOUT);
         printf("Message with delivery token %d delivered\n", token);
         MQTTClient_disconnect(client, 10000);
         MQTTClient_destroy(&client);
       */
   }
   return rc;
}
