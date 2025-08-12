// lib/device.dart
abstract class Device {
  final String name;
  bool powerState;

  Device(this.name, {this.powerState = true}) {
    if (name.trim().isEmpty) {
      throw ArgumentError('Device name cannot be empty.');
    }
  }

  /// ensure device is powered before performing actions.
  void ensurePowered() {
    if (!powerState) {
      throw StateError('Device "$name" is powered off — no control allowed.');
    }
  }

  void turnOn() => powerState = true;
  void turnOff() => powerState = false;

  /// Human readable details about device
  Map<String, dynamic> toMap();

  @override
  String toString() => '${this.runtimeType}("$name") - power: ${powerState ? "ON" : "OFF"}';
}
