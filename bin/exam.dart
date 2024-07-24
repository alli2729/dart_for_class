/*
  ALI KARIMI
*/

import 'dart:io';

void main(List<String> args) {
  // List<int> nums = [0, 1, 2, 3, 3, 5, 5, 5, 8, 0];
  // print('Enter ten numbers :');
  // List<int> nums = readNums();

  // print("list :  $nums");
  // print('reverse sort:---------------------------------------');
  // print(reverseSort(nums));

  // print('tasks:----------------------------------------------');
  // multipleTask(nums);

  // print('secound biggest number : ---------------------------');
  // print(secoundBiggestNumber(nums));

  // print('input number lists after removing duplicates number : ');
  // print(removeDuplicates(nums));

  todo();
}

List<int> readNums() {
  List<int> output = [];
  for (var i = 1; i <= 10; i++) {
    stdout.write("Enter num $i : ");
    String? input = stdin.readLineSync();
    if (input != null) {
      int item = int.parse(input);
      output.add(item);
    }
  }
  return output;
}

//* Q1 ----------------------------------------
void multipleTask(List<int> nums) {
  int len = nums.length;

  // Average of list
  int sum = 0;
  for (var i = 0; i < len; i++) {
    sum += nums[i];
  }
  print("Average of list is : ${sum / len}");

  // minimum and maximum
  int min = nums[0], max = nums[0];
  for (var i = 0; i < len; i++) {
    if (nums[i] < min) {
      min = nums[i];
    }
    if (nums[i] > max) {
      max = nums[i];
    }
  }
  print('Maximium is $max and minimum is $min');

  // most repeated item
  List<int> set = fakeSet(nums);
  List<int> numbers = bubbleSort(nums);
  List<int> repeat = [];
  for (int i = 0; i < set.length; i++) {
    repeat.add(0);
  }

  int i = 0;
  int j = 0;

  while (i < set.length - 1) {
    int count = 1;
    if (numbers[j] == set[i]) {
      count++;
      repeat[i] = count;
      j++;
    } else if (numbers[j] != set[i]) {
      i++;
      // j = i;
    }
  }
}

List<int> bubbleSort(List<int> nums) {
  int n = nums.length;
  for (var i = 1; i <= n; i++) {
    for (var j = 0; j < n - 1; j++) {
      if (nums[j] > nums[j + 1]) {
        // swap numbers
        int temp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = temp;
      }
    }
  }
  return nums;
}

//* Q2 -------------------------------------------
int secoundBiggestNumber(List<int> nums) {
  int big = nums.first, secBig = 0;
  int i = 1;
  while (i < nums.length) {
    if (nums[i] > big) {
      secBig = big;
      big = nums[i];
    }
    if (nums[i] != big && nums[i] > secBig) {
      secBig = nums[i];
    }
    i++;
  }
  return secBig;
}

//* Q3 --------------------------------------------
List<int> reverseSort(List<int> nums) {
  int n = nums.length;
  //bubble sort
  for (var i = 0; i < n - 1; i++) {
    for (var j = 0; j < n - i - 1; j++) {
      if (nums[j] < nums[j + 1]) {
        int temp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = temp;
      }
    }
  }
  return nums;
}

//* Q4 --------------------------------------------
List<int> removeDuplicates(List<int> nums) => fakeSet(nums);

List<int> fakeSet(List<int> nums) {
  int i = 0, len = nums.length - 1;
  List<int> listToSet = [];
  listToSet.add(nums[0]);
  while (i != len) {
    int j = i + 1;
    if (nums[i] != nums[j] && !listToSet.contains(nums[j])) {
      listToSet.add(nums[j]);
    }
    i++;
  }
  return listToSet;
}

//* Q5 --------------------------------------------
void showMenu() {
  print('---------------------------------------');
  print('1. Insert ToDo');
  print('2. Change Status to Done');
  print('3. Delete ToDo');
  print('4. Edit Name of ToDo');
  print('5. Edit Description of ToDo');
  print('0. Exit');
}

