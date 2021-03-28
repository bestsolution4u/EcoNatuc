import 'package:econatuc/screen/main_screen.dart';
import 'package:econatuc/screen/wifi_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';
import 'bloc/bloc.dart';
import 'config/routes.dart';
import 'screen/splash_screen.dart';

class EconatucApp extends StatefulWidget {
  @override
  _EconatucAppState createState() => _EconatucAppState();
}

class _EconatucAppState extends State<EconatucApp> {

  final routes = Routes();

  @override
  void initState() {
    super.initState();
    AppBloc.applicationBloc.add(ApplicationStartupEvent());
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
        providers: AppBloc.blocProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routes.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            platform: TargetPlatform.iOS,
          ),
          home: BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
              if (state is ApplicationSetupState) {
                return MainScreen();
                //return WifiSettingScreen();
              }
              return SplashScreen();
            },
          ),
        ));
  }
}
