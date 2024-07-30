import 'dart:io';
import 'todo_oop.dart';

void main(List<String> args) {
  List<Todo> todos = [];
  bool isAlive = true;
  while (isAlive) {
    showMenu();
    int action = safeInput();
    print('---------------------------------------');
    switch (action) {
      case 1:
        // insert new ToDo
        todos.add(insert());
        showTodos(todos);
        break;
      case 2:
        // Select Todo
        if (todos.isEmpty) {
          print("Todo List is Empty !");
          continue;
        }
        stdout.write('Enter index of ToDo : ');
        int index = safeInput();
        if (index - 1 < todos.length) {
          int choice = showSelectMenu();
          switch (choice) {
            case 1:
              // change status to Done
              todos[index - 1].done();
              showTodos(todos);
              break;
            case 2:
              // edit name
              todos[index - 1].editTiltle();
              showTodos(todos);
              break;
            case 3:
              // edit description
              todos[index - 1].editDescription();
              showTodos(todos);
              break;
            case 4:
              // delete todo
              todos.removeAt(index - 1);
              showTodos(todos);
              break;
            case 0:
              // back button
              showTodos(todos);
              break;
          }
        } else {
          print('Wrong input , Try Again');
          showTodos(todos);
        }
      case 0:
        isAlive = false;
        break;
      default:
        print('Wrong input , Try Again');
        continue;
    }
  }
}

// sort todos list by periority
void sortByPeriorty(List<Todo> todos) {
  int n = todos.length;
  //bubble sort
  for (var i = 1; i <= n; i++) {
    for (var j = 0; j < n - 1; j++) {
      if (todos[j].periority < todos[j + 1].periority) {
        // swap periorty
        Todo temp = todos[j];
        todos[j] = todos[j + 1];
        todos[j + 1] = temp;
      }
    }
  }
}

// insert new ToDo to todos lists
Todo insert() {
  bool valid = false;
  while (!valid) {
    stdout.write('title of todo : ');
    String? inputName = stdin.readLineSync();
    stdout.write('description : ');
    String? inputDesc = stdin.readLineSync();
    stdout.write('periority : ');
    String? inputPer = stdin.readLineSync();

    if (inputName != null && inputDesc != null && inputPer != null) {
      int per = int.parse(inputPer);
      return Todo(title: inputName, description: inputDesc, periority: per);
    }
  }
}

// makes sure that input from user is valid (not null)
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

// show functions

void showTodos(List<Todo> todos) {
  print('\nToDo ----------------------------------');
  sortByPeriorty(todos);
  for (var i = 0; i < todos.length; i++) {
    print('${i + 1}. ${todos[i].toString()}');
  }
}

void showMenu() {
  print('---------------------------------------');
  print('1. Insert ToDo');
  print('2. Select ToDo');
  print('0. Exit');
  stdout.write('Select Action : ');
}

int showSelectMenu() {
  print('---------------------------------------');
  print('1. Done !!');
  print('2. Edit Title');
  print('3. Edit Description');
  print('4. Delete');
  print('0. Back');
  stdout.write('Select Action : ');

  int choice = safeInput();
  while (choice >= 0 && choice <= 4) {
    return choice;
  }
  print('wrong input !');
  showSelectMenu();

  return -1;
}
