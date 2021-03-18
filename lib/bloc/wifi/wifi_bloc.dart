import 'package:econatuc/bloc/wifi/wifi_event.dart';
import 'package:econatuc/bloc/wifi/wifi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  }
}