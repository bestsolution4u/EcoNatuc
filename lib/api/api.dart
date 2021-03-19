import 'package:econatuc/api/http_manager.dart';

class Api {
  static Future<dynamic> getMqttName() async {
    return await httpManager.get(url: "mqttname");
  }
}