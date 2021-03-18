import 'dart:async';

import 'package:econatuc/config/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitialState());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartupEvent) {
      yield* _mapApplicationStartupEventToState();
    }
  }

  Stream<ApplicationState> _mapApplicationStartupEventToState() async* {
    /// Start Application Setup
    yield ApplicationLoadingState();

    await Future.delayed(Duration(seconds: 1));

    /// Setup SharedPreferences
    Application.preferences = await SharedPreferences.getInstance();

    /// Application Setup Completed
    yield ApplicationSetupState();
  }
}