import 'dart:io';

void main(List<String> args) {
  todo();
}

void todo() {
  List<String> name = [];
  List<String> description = [];
  List<String> status = [];
  List<int> periority = [];
  bool isAlive = true;

  while (isAlive) {
    showMenu();
    stdout.write('Select Action : ');
    String? num = stdin.readLineSync();
    print('---------------------------------------');
    if (num != null) {
      int action = int.parse(num);
      switch (action) {
        case 1:
          // insert new ToDo
          insertTodo(name, description, status, periority);
          show(name, description, status, periority);
          break;
        case 2:
          // Select Todo
          if (name.isEmpty) {
            print("Todo List is Empty !");
            continue;
          }
          stdout.write('Enter index of ToDo : ');
          String? selectIndex = stdin.readLineSync();
          if (selectIndex != null) {
            int index = int.parse(selectIndex);
            if (index - 1 < name.length) {
              int choise = showSelectMenu();
              switch (choise) {
                case 1:
                  // change status
                  done(status, index);
                  show(name, description, status, periority);
                  break;
                case 2:
                  // edit name
                  editName(name, index);
                  show(name, description, status, periority);
                  break;
                case 3:
                  // edit description
                  editDesc(description, index);
                  show(name, description, status, periority);
                  break;
                case 4:
                  // delete todo
                  delete(name, description, status, periority, index);
                  show(name, description, status, periority);
                  break;
                case 0:
                  break;
              }
            }
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
}

// insert new ToDo to old lists
void insertTodo(List<String> name, List<String> description,
    List<String> status, List<int> periority) {
  stdout.write('name of todo : ');
  String? inputName = stdin.readLineSync();
  stdout.write('description : ');
  String? inputDesc = stdin.readLineSync();
  stdout.write('periority : ');
  String? inputPer = stdin.readLineSync();

  if (inputName != null && inputDesc != null && inputPer != null) {
    int per = int.parse(inputPer);
    name.add(inputName);
    description.add(inputDesc);
    status.add('pending');
    periority.add(per);
  }
}

// show all ToDo's
void show(List<String> name, List<String> description, List<String> status,
    List<int> periority) {
  sortByPeriorty(name, description, status, periority);
  print("\nToDo's -----------------------------------------------");
  for (var i = 0; i < name.length; i++) {
    int index = i + 1;
    print(
        '$index. ${name[i]} : ${description[i]} : ${status[i]} -> periority : ${periority[i]}');
  }
}

// edit the name of Selected ToDo
void editName(List<String> name, int num) {
  stdout.write('new Name : ');
  String? newName = stdin.readLineSync();
  if (newName != null) {
    name[num - 1] = newName;
  }
}

// edit the desctiption of Selected ToDo
void editDesc(List<String> description, int num) {
  stdout.write('new Description : ');
  String? newDesc = stdin.readLineSync();
  if (newDesc != null) {
    description[num - 1] = newDesc;
  }
}

// delete the selected ToDo
void delete(List<String> name, List<String> description, List<String> status,
    List<int> periority, int index) {
  name.removeAt(index - 1);
  description.removeAt(index - 1);
  status.removeAt(index - 1);
  periority.removeAt(index - 1);
}

// change status of selected ToDo to DONE !
void done(List<String> status, int index) {
  status[index - 1] = 'DONE !';
}

void sortByPeriorty(
  List<String> name,
  List<String> description,
  List<String> status,
  List<int> periority,
) {
  int n = name.length;
  //bubble sort
  for (var i = 1; i <= n; i++) {
    for (var j = 0; j < n - 1; j++) {
      if (periority[j] < periority[j + 1]) {
        // swap periorty
        int temp = periority[j];
        periority[j] = periority[j + 1];
        periority[j + 1] = temp;
        // swap name
        String tmpName = name[j];
        name[j] = name[j + 1];
        name[j + 1] = tmpName;
        // swap description
        String tmpDes = description[j];
        description[j] = description[j + 1];
        description[j + 1] = tmpDes;
        // swap status
        String tmpStatus = status[j];
        status[j] = status[j + 1];
        status[j + 1] = tmpStatus;
      }
    }
  }
}

void showMenu() {
  print('---------------------------------------');
  print('1. Insert ToDo');
  print('2. Select ToDo');
  print('0. Exit');
}

int showSelectMenu() {
  print('---------------------------------------');
  print('1. Done !!');
  print('2. Edit Name');
  print('3. Edit Description');
  print('4. Delete');
  print('0. Back');

  String? select = stdin.readLineSync();
  if (select != null) {
    int choice = int.parse(select);

    while (choice >= 0 && choice <= 4) {
      return choice;
    }
    print('wrong input !');
    showSelectMenu();
  }
  return -1;
}
