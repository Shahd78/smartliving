
import 'device.dart';

mixin BatteryPowered on Device {
  int _batteryLevel = 100; 

  int get batteryLevel => _batteryLevel;

  void setBatteryLevel(int level) {
    if (level < 0 || level > 100) {
      throw ArgumentError('Battery level must be between 0 and 100.');
    }
    _batteryLevel = level;
  }

  void changeBatteryBy(int delta) {
    _batteryLevel = (_batteryLevel + delta).clamp(0, 100).toInt();

  }

  bool isBatteryAbove20() => _batteryLevel > 20;

  void charge(int amount) {
    if (amount < 0) {
      throw ArgumentError('Charge amount must be non-negative.');
    }
    changeBatteryBy(amount);
  }
}
