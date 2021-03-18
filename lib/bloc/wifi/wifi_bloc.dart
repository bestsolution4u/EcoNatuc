import 'package:econatuc/bloc/wifi/wifi_event.dart';
import 'package:econatuc/bloc/wifi/wifi_state.dart';
import 'package:econatuc/config/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WifiBloc extends Bloc<WifiEvent, WifiState> {
  WifiBloc() : super(WifiLoadingState());

  @override
  Stream<WifiState> mapEventToState(WifiEvent event) async* {
    if (event is WifiCheckEvent) {
      yield* _mapWifiCheckEventToState();
    }
  }

  Stream<WifiState> _mapWifiCheckEventToState() async* {
    yield WifiLoadingState();

    bool isWifiEnabled = await WiFiForIoTPlugin.isEnabled();
    if (!isWifiEnabled) {
      yield WifiDisabledState();
    } else {
      bool isWifiConnected = await WiFiForIoTPlugin.isConnected();
      String ssidConnected = await WiFiForIoTPlugin.getWiFiAPSSID();
      if (isWifiConnected && ssidConnected == Application.Wifi_SSID) {
        yield WifiConnectedState();
      } else {
        yield WifiConnectingState();
        isWifiConnected = await WiFiForIoTPlugin.connect(Application.Wifi_SSID,
            password: Application.Wifi_PASS,
            joinOnce: true,
            security: NetworkSecurity.WPA);
        if (isWifiConnected) {
          yield WifiConnectedState();
        } else {
          yield WifiNotConnectableState();
        }
      }
    }
  }
}