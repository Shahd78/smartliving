
import 'device.dart';
import 'battery_powered.dart';

class TemperatureController extends Device with BatteryPowered {
  double _temperatureC; 
  bool ecoMode;

  TemperatureController(String name,
      {double temperatureC = 22.0, this.ecoMode = false, bool powerState = true})
      : _temperatureC = _validateTemperature(temperatureC),
        super(name, powerState: powerState);

  TemperatureController.eco(String name) : this(name, temperatureC: 20.0, ecoMode: true);

  static double _validateTemperature(double t) {
    if (t < 5.0 || t > 35.0) {
      throw ArgumentError('Temperature must be between 5°C and 35°C.');
    }
    return t;
  }

  double get temperatureC => _temperatureC;

  void setTemperature(double t) {
    ensurePowered();
    _temperatureC = _validateTemperature(t);
  }

  void toggleEco() {
    ensurePowered();
    ecoMode = !ecoMode;
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'TemperatureController',
        'name': name,
        'powerState': powerState,
        'temperatureC': _temperatureC,
        'ecoMode': ecoMode,
        'battery': batteryLevel
      };
}
