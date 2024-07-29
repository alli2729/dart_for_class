abstract class SmartHome {
  // Variables
  bool isOn = false;
  String model;
  String place;

  // Constractors
  SmartHome(this.place, this.model);

  // Methods
  on() => isOn = true;
  off() => isOn = false;
}
