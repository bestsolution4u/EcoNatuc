import 'package:econatuc/widget/icon_circle_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
