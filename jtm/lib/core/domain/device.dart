
class DeviceIos {

  final String id;
  final String name;
  final String systemName;
  final String version;
  final String model;
  final String localizedModel;
  final String osName;
  final String osVersion;
  final String osMachine;
  final String osRelease;

  DeviceIos(this.id, this.name, this.systemName, this.version, this.model, this.localizedModel, this.osName, this.osVersion, this.osMachine, this.osRelease);


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'systemName': systemName,
    'version': version,
    'model': model,
    'localizedModel': localizedModel,
    'osName': osName,
    'osVersion': osVersion,
    'osMachine': osMachine,
    'osRelease': osRelease
  };
}

 class DeviceAndroid {
   final String id;
   final String baseOS;
   final String codename;
   final String release;
   final String board;
   final String bootLoader;
   final String brand;
   final String device;
   final String display;
   final String fingerprint;
   final String hardware;
   final String host;
   final String manufacturer;
   final String model;
   final String product;

  DeviceAndroid(this.id, this.baseOS, this.codename, this.release, this.board, this.bootLoader, this.brand, this.device, this.display, this.fingerprint, this.hardware, this.host, this.manufacturer, this.model, this.product);

  Map<String, dynamic> toJson() => {
    'id': id,
    'baseOS': baseOS,
    'codename': codename,
    'release': release,
    'board': board,
    'bootLoader': bootLoader,
    'brand': brand,
    'device': device,
    'display': display,
    'fingerprint': fingerprint,
    'hardware': hardware,
    'host': host,
    'manufacturer': manufacturer,
    'model': model,
    'product': product
  };
 }