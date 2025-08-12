
import 'device.dart';

class Hub {
  final List<Device> _devices = [];

  void addDevice(Device d) {
    if (_devices.any((e) => e.name == d.name)) {
      throw ArgumentError('Device with name "${d.name}" already exists in the hub.');
    }
    _devices.add(d);
  }

  void removeDevice(String name) {
    _devices.removeWhere((d) => d.name == name);
  }

 Device? getDeviceByName(String name) {
  try {
    return _devices.firstWhere((d) => d.name == name);
  } catch (e) {
    return null;
  }
}


  List<Device> get devices => List.unmodifiable(_devices);

  void turnAllOn() {
    for (final d in _devices) d.turnOn();
  }

  void turnAllOff() {
    for (final d in _devices) d.turnOff();
  }

  void turnOnDevice(String name) {
    final d = getDeviceByName(name);
    if (d == null) throw ArgumentError('No device named "$name".');
    d.turnOn();
  }

  void turnOffDevice(String name) {
    final d = getDeviceByName(name);
    if (d == null) throw ArgumentError('No device named "$name".');
    d.turnOff();
  }

  void showDetails() {
    if (_devices.isEmpty) {
      print('Hub: no devices added yet.');
      return;
    }
    for (final d in _devices) {
      print('---');
      print(d.toString());
      final map = d.toMap();
      map.forEach((k, v) => print('  $k: $v'));
    }
    print('--- End of devices ---');
  }
}
