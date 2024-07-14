import 'dart:io';

void main(List<String> args) {
  // making the initial matrix
  List<String> game = [
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
  List<String> matrix = [
    ' ',
    '|',
    ' ',
    '|',
    ' ',
    ' ',
    '|',
    ' ',
    '|',
    ' ',
    ' ',
    '|',
    ' ',
    '|',
    ' '
  ];
  // List<String> matrix = [];
  // for (var i = 1; i <= 9; i++) {
  //   matrix.add('$i ');
  // }

  // Games begin
  show(matrix);
  int count = 1;
  while (true) {
    stdout.write("Enter Row and Col for X: ");
    int numX = int.parse(stdin.readLineSync()!);
    count++;
    game[convert(numX, game)] = ' X ';
    matrix[convert(numX, matrix)] = 'X';
    show(matrix);
    if (isWin(game) == 'win') {
      print("Winner : X");
      break;
    } else {
      // if game has 10 inputs its meen DRAW
      if (count == 10) {
        break;
      }
      stdout.write("Enter Row and Col for O: ");
      int numO = int.parse(stdin.readLineSync()!);
      count++;
      game[convert(numO, game)] = ' O ';
      matrix[convert(numO, matrix)] = 'O';
      show(matrix);
    }
    if (isWin(game) == 'win') {
      print("Winner : O");
      break;
    }
  }
  if (isWin(game) == 'draw') {
    print("Draw !!");
  }
}

// necessary functions
// converting 2 digit into 1 digit
int convert(int num, List<String> list) {
  // for matrix list
  if (list.length == 9) {
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
    // for dup list
  } else if (list.length == 15) {
    switch (num) {
      case 11:
        return 0;
      case 12:
        return 2;
      case 13:
        return 4;
      case 21:
        return 5;
      case 22:
        return 7;
      case 23:
        return 9;
      case 31:
        return 10;
      case 32:
        return 12;
      case 33:
        return 14;
      default:
        return -1;
    }
  } else {
    return -1;
  }
}

// checks if list in winning status
String isWin(List<String> list) {
  if (list[0] == list[1] && list[1] == list[2]) {
    return 'win';
  } else if (list[3] == list[4] && list[4] == list[5]) {
    return 'win';
  } else if (list[6] == list[7] && list[7] == list[8]) {
    return 'win';
  } else if (list[0] == list[3] && list[3] == list[6]) {
    return 'win';
  } else if (list[1] == list[4] && list[4] == list[7]) {
    return 'win';
  } else if (list[2] == list[5] && list[5] == list[8]) {
    return 'win';
  } else if (list[0] == list[4] && list[4] == list[8]) {
    return 'win';
  } else if (list[2] == list[4] && list[4] == list[6]) {
    return 'win';
  } else {
    return 'draw';
  }
}

// show the lits as matrix
void show(List<String> list) {
  int mark = 0;
  print('------');
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 5; j++) {
      stdout.write(list[mark]);
      mark++;
    }
    print('\n------');
  }
}
