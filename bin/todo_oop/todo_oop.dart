import 'dart:io';

class Todo {
  //----------- Variables
  String title;
  String description;
  int periority;
  // defualt value of todo status is pending
  String status = 'pending';

  //----------- Constractors
  Todo(
      {required this.title,
      required this.description,
      required this.periority});

  //----------- Methods
  @override
  String toString() {
    return '$title: $description. =>$status, priority: $periority';
  }

  // change todo status to DONE
  void done() {
    status = 'Done';
  }

  // change title of todo
  void editTiltle() {
    stdout.write('new Title : ');
    String? input = stdin.readLineSync();
    if (input != null) {
      title = input;
    }
  }

  // change description of todo
  void editDescription() {
    stdout.write('new Description : ');
    String? input = stdin.readLineSync();
    if (input != null) {
      description = input;
    }
  }
}
