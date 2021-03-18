import 'package:flutter/material.dart';

@immutable
abstract class WifiState {}

class WifiLoadingState extends WifiState {}

class WifiConnectedState extends WifiState {}

class WifiDisconnectedState extends WifiState {}

class WifiNotFoundState extends WifiState {}