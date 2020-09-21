import 'dart:convert';

import 'package:jtm/core/domain/device.dart';
import 'package:device_info/device_info.dart';

import 'package:jtm/core/usecase/http/jtm_api.dart';

class DeviceService {
  JtmApi jtmApi = new JtmApi();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  void insertDeviceIos() async {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    await jtmApi
        .postWithAuth(
            '/account/device/ios',
            json.encode(DeviceIos(
                    iosInfo.identifierForVendor,
                    iosInfo.name,
                    iosInfo.systemName,
                    iosInfo.systemVersion,
                    iosInfo.model,
                    iosInfo.localizedModel,
                    iosInfo.utsname.sysname,
                    iosInfo.utsname.version,
                    iosInfo.utsname.machine,
                    iosInfo.utsname.release)
                .toJson()))
        .then((value) =>
            {if (value.statusCode == 200) print("Successful device report.")});
  }

  void insertDeviceAndroid() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    await jtmApi
        .postWithAuth(
            '/account/device/android',
            json.encode(DeviceAndroid(
                    androidInfo.androidId,
                    androidInfo.version.baseOS,
                    androidInfo.version.codename,
                    androidInfo.version.release,
                    androidInfo.board,
                    androidInfo.bootloader,
                    androidInfo.brand,
                    androidInfo.device,
                    androidInfo.display,
                    androidInfo.fingerprint,
                    androidInfo.hardware,
                    androidInfo.host,
                    androidInfo.manufacturer,
                    androidInfo.model,
                    androidInfo.product)
                .toJson()))
        .then((value) =>
            {if (value.statusCode == 200) print("Successful device report.")});
  }
}
