
import 'device.dart';
import 'wifi_connectable.dart';

class DoorLock extends Device with WiFiCapable {
  bool _locked;

  DoorLock(String name, {bool locked = true, bool powerState = true})
      : _locked = locked,
        super(name, powerState: powerState);

  
  DoorLock.unlocked(String name) : this(name, locked: false);

  bool get isLocked => _locked;

  void lock() {
    ensurePowered();
    _locked = true;
  }

  void unlock() {
    ensurePowered();
    _locked = false;
  }

  void toggleLock() {
    ensurePowered();
    _locked = !_locked;
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'DoorLock',
        'name': name,
        'powerState': powerState,
        'locked': _locked,
        'wifi': connectedSsid
      };
}
