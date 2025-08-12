
import 'device.dart';
import 'wifi_connectable.dart';
import 'battery_powered.dart';

class Light extends Device with WiFiCapable, BatteryPowered {
  static const List<String> allowedColors = ['warm white', 'cool white', 'red', 'green', 'blue'];

  int _brightness; 
  String _color;

  Light(String name,
      {bool powerState = true, int brightness = 100, String color = 'warm white'})
      : _brightness = _validateBrightness(brightness),
        _color = _validateColor(color),
        super(name, powerState: powerState);

  
  Light.warm(String name) : this(name, color: 'warm white', brightness: 80);
  Light.cool(String name) : this(name, color: 'cool white', brightness: 90);

  static int _validateBrightness(int b) {
    if (b < 0 || b > 100) throw ArgumentError('Brightness must be 0..100.');
    return b;
  }

  static String _validateColor(String c) {
    if (!allowedColors.contains(c)) {
      throw ArgumentError('Color "$c" is not allowed. Allowed: $allowedColors');
    }
    return c;
  }

  int get brightness => _brightness;
  String get color => _color;

  void setBrightness(int b) {
    ensurePowered();
    _brightness = _validateBrightness(b);
  }

  void setColor(String c) {
    ensurePowered();
    _color = _validateColor(c);
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'Light',
        'name': name,
        'powerState': powerState,
        'brightness': _brightness,
        'color': _color,
        'battery': batteryLevel,
        'wifi': connectedSsid
      };
}
