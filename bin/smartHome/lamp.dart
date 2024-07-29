import 'smartHome.dart';

class Lamp extends SmartHome {
  // Variables
  int voltage;

  // Constractors
  Lamp(super.place, super.model, this.voltage);

  // Methods
  @override
  off() {
    super.off();
    print('a light in ${this.place} has been turned off.');
  }

  @override
  on() {
    super.on();
    print('a light in ${this.place} has been turned on.');
  }

  @override
  String toString() {
    if (isOn) {
      return 'light ${model} in $place with $voltage vol is ON';
    }
    return 'light ${model} in $place with $voltage vol is OFF';
  }
}
