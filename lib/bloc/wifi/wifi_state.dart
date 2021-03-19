import 'package:flutter/material.dart';

@immutable
abstract class WifiState {}

class WifiLoadingState extends WifiState {}

class WifiDisabledState extends WifiState {}

class WifiConnectedState extends WifiState {
  final dynamic mqtt;

  WifiConnectedState(this.mqtt);
}

class WifiConnectingState extends WifiState {}

class WifiNotConnectableState extends WifiState {}