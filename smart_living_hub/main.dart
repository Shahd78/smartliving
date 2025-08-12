
import 'hub.dart';
import 'light.dart';
import 'door_lock.dart';
import 'temperature_controller.dart';

void main() {
  final hub = Hub();

  final livingRoomLight = Light('LivingRoom Light', brightness: 70, color: 'warm white');
  final frontDoor = DoorLock.unlocked('Front Door'); 
  final thermostat = TemperatureController.eco('Hall Thermostat'); 

  hub.addDevice(livingRoomLight);
  hub.addDevice(frontDoor);
  hub.addDevice(thermostat);

  
  livingRoomLight.connectToWiFi('HomeNet-2.4');
  frontDoor.connectToWiFi('HomeNet-2.4');

  
  livingRoomLight.setBrightness(50);
  livingRoomLight.setColor('red');

  thermostat.setTemperature(21.5);
  thermostat.charge(5);

  
  hub.showDetails();

  
  frontDoor.turnOff();
  try {
    frontDoor.lock(); 
  } catch (e) {
    print('Expected error: $e');
  }

  hub.turnAllOn();
  hub.showDetails();
}
