class MqttStates {}

class MqttInitial extends MqttStates {}

class MqttConnected extends MqttStates {}

class MqttDisconnected extends MqttStates {}

class MessagePublished extends MqttStates {}

class MqttError extends MqttStates {
  final String message;

  MqttError(this.message);
}

class MessageReceiviedTemperature extends MqttStates {}

class MessageReceiviedGas extends MqttStates {}
