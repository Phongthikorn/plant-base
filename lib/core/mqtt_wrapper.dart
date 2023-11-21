import '../model/mqtt_state.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class MQTTClientWrapper {
  MqttServerClient client = MqttServerClient.withPort(
      'fbd613f050e94ecda65756447d1ff3ac.s1.eu.hivemq.cloud', 'player1', 8883);

  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;

  void _setupMqttClient() {
    client.secure = true;
    client.securityContext = SecurityContext.defaultContext;
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
  }

  void prepareMqttClient() async {
    _setupMqttClient();
    await connectClient();
    subscribeToTopic('room/hello');
    publishMessage('Hello');
  }

  void subscribeToTopic(String topicName) {
    debugPrint('Subscribing to the $topicName topic');
    client.subscribe(topicName, MqttQos.atMostOnce);

    // print the message when it is received
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt = MqttPublishPayload.bytesToStringAsString(
          recMess.payload.message);

      debugPrint(
          'EXAMPLE::Change notification:: topic is <${c[0]
              .topic}>, payload is <-- $pt -->');
      debugPrint('');
    });
  }

  void publishMessage(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage("pot/redLight", MqttQos.exactlyOnce, builder.payload!);
    client.published!.listen((MqttPublishMessage message) {
      debugPrint(
          'EXAMPLE::Published notification:: topic is ${message.variableHeader!
              .topicName}, with Qos ${message.header!.qos}');
    });
  }

  Future<void> connectClient() async {
    try {
      debugPrint('client connecting....');
      connectionState = MqttCurrentConnectionState.CONNECTING;
      await client.connect('player1', 'Player123');
    } on Exception catch (e) {
      debugPrint('client exception - $e');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }
  }

  // callbacks for different events
  void onSubscribed(String topic) {
    debugPrint('Subscription confirmed for topic $topic');
    subscriptionState = MqttSubscriptionState.SUBSCRIBED;
  }


  void onDisconnected() {
    debugPrint('OnDisconnected client callback - Client disconnection');
    connectionState = MqttCurrentConnectionState.DISCONNECTED;
  }

  void onConnected() {
    connectionState = MqttCurrentConnectionState.CONNECTED;
    debugPrint(
        'OnConnected client callback - Client connection was sucessful');
  }
}