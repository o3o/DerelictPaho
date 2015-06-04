module derelict.paho.types;

public alias MQTTClient = void*;

/**
 * A structure representing the payload and attributes of an MQTT message. The
 * message topic is not part of this structure (see MQTTClient_publishMessage(),
 * MQTTClient_publish(), MQTTClient_receive(), MQTTClient_freeMessage()
 * and MQTTClient_messageArrived()).
 */
struct MQTTClient_message {
   /** The eyecatcher for this structure.  must be MQTM. */
   char[4] struct_id = ['M', 'Q', 'T', 'M'];
   /** The version number of this structure.  Must be 0 */
   int struct_version;
   /** The length of the MQTT message payload in bytes. */
   int payloadlen;
   /** A pointer to the payload of the MQTT message. */
   void* payload;
   /**
    * The quality of service (QoS) assigned to the message.
    */
   int qos;
   /**
    * The retained flag serves two purposes depending on whether the message
    * it is associated with is being published or received.
    */
   int retained;
   /**
    * The dup flag indicates whether or not this message is a duplicate.
    */
   int dup;
   /** The message identifier is normally reserved for internal use by the
    * MQTT client and server.
    */
   int msgid;
}

struct MQTTClient_connectOptions {
   /** The eyecatcher for this structure.  must be MQTC. */
   char[4] struct_id = ['M', 'Q', 'T', 'C'];
   /** The version number of this structure.  Must be 0, 1, 2, 3 or 4.
    * 0 signifies no SSL options and no serverURIs
    * 1 signifies no serverURIs
    * 2 signifies no MQTTVersion
    * 3 signifies no returned values
    */
   int struct_version;
   /** The "keep alive" interval, measured in seconds, defines the maximum time
    * that should pass without communication between the client and the server
    * The client will ensure that at least one message travels across the
    * network within each keep alive period.  In the absence of a data-related
    * message during the time period, the client sends a very small MQTT
    * "ping" message, which the server will acknowledge. The keep alive
    * interval enables the client to detect when the server is no longer
    * available without having to wait for the long TCP/IP timeout.
    */
   int keepAliveInterval;
   /**
    * This is a boolean value. The cleansession setting controls the behaviour
    * of both the client and the server at connection and disconnection time.
    * The client and server both maintain session state information. This
    * information is used to ensure "at least once" and "exactly once"
    * delivery, and "exactly once" receipt of messages. Session state also
    * includes subscriptions created by an MQTT client. You can choose to
    * maintain or discard state information between sessions.
    *
    * When cleansession is true, the state information is discarded at
    * connect and disconnect. Setting cleansession to false keeps the state
    * information. When you connect an MQTT client application with
    * MQTTClient_connect(), the client identifies the connection using the
    * client identifier and the address of the server. The server checks
    * whether session information for this client
    * has been saved from a previous connection to the server. If a previous
    * session still exists, and cleansession=true, then the previous session
    * information at the client and server is cleared. If cleansession=false,
    * the previous session is resumed. If no previous session exists, a new
    * session is started.
    */
   int cleansession;
   /**
    * This is a boolean value that controls how many messages can be in-flight
    * simultaneously. Setting <i>reliable</i> to true means that a published
    * message must be completed (acknowledgements received) before another
    * can be sent. Attempts to publish additional messages receive an
    * ::MQTTCLIENT_MAX_MESSAGES_INFLIGHT return code. Setting this flag to
    * false allows up to 10 messages to be in-flight. This can increase
    * overall throughput in some circumstances.
    */
   int reliable;
   /**
    * This is a pointer to an MQTTClient_willOptions structure. If your
    * application does not make use of the Last Will and Testament feature,
    * set this pointer to NULL.
    */
   MQTTClient_willOptions* will;
   /**
    * MQTT servers that support the MQTT v3.1.1 protocol provide authentication
    * and authorisation by user name and password. This is the user name
    * parameter.
    */
   const char* username;
   /**
    * MQTT servers that support the MQTT v3.1.1 protocol provide authentication
    * and authorisation by user name and password. This is the password
    * parameter.
    */
   const char* password;
   /**
    * The time interval in seconds to allow a connect to complete.
    */
   int connectTimeout;
   /**
    * The time interval in seconds
    */
   int retryInterval;
   /**
    * This is a pointer to an MQTTClient_SSLOptions structure. If your
    * application does not make use of SSL, set this pointer to NULL.
    */
   MQTTClient_SSLOptions* ssl;
   /**
    * The number of entries in the optional serverURIs array. Defaults to 0.
    */
   int serverURIcount;
   /**
    * An optional array of null-terminated strings specifying the servers to
    * which the client will connect. Each string takes the form <i>protocol://host:port</i>.
    * <i>protocol</i> must be <i>tcp</i> or <i>ssl</i>. For <i>host</i>, you can
    * specify either an IP address or a host name. For instance, to connect to
    * a server running on the local machines with the default MQTT port, specify
    * <i>tcp://localhost:1883</i>.
    * If this list is empty (the default), the server URI specified on MQTTClient_create()
    * is used.
    */
   char*[]  serverURIs;
   /**
    * Sets the version of MQTT to be used on the connect.
    * MQTTVERSION_DEFAULT (0) = default: start with 3.1.1, and if that fails, fall back to 3.1
    * MQTTVERSION_3_1 (3) = only try version 3.1
    * MQTTVERSION_3_1_1 (4) = only try version 3.1.1
    */
   int MQTTVersion;
   /**
    * Returned from the connect when the MQTT version used to connect is 3.1.1
    */
   Returned returned;
}