void todo() {
  List<String> name = [];
  List<String> description = [];
  List<String> status = [];
  List<int> periorty = [];
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
          insertTodo(name, description, status, periorty);
          show(name, description, status, periorty);
          break;
        case 2:
          // change status
          if (name.isEmpty) {
            print('ToDo list is empty !');
            break;
          }
          stdout.write('Enter index of ToDo : ');
          String? doneIndex = stdin.readLineSync();
          if (doneIndex != null) {
            int index = int.parse(doneIndex);
            if (index - 1 < name.length) {
              // index > len
              done(status, index);
              show(name, description, status, periorty);
              break;
            }
            print('wrong input');
            show(name, description, status, periorty);
            break;
          }
        case 3:
          if (name.isEmpty) {
            print('ToDo list is empty !');
            break;
          }
          // delete ToDo
          stdout.write('Enter index of ToDo : ');
          String? deleteIndex = stdin.readLineSync();
          if (deleteIndex != null) {
            int index = int.parse(deleteIndex);
            if (index - 1 < name.length) {
              // index > len
              delete(name, description, status, periorty, index);
              show(name, description, status, periorty);
              break;
            }
            print('wrong input');
            show(name, description, status, periorty);
            break;
          }
          break;
        case 4:
          if (name.isEmpty) {
            print('ToDo list is empty !');
            break;
          }
          // edit name
          stdout.write('Enter index of ToDo : ');
          String? editIndex = stdin.readLineSync();
          if (editIndex != null) {
            int index = int.parse(editIndex);
            if (index - 1 < name.length) {
              // index > len
              editName(name, index);
              show(name, description, status, periorty);
              break;
            }
            print('wrong input');
            show(name, description, status, periorty);
            break;
          }
          break;
        case 5:
          if (name.isEmpty) {
            print('ToDo list is empty !');
            break;
          }
          // edit description
          stdout.write('Enter index of ToDo : ');
          String? editIndex = stdin.readLineSync();
          if (editIndex != null) {
            int index = int.parse(editIndex);
            if (index - 1 < name.length) {
              // index > len
              editDesc(description, index);
              show(name, description, status, periorty);
              break;
            }
            print('wrong input');
            show(name, description, status, periorty);
            break;
          }
          break;
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
    List<String> status, List<int> periorty) {
  stdout.write('name of todo : ');
  String? inputName = stdin.readLineSync();
  stdout.write('description : ');
  String? inputDesc = stdin.readLineSync();
  stdout.write('periorty : ');
  String? inputPer = stdin.readLineSync();

  if (inputName != null && inputDesc != null && inputPer != null) {
    int per = int.parse(inputPer);
    name.add(inputName);
    description.add(inputDesc);
    status.add('pending');
    periorty.add(per);
  }
}

// show all ToDo's
void show(List<String> name, List<String> description, List<String> status,
    List<int> periorty) {
  sortByPeriorty(name, description, status, periorty);
  print("\nToDo's -----------------------------------------------");
  for (var i = 0; i < name.length; i++) {
    int index = i + 1;
    print(
        '$index. ${name[i]} : ${description[i]} : ${status[i]} -> periorty : ${periorty[i]}');
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
    List<int> periorty, int index) {
  name.removeAt(index - 1);
  description.removeAt(index - 1);
  status.removeAt(index - 1);
  periorty.removeAt(index - 1);
}

// change status of selected ToDo to DONE !
void done(List<String> status, int index) {
  status[index - 1] = 'DONE !';
}

void sortByPeriorty(
  List<String> name,
  List<String> description,
  List<String> status,
  List<int> periorty,
) {
  int n = name.length;
  //bubble sort
  for (var i = 1; i <= n; i++) {
    for (var j = 0; j < n - 1; j++) {
      if (periorty[j] < periorty[j + 1]) {
        // swap periorty
        int temp = periorty[j];
        periorty[j] = periorty[j + 1];
        periorty[j + 1] = temp;
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
