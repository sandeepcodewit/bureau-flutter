import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:bureau_auth/bureau_auth.dart';

void main() {
  runApp(MyApp());
}

/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}

*/
Future<String> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}

class MyApp extends StatelessWidget {
  sampleFunction() async {
    String deviceId = await _getId();
    try {
      await BureauAuth.authenticate(deviceId, '779999999999', 0,
          'add44b24-81b9-4939-91ef-97032a7b56cd', null, false);
      print('Function on Click Event Called.');
    } on PlatformException {
      print('Failed to get platform version.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Text(" Button With OnPress "),
          onPressed: sampleFunction,
          color: Colors.red,
          textColor: Colors.white,
          splashColor: Colors.grey,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        )
      ],
    ))));
  }
}
