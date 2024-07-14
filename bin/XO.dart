/*
XO game
written by Ali Karimi
How to play:
The game starts with input x
then two players continue the game by giving input to the program
until the winner is determined
If the game does not have a winner, it will be a draw  
*/

import 'dart:io';

void main(List<String> args) {
  // making the initial matrix
  List<String> game = ['11', '12', '13', '21', '22', '23', '31', '32', '33'];
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

  // Games begin
  show(matrix);
  int count = 1;
  while (true) {
    bool takenByX = true;
    bool winX = false, winO = false;
    count++;
    while (takenByX) {
      stdout.write("Enter Row and Col for X: ");
      int numX = int.parse(stdin.readLineSync()!);
      // checks if game[input] has already X or O init
      if (game[convert(numX, game)].contains('X') ||
          game[convert(numX, game)].contains('O')) {
        takenByX = true;
        print('its Already Taken !');
      } else {
        takenByX = false;
      }
      // if game[input] is empty
      if (!takenByX) {
        game[convert(numX, game)] = ' X ';
        matrix[convert(numX, matrix)] = 'X';
        show(matrix);
        // checks if X is won
        if (isWin(game)) {
          winX = true;
          break;
        }
      }
    }
    if (winX) {
      print('X wins!!');
      break;
    }

    // if game has 10 inputs its meen DRAW
    if (count == 10) {
      break;
    }
    bool takenByO = true;
    count++;
    while (takenByO) {
      stdout.write("Enter Row and Col for O: ");
      int numX = int.parse(stdin.readLineSync()!);
      // checks if game[input] has already X or O init
      if (game[convert(numX, game)].contains('X') ||
          game[convert(numX, game)].contains('O')) {
        takenByO = true;
        print('its Already Taken !');
      } else {
        takenByO = false;
      }
      // if game[input] is empty
      if (!takenByO) {
        game[convert(numX, game)] = ' O ';
        matrix[convert(numX, matrix)] = 'O';
        show(matrix);

        // checks if O is won
        if (isWin(game)) {
          winO = true;
          break;
        }
      }
    }
    if (winO) {
      print('O winns');
      break;
    }
  }
  if (!isWin(game)) {
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
    // Game is Draw
    return false;
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
