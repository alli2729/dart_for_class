/*
  Ali Karimi
 */

import 'tv.dart';
import 'fridge.dart';
import 'lamp.dart';
import 'smartHome.dart';
import 'dart:io';

void main(List<String> args) {
  // create list of Devices
  List<SmartHome> devices = [];

  // Gettting input from user for 10 time
  int count = devices.length;
  while (count != 10) {
    showMenu();
    int choice = safeInput();
    switch (choice) {
      case 1:
        // add TV
        devices.add(Tv('bedroom', 'LG'));
        count++;
        break;
      case 2:
        // add Fridge
        devices.add(Fridge('kitchen', 'LG', 1300));
        count++;
        break;
      case 3:
        // add Lamp
        devices.add(Lamp('hall', 'sunrise', 220));
        count++;
        break;
      default:
        print('wrong input !');
    }
  }

  // show final list
  showList(devices);
}

void showMenu() {
  print("1. TV");
  print("2. Fridge");
  print("3. Lamp");
  print('--------------');
}

// makes sure user input is valid
int safeInput() {
  while (true) {
    String? input = stdin.readLineSync();
    if (input != null) {
      return int.parse(input);
    } else {
      print('Wrong input !\n Try Again');
    }
  }
}

// show the list
void showList(List<SmartHome> list) {
  for (var element in list) {
    print(element.toString());
  }
}
