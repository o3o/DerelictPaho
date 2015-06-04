# DerelictPahoMqtt

A dynamic binding to the [libpaho-mqtt][1] library version for the D Programming Language.

Please see the pages [Building and Linking Derelict][2] and [Using Derelict][3],
in the Derelict documentation, for information on how to build DerelictPahoMqtt
and load libpaho-mqtt at run time. In the meantime, here's some sample code.

```D
import derelict.paho;

void main() {
    DerelictPahoMQTTClient.load();
    ...
}
```

[1]: https://www.eclipse.org/paho/clients/c/
[2]: http://derelictorg.github.io/compiling.html
[3]: http://derelictorg.github.io/using.html
