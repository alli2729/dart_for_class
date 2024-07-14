/*
Guessing Words game
written by Ali Karimi
How to play:
The user tries to guess the letter 
by giving single letter input to the program
*/

import 'dart:io';

void main(List<String> args) {
  // initial list of words
  List<String> words = [
    "code",
    "bug",
    "loop",
    "byte",
    "file",
    "data",
    "apple",
    "node",
    "test",
    "web"
  ];
  for (var i = 0; i <= words.length - 1; i++) {
    // select a word of words list
    String w = words[i];
    List<String> word = w.split('');
    List<String> guess = [];
    // filling guess list with '-'
    for (var i = 0; i <= word.length - 1; i++) {
      guess.add('-');
    }

    print('-------------\nNew Word\n-------------\n');
    print(guess.join(' '));

    // Game begin with new word after (guess == word)
    while (guess.join('') != word.join('')) {
      int count = 0;
      // getting input from user
      stdout.write('Enter a Word : ');
      String? input = stdin.readLineSync();
      if (input != null) {
        for (var i = 0; i <= word.length - 1; i++) {
          if (input == word[i]) {
            // filling the guess list with right word
            guess[i] = input;
          } else {
            // handeling wrong guesses with stupid and smart logic XD
            count++;
          }
        }
      }
      print(guess.join(' '));
      if (count == word.length) {
        print("Wrong Guess : $input");
      }
    }
    print('-------------\nWell Done\n-------------\n');
  }
}
