import 'package:econatuc/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'util/bloc_inspector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocInspector();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(EconatucApp()));
}
