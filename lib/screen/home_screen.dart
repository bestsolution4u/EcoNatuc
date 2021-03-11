import 'package:econatuc/helper/wifi_info.dart';
import 'package:econatuc/screen/device_list_screen.dart';
import 'package:econatuc/widget/task_parameter_details.dart';
import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool fetchingWifiInfo = false;
  final TextEditingController _ssid = TextEditingController();
  final TextEditingController _bssid = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _expectedTaskResults = TextEditingController();
  final TextEditingController _intervalGuideCode = TextEditingController();
  final TextEditingController _intervalDataCode = TextEditingController();
  final TextEditingController _timeoutGuideCode = TextEditingController();
  final TextEditingController _timeoutDataCode = TextEditingController();
  final TextEditingController _repeat = TextEditingController();
  final TextEditingController _portListening = TextEditingController();
  final TextEditingController _portTarget = TextEditingController();
  final TextEditingController _waitUdpReceiving = TextEditingController();
  final TextEditingController _waitUdpSending = TextEditingController();
  final TextEditingController _thresholdSucBroadcastCount = TextEditingController();
  ESPTouchPacket _packet = ESPTouchPacket.broadcast;

  @override
  void dispose() {
    _ssid.dispose();
    _bssid.dispose();
    _password.dispose();
    _expectedTaskResults.dispose();
    _intervalGuideCode.dispose();
    _intervalDataCode.dispose();
    _timeoutGuideCode.dispose();
    _timeoutDataCode.dispose();
    _repeat.dispose();
    _portListening.dispose();
    _portTarget.dispose();
    _waitUdpReceiving.dispose();
    _waitUdpSending.dispose();
    _thresholdSucBroadcastCount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'EcoNatu',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Center(
                child: OutlineButton(
                  highlightColor: Colors.transparent,
                  highlightedBorderColor: color,
                  onPressed: fetchingWifiInfo ? null : fetchWifiInfo,
                  child: fetchingWifiInfo
                      ? Text(
                    'Fetching WiFi info',
                    style: TextStyle(color: Colors.grey),
                  )
                      : Text(
                    'Use current Wi-Fi',
                    style: TextStyle(color: color),
                  ),
                ),
              ),
              TextFormField(
                controller: _ssid,
                decoration: const InputDecoration(
                  labelText: 'SSID',
                  hintText: 'Econatu',
                  helperMaxLines: 3,
                  helperText: 'SSID is the technical term for a network name. When you set up a wireless home network, you give it a name to distinguish it from other networks in your neighbourhood.',
                ),
              ),
              TextFormField(
                controller: _bssid,
                decoration: const InputDecoration(
                  labelText: 'BSSID',
                  hintText: '00:a0:c9:14:c8:29',
                  helperMaxLines: 3,
                  helperText: 'BSSID is the MAC address of the wireless access point (router).',
                ),
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: r'V3Ry.S4F3-P@$$w0rD',
                  helperMaxLines: 3,
                  helperText: 'The password of the Wi-Fi network',
                ),
              ),
              RadioListTile(
                title: Text('Broadcast'),
                value: ESPTouchPacket.broadcast,
                groupValue: _packet,
                onChanged: setPacket,
                activeColor: color,
              ),
              RadioListTile(
                title: Text('Multicast'),
                value: ESPTouchPacket.multicast,
                groupValue: _packet,
                onChanged: setPacket,
                activeColor: color,
              ),
              TaskParameterDetails(
                color: color,
                expectedTaskResults: _expectedTaskResults,
                intervalGuideCode: _intervalGuideCode,
                intervalDataCode: _intervalDataCode,
                timeoutGuideCode: _timeoutGuideCode,
                timeoutDataCode: _timeoutDataCode,
                repeat: _repeat,
                portListening: _portListening,
                portTarget: _portTarget,
                waitUdpReceiving: _waitUdpReceiving,
                waitUdpSending: _waitUdpSending,
                thresholdSucBroadcastCount: _thresholdSucBroadcastCount,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeviceListScreen(task: createTask()),
                      ),
                    );
                  },
                  child: const Text('Execute'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchWifiInfo() async {
    setState(() {
      fetchingWifiInfo = true;
    });
    try {
      _ssid.text = await ssid;
      _bssid.text = await bssid;
    } finally {
      setState(() {
        fetchingWifiInfo = false;
      });
    }
  }

  void setPacket(ESPTouchPacket packet) {
    setState(() {
      _packet = packet;
    });
  }

  createTask() {
    final taskParameter = ESPTouchTaskParameter();
    if (_intervalGuideCode.text.isNotEmpty) {
      taskParameter.intervalGuideCode =
          Duration(milliseconds: int.parse(_intervalGuideCode.text));
    }
    if (_intervalDataCode.text.isNotEmpty) {
      taskParameter.intervalDataCode =
          Duration(milliseconds: int.parse(_intervalDataCode.text));
    }
    if (_timeoutGuideCode.text.isNotEmpty) {
      taskParameter.timeoutGuideCode =
          Duration(milliseconds: int.parse(_timeoutGuideCode.text));
    }
    if (_timeoutDataCode.text.isNotEmpty) {
      taskParameter.timeoutDataCode =
          Duration(milliseconds: int.parse(_timeoutDataCode.text));
    }
    if (_repeat.text.isNotEmpty) {
      taskParameter.repeat = int.parse(_repeat.text);
    }
    if (_portListening.text.isNotEmpty) {
      taskParameter.portListening = int.parse(_portListening.text);
    }
    if (_portTarget.text.isNotEmpty) {
      taskParameter.portTarget = int.parse(_portTarget.text);
    }
    if (_waitUdpSending.text.isNotEmpty) {
      taskParameter.waitUdpSending =
          Duration(milliseconds: int.parse(_waitUdpSending.text));
    }
    if (_waitUdpReceiving.text.isNotEmpty) {
      taskParameter.waitUdpReceiving =
          Duration(milliseconds: int.parse(_waitUdpReceiving.text));
    }
    if (_thresholdSucBroadcastCount.text.isNotEmpty) {
      taskParameter.thresholdSucBroadcastCount =
          int.parse(_thresholdSucBroadcastCount.text);
    }
    if (_expectedTaskResults.text.isNotEmpty) {
      taskParameter.expectedTaskResults = int.parse(_expectedTaskResults.text);
    }

    return ESPTouchTask(
      ssid: _ssid.text,
      bssid: _bssid.text,
      password: _password.text,
      packet: _packet,
      taskParameter: taskParameter,
    );
  }
}
