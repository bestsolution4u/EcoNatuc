import 'package:econatuc/bloc/wifi/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AppBloc {

  static final applicationBloc = ApplicationBloc();
  static final wifiBloc = WifiBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(create: (context) => applicationBloc),
    BlocProvider<WifiBloc>(create: (context) => wifiBloc),
  ];

  static void dispose() {
    applicationBloc.close();
    wifiBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();
  factory AppBloc() {
    return _instance;
  }
  AppBloc._internal();
}