import 'smartHome.dart';

class Tv extends SmartHome {
  // Variables

  // Constractors
  Tv(super.place, super.model);

  // Methods
  @override
  off() {
    super.off();
    print('camera ${model} in ${place} has been turned off.');
  }

  @override
  on() {
    super.on();
    print('camera ${model} in ${place} has been turned on.');
  }

  @override
  String toString() {
    if (isOn) {
      return 'TV ${model} in $place is ON';
    }
    return 'TV ${model} in $place is OFF';
  }
}
