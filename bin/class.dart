import 'dart:io';

void main(List<String> args) {
  // making the initial matrix
  List<String> matrix = [
    '11 ',
    '12 ',
    '13 ',
    '21 ',
    '22 ',
    '23 ',
    '31 ',
    '32 ',
    '33 '
  ];
  // List<String> matrix = [];
  // for (var i = 1; i <= 9; i++) {
  //   matrix.add('$i ');
  // }

  // Games begin
  show(matrix);
  while (true) {
    stdout.write("Enter Row and Col for X: ");
    int numX = int.parse(stdin.readLineSync()!);
    matrix[convert(numX)] = ' X ';
    show(matrix);
    if (isWin(matrix)) {
      print("Winner : X");
      break;
    } else {
      stdout.write("Enter Row and Col for O: ");
      int numO = int.parse(stdin.readLineSync()!);
      matrix[convert(numO)] = ' O ';
      show(matrix);
    }
    if (isWin(matrix)) {
      print("Winner : O");
      break;
    }
  }
}

// necessary functions
// converting 2 digit into 1 digit
int convert(int num) {
  switch (num) {
    case 11:
      return 0;
    case 12:
      return 1;
    case 13:
      return 2;
    case 21:
      return 3;
    case 22:
      return 4;
    case 23:
      return 5;
    case 31:
      return 6;
    case 32:
      return 7;
    case 33:
      return 8;
    default:
      return -1;
  }
}

// checks if list in winning status
bool isWin(List<String> list) {
  if (list[0] == list[1] && list[1] == list[2]) {
    return true;
  } else if (list[3] == list[4] && list[4] == list[5]) {
    return true;
  } else if (list[6] == list[7] && list[7] == list[8]) {
    return true;
  } else if (list[0] == list[3] && list[3] == list[6]) {
    return true;
  } else if (list[1] == list[4] && list[4] == list[7]) {
    return true;
  } else if (list[2] == list[5] && list[5] == list[8]) {
    return true;
  } else if (list[0] == list[4] && list[4] == list[8]) {
    return true;
  } else if (list[2] == list[4] && list[4] == list[6]) {
    return true;
  } else {
    return false;
  }
}

// show the lits as matrix
void show(List<String> list) {
  int mark = 0;
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      stdout.write(list[mark]);
      mark++;
    }
    print('');
  }
}