struct MQTTClient_willOptions {
   /** The eyecatcher for this structure.  must be MQTW. */
   char[4] struct_id = ['M', 'Q', 'T', 'W'];
   /** The version number of this structure.  Must be 0 */
   int struct_version;
   /** The LWT topic to which the LWT message will be published. */
   const char* topicName;
   /** The LWT payload. */
   const char* message;
   /**
    * The retained flag for the LWT message (see MQTTClient_message.retained).
    */
   int retained;
   /**
    * The quality of service setting for the LWT message (see
    * MQTTClient_message.qos and @ref qos).
    */
   int qos;
}

struct MQTTClient_SSLOptions {
   /** The eyecatcher for this structure.  Must be MQTS */
   char[4] struct_id = ['M', 'Q', 'T', 'S'];
   /** The version number of this structure.  Must be 0 */
   int struct_version = 0;

   /** The file in PEM format containing the public digital certificates trusted by the client. */
   const char* trustStore;

   /** The file in PEM format containing the public certificate chain of the client. It may also include
    * the client's private key.
    */
   const char* keyStore;

   /** If not included in the sslKeyStore, this setting points to the file in PEM format containing
    * the client's private key.
    */
   const char* privateKey;
   /** The password to load the client's privateKey if encrypted. */
   const char* privateKeyPassword;

   /**
    * The list of cipher suites that the client will present to the server during the SSL handshake. For a
    * full explanation of the cipher list format, please see the OpenSSL on-line documentation:
    * http://www.openssl.org/docs/apps/ciphers.html#CIPHER_LIST_FORMAT
    * If this setting is ommitted, its default value will be "ALL", that is, all the cipher suites -excluding
    * those offering no encryption- will be considered.
    * This setting can be used to set an SSL anonymous connection ("aNULL" string value, for instance).
    */
   const char* enabledCipherSuites;

   /** True/False option to enable verification of the server certificate **/
   int enableServerCertAuth;

}

struct Returned {
   const char* serverURI;     /**< the serverURI connected to */
   int MQTTVersion;     /**< the MQTT version used to connect with */
   int sessionPresent;  /**< if the MQTT version is 3.1.1, the value of sessionPresent returned in the connack */
}

