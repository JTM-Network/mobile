import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jtm/data/service/auth_service.dart';
import 'package:jtm/data/service/device_service.dart';
import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = AuthService();
  final deviceService = DeviceService();
  Timer refreshTimer;

  @override
  void initState() {
    super.initState();
    refreshTimerInit();
    
    if (Platform.isAndroid) deviceService.insertDeviceAndroid();
    if (Platform.isIOS) deviceService.insertDeviceIos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("JTM"), actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await service.logout().then((value) => {
                    if (refreshTimer.isActive) refreshTimer.cancel(),
                    Navigator.of(context).pushReplacementNamed('/')
                  });
            })
      ]),
      body: Center(child: Text("Home Page")),
    );
  }

  void refreshTimerInit() async {
    if (refreshTimer == null ||
        refreshTimer != null && !refreshTimer.isActive) {
      refreshAccessToken();
      refreshTimer = Timer.periodic(Duration(minutes: 9), (Timer timer) async {
        refreshAccessToken();
      });
    }
  }

  void refreshAccessToken() async {
    await service.refreshAccess(context).catchError((error) async {
      print(error.toString());
      await service.logout().then((value) => {
            if (refreshTimer.isActive) refreshTimer.cancel(),
            Navigator.of(context).pushReplacementNamed('/')
          });
    });
  }
}
