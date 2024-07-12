import 'dart:io';

void main(List<String> args) {
  // initial list of words
  List<String> words = ['ali', 'apple', 'word', 'disk'];
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
      // getting input from user
      stdout.write('Enter a Word : ');
      String? input = stdin.readLineSync();
      if (input != null) {
        for (var i = 0; i <= word.length - 1; i++) {
          if (input == word[i]) {
            guess[i] = input;
            // filling the guess list with right word
          }
        }
      }
      print(guess.join(' '));
    }
    print('-------------\nWell Done\n-------------\n');
  }
}
