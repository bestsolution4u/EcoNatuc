import 'package:econatuc/bloc/bloc.dart';
import 'package:econatuc/config/application.dart';
import 'package:econatuc/screen/graph_screen.dart';
import 'package:econatuc/screen/settings_screen.dart';
import 'package:econatuc/screen/wifi_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  WifiBloc _wifiBloc;

  @override
  void initState() {
    super.initState();
    _wifiBloc = BlocProvider.of<WifiBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WifiBloc, WifiState>(
        builder: (context, state) {
          if (state is WifiLoadingState) {
            return buildWifiLoadingView();
          } else if (state is WifiDisabledState) {
            return buildWifiDisabledView();
          } else if (state is WifiConnectedState) {
            return buildWifiConnectedView(state);
          } else if (state is WifiConnectingState) {
            return buildWifiConnectingView();
          } else {
            // wifi not connectible
            return buildWifiNotConnectibleView();
          }
        },
      ),
    );
  }

  Widget buildWifiLoadingView() {
    return Center(
      child: Text(
        "Loading...",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }

  Widget buildWifiDisabledView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity, height: 1,),
        Text(
          "Wifi disabled. Please enable wifi and try again.",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              _wifiBloc.add(WifiCheckEvent());
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Connect",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ))
      ],
    );
  }

  Widget buildWifiConnectingView() {
    return Center(
      child: Text(
        "Connecting to ${Application.Wifi_SSID}...",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }

  Widget buildWifiNotConnectibleView2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity, height: 1,),
        Text(
          "Cannot connect to ${Application.Wifi_SSID}.",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              _wifiBloc.add(WifiCheckEvent());
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Connect",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ))
      ],
    );
  }

  Widget buildWifiNotConnectibleView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity, height: 1,),
        Text(
          "Cannot connect to ${Application.Wifi_SSID}.",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              _wifiBloc.add(WifiCheckEvent());
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Connect",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WifiSettingScreen(),));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Setup Wifi",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GraphScreen(duration: 'hours',),));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Hours Graph",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GraphScreen(duration: 'days',),));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Days Graph",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GraphScreen(duration: 'months',),));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Months Graph",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ))
      ],
    );
  }

  Widget buildWifiConnectedView(WifiConnectedState state) {
    return Column(
      children: [
        SizedBox(width: double.infinity, height: 30,),
        Text("Connected to ${Application.Wifi_SSID}. MqttName response: ${state.mqtt.toString()}"),
        SizedBox(height: 30,),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WifiSettingScreen(),));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            child: Text(
              "Setup Wifi",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ))
      ],
    );
  }
}
