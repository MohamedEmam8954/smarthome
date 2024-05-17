import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:smarthome/cubit/mqttcubit/mqttstates.dart';

class MqttCubit extends Cubit<MqttStates> {
  late MqttServerClient client;
  String temperature = '', gas = '';

  MqttCubit() : super(MqttInitial());

  Future<void> connect() async {
    client = MqttServerClient('broker.hivemq.com', 'flutter_client');
    client.logging(on: true);
    client.onConnected = _onConnected;
    client.onDisconnected = _onDisconnected;
    client.onSubscribed = onSubscribed;

    try {
      await client.connect();
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        emit(MqttConnected());
        log('Connected to MQTT broker');
        subscribeToTopics(); // Subscribe to topics after a successful connection
      } else {
        emit(MqttError('Failed to connect to MQTT broker'));
      }
    } catch (e) {
      emit(MqttError('MQTT connection error: $e'));
    }
  }

  void disconnect() {
    client.disconnect();
    emit(MqttDisconnected());
  }

  void publishMessage({required String message, required String topic}) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    emit(MessagePublished());
    log('Published message topic $topic: $message');
  }

  void subscribeToTopics() {
    client.subscribe('home/temperature', MqttQos.atMostOnce);
    client.subscribe('home/gas', MqttQos.atMostOnce);

    client.updates?.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      if (c != null && c.isNotEmpty) {
        final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
        final String pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        final String topic = c[0].topic;

        if (topic == 'home/temperature') {
          temperature = pt;
          emit(MessageReceiviedTemperature());
          log('Received temperature: $pt from topic: $topic');
        } else if (topic == 'home/gas') {
          gas = pt;
          emit(MessageReceiviedGas());
          log('Received gas: $pt from topic: $topic');
        }
      }
    });
  }

  void onSubscribed(String topic) {
    log('Subscribed to $topic');
  }

  void _onConnected() {
    log('Connected');
  }

  void _onDisconnected() {
    log('Disconnected');
    emit(MqttDisconnected());
  }
}
