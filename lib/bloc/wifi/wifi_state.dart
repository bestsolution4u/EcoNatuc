import 'package:flutter/material.dart';

@immutable
abstract class WifiState {}

class WifiLoadingState extends WifiState {}

class WifiDisabledState extends WifiState {}

class WifiConnectedState extends WifiState {}

class WifiConnectingState extends WifiState {}

class WifiNotConnectableState extends WifiState {}