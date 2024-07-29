import 'smartHome.dart';

class Fridge extends SmartHome {
  // Variables
  int capicity;

  // Constractors
  Fridge(super.place, super.model, this.capicity);

  // Methods
  @override
  off() {
    super.off();
    print('fridge in ${this.place} has been turned off.');
  }

  @override
  on() {
    super.on();
    print('fridge in ${this.place} has been turned on.');
  }

  @override
  String toString() {
    if (isOn) {
      return 'fridge ${model} in $place with $capicity is ON';
    }
    return 'fridge ${model} in $place with $capicity is OFF';
  }
}
