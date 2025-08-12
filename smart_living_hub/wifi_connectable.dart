
import 'device.dart';

mixin WiFiCapable on Device {
  String? _connectedSsid;

  void connectToWiFi(String ssid) {
    ensurePowered();
    if (ssid.isEmpty) {
      throw ArgumentError('SSID cannot be empty.');
    }
    _connectedSsid = ssid;
    print('Device "$name" connected to Wi-Fi network: "$ssid".');
  }

  String? get connectedSsid => _connectedSsid;
}
