/*

  ? Ali Karimi

*/

import 'dart:io';

void main(List<String> args) {
  // set is a iterable
  Set<int> myset = {1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 9, 9};
  // add to set
  myset.add(10);
  myset.addAll({10, 11, 11, 12});
  // access to set
  myset.elementAt(5); // returns 6
  myset.elementAtOrNull(55); // returns null if not found
  // length of set
  myset.length;

  // map is not iterable
  Map<String, int> myMap = {
    'a': 1,
    'b': 2,
  };
  // map have two getters
  myMap.keys;
  myMap.values;
  //add to map
  myMap['c'] = 3; // adds to map
  myMap['a'] = 5; // change the value of 'a'
  myMap.addAll({'d': 7, 'e': 10}); // adds another map to myMap
  // length of map
  myMap.length;
  // MapEntry
  MapEntry<String, int> m = MapEntry('key', 4);
  MapEntry<String, int> w = MapEntry('W', 5);
  myMap.addEntries([m, w]);

  var test = {}; // ist a MAP !

  // check if key is exist in map
  final String? userinput = stdin.readLineSync();
  if (userinput != null) {
    print(wordsCount(userinput));
    print(charsCount(userinput));
  }

  List<String> input = [];
  final String? stringInput = stdin.readLineSync();
  if (stringInput != null) {
    input.addAll(stringInput.trim().split(' '));
  } else {
    print('your input is NOT valid !!');
  }

  print(toMap(input));
}

Map toMap(List<String> input) {
  Map<String, List<String>> words = {};

  for (String word in input) {
    String first = word[0];
    if (words[first] != null) {
      words[first]?.add(word);
    } else {
      words[first] = [word];
    }
  }
  return words;
}

Map wordsCount(String s) {
  final List<String> words = s.split(' ');
  final Map<String, int> wordsCount = {};

  for (var w in words) {
    if (wordsCount[w] != null) {
      int count = wordsCount[w]!;
      wordsCount[w] = ++count;
    } else {
      wordsCount[w] = 1;
    }
  }
  return wordsCount;
}

Map charsCount(String s) {
  final List<String> chars = s.split('');
  final Map<String, int> charsCount = {};

  for (var c in chars) {
    if (charsCount[c] != null) {
      int count = charsCount[c]!;
      charsCount[c] = ++count;
    } else {
      charsCount[c] = 1;
    }
  }
  return charsCount;
}

int Function(int, int) fun1 = (val1, val2) => val1 * val2;
int Function(int) fun2 = (val) => fun1(val, 5);
// List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
// print(apply(list, mulBy5));

// list.forEach((item) {
//   print(item * 10);
// });

// List<String> lst2 = list.map((item) => item.toString()).toList();
// print(lst2);

int Function(int) mulBy5 = (int value) => value * 5;

List<int> apply(List<int> list, int Function(int) mul) {
  List<int> res = [];
  for (var item in list) {
    int tmp = mul(item);
    res.add(tmp);
  }
  return res;
}
