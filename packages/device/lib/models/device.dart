import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Device {
  dynamic id;
  String? brand;
  String? model;
  String? os;
  String? osVersion;
  String? appVersion;
  String? fcmToken;

  static late PackageInfo? packageInfo;
  static late BaseDeviceInfo? deviceInfo;

  static Future<Device> initialize({dynamic id, String? fcmToken}) async {
    deviceInfo = await DeviceInfoPlugin().deviceInfo;
    packageInfo = await PackageInfo.fromPlatform();

    return Device.current(id: id, fcmToken: fcmToken);
  }

  Device.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        brand = map['brand'],
        model = map['model'],
        os = map['os'],
        osVersion = map['os_version'],
        appVersion = map['app_version'],
        fcmToken = map['fcm_token'];

  Device.current({this.id, this.fcmToken}) {
    appVersion = '${packageInfo!.version}+${packageInfo!.buildNumber}';

    if (deviceInfo is AndroidDeviceInfo) {
      final androidDeviceInfo = deviceInfo as AndroidDeviceInfo;

      brand = androidDeviceInfo.brand;
      model = androidDeviceInfo.model;
      os = 'android';
      osVersion = androidDeviceInfo.version.release;
    } else if (deviceInfo is IosDeviceInfo) {
      final iosDeviceInfo = deviceInfo as IosDeviceInfo;

      brand = 'apple';
      model = iosDeviceInfo.utsname.machine;
      os = 'ios';
      osVersion = iosDeviceInfo.systemVersion;
    }
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'brand': brand,
        'model': model,
        'os': os,
        'os_version': osVersion,
        'app_version': appVersion,
        'fcm_token': fcmToken,
      };

  @override
  int get hashCode =>
      id.hashCode ^
      brand.hashCode ^
      model.hashCode ^
      os.hashCode ^
      osVersion.hashCode ^
      appVersion.hashCode ^
      fcmToken.hashCode;

  @override
  bool operator ==(other) =>
      other is Device &&
      other.id == id &&
      other.brand == brand &&
      other.model == model &&
      other.os == os &&
      other.osVersion == osVersion &&
      other.appVersion == appVersion &&
      other.fcmToken == fcmToken;
}
