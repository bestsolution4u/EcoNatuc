import 'dart:io';

import 'package:econatuc/config/application.dart';
import 'package:econatuc/widget/icon_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WifiSettingScreen extends StatefulWidget {
  @override
  _WifiSettingScreenState createState() => _WifiSettingScreenState();
}

class _WifiSettingScreenState extends State<WifiSettingScreen> {

  @override
  void initState() {
    super.initState();
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconCircleButton(
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 24, color: Colors.black,),
                  size: 24,
                  padding: 8,
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20,),
                Text("Wifi Setting", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: WebView(
                  initialUrl: Application.wifi_setting_url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                  },
                  onProgress: (int progress) {
                    print("WebView is loading (progress : $progress%)");
                  },
                  javascriptChannels: <JavascriptChannel>{
                  },
                  navigationDelegate: (NavigationRequest request) {
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                  },
                  gestureNavigationEnabled: true,
                ),
              )
          ),
        ],
      ),
    );
  }
}
