import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  _BatteryPageState createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  String _text = '배터리 잔량 : 모름';

  static const String CHANNEL_BATTERY = 'android/battery';
  static const String METHOD_BATTERY = 'getBatteryLevel';
  static const MethodChannel batteryChannel = MethodChannel(CHANNEL_BATTERY);

  _refresh() async {
    print('refresh battery level');

    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print(position);

    String _newText;
    try {
      final int result = await batteryChannel.invokeMethod(METHOD_BATTERY);
      _newText = '배터리 잔량 : $result %';
    } on PlatformException {
      _newText = '배터리 잔량을 알 수 없습니다.';
    }

    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '배터리 채널 데모 v1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CupertinoNavigationBar(middle: Text('배터리 채널 데모 v1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              RaisedButton(
                child: Text('가져오기'),
                onPressed: _refresh,
              )
            ],
          ),
        ),
      ),
    );
  }
}
