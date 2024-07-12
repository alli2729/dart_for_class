/*
This is all the codes that written by ME for class
the topics are highlited and you can find them by searching the name of topic
*/

// importing needed libraries and packages
import 'dart:io';

// main function
void main(List<String> arguments) {}

// Simple input and output
void inputAndOutput() {
  stdout.write("Enter Your Name : ");
  final String? name = stdin.readLineSync();
  stdout.write("Enter Your Age : ");
  final String? age = stdin.readLineSync();

  if (name != null && age != null) {
    print("You Are $name and you are $age years old !");
  }
}

//* Finding Maximunm Number
void MaximumNumber() {
  stdout.write("Enter First Number : ");
  final String? num1 = stdin.readLineSync();
  stdout.write("Enter Secound Number : ");
  final String? num2 = stdin.readLineSync();
  stdout.write("Enter Last Number : ");
  final String? num3 = stdin.readLineSync();
  if (num1 != null && num2 != null && num3 != null) {
    final int? num11 = int.tryParse(num1);
    final int? num22 = int.tryParse(num2);
    final int? num33 = int.tryParse(num3);
    int? max = num11;
    if (num11 != null && num22 != null && num33 != null && max != null) {
      if (num22 > max) {
        max = num22;
      }
      if (num33 > max) {
        max = num33;
      }
    }
    print("MAX is : $max");
  }
}

//* a = (a-1)+(a-2)+...+(a-n)
void a() {
  int sum = 0;
  print("Enter Number: ");
  final String? number = stdin.readLineSync();
  if (number != null) {
    int num = int.parse(number);
    for (int i = num; i > 0; i--) {
      sum = sum + i;
    }
    print(sum);
  }
}

//* Fibbonachi
void fib() {
  print("Enter Number: ");
  final String? number = stdin.readLineSync();
  if (number != null) {
    int num = int.parse(number);
    if (num == 0) {
      print("0");
    } else if (num == 1) {
      print("0\t1");
    } else {
      int a = 0;
      int b = 1;
      int c;
      stdout.write("0\t1");
      for (var i = 0; i < num - 2; i++) {
        c = a + b;
        a = b;
        b = c;
        stdout.write("\t$c");
      }
    }
  }
}

//* Reversing Words
void reverseWord() {
  print("Enter Word: ");
  final String? word = stdin.readLineSync();
  if (word != null) {
    // List<String> newWord = word.split("");
    // print(newWord);

    // for (var i = newWord.length-1; i >= 0; i--) {
    //   stdout.write(newWord[i]);
    // }

    for (var i = word.length - 1; i >= 0; i--) {
      stdout.write(word[i]);
    }
  }
}

//* Similar words   //word.reversed.toList();
void anagramWord() {
  stdout.write("Enter your Word : ");
  final String? word = stdin.readLineSync();
  if (word != null) {
    final List<String> w = word.split("");
    List<String> op = [];
    bool? anagram;

    for (var i = w.length - 1; i >= 0; i--) {
      op.add(w[i]);
    }

    for (int i = 0; i < w.length; i += 1) {
      if (w[i] != op[i]) {
        anagram = false;
      } else
        anagram = true;
    }

    if (anagram == true)
      print("it is Anagram");
    else
      print("it is not Anagram");

    print(w);
    print(op);
  }
}

//* Simple Calculator
void calculator() {
  print("To Exit the programm Enter CTRL+C");
  while (true) {
    stdout.write("Enter First Number: ");
    final String? number1 = stdin.readLineSync();
    stdout.write("Enter Secound Number: ");
    final String? number2 = stdin.readLineSync();
    stdout.write("Enter Operation (+ , - , * , /) : ");
    final String? op = stdin.readLineSync();
    var ans;
    bool err = false;
    if (number1 != null && number2 != null) {
      int num1 = int.parse(number1);
      int num2 = int.parse(number2);

      switch (op) {
        case '+':
          ans = num1 + num2;
          break;
        case '-':
          ans = num1 - num2;
          break;
        case '*':
          ans = num1 * num2;
          break;
        case '/':
          if (num2 > 0) {
            ans = num1 / num2;
          } else {
            err = true;
            print("cant divide $num1 to 0  !");
          }
          break;
        default:
          print('wrong operation !');
          err = true;
          break;
      }

      if (err != true) {
        print("$num1 $op $num2 = $ans");
      } else {
        print("Wrong Input");
      }
    }
  }
}

//* Anagram
void anagram() {
  final String? word1 = stdin.readLineSync();
  final String? word2 = stdin.readLineSync();
  List<String>? w1, w2;
  bool isAnagram = true;

  if (word1 != null && word2 != null) {
    if (word1.length == word2.length) {
      w1 = word1.split("")..sort();
      w2 = word2.split("")..sort();
      for (int i = 0; i < w1.length; i++) {
        if (w1[i] != w2[i]) {
          isAnagram = false;
        }
      }
    }
    if (isAnagram) {
      print("its Anagram");
    } else
      print("its NOT Anagram");

    print(w1);
    print(w2);
  }
}

//* Rectangle
void rectangle() {
  int height = 10;
  int width = 8;
  int spaceCount = width - 2;
  for (var i = 1; i <= height; i++) {
    if (i == 1 || i == height) {
      stdout.write("*" * width);
    } else {
      stdout.write("*" + (" " * spaceCount) + "*");
    }
    print("");
  }
}

int fact(number) {
  if (number == 1) {
    return 1;
  }
  return number * fact(number - 1);
}

int fibo(int number) {
  if (number == 0 || number == 1) {
    return number;
  }
  return fibo(number - 1) + fibo(number - 2);
}

bool palindromChecker(String string, int start, int end) {
  if (start >= end) {
    return true;
  }
  if (string[start] == string[end]) {
    return palindromChecker(string, start + 1, end - 1);
  } else {
    return false;
  }
}

int sumNumber(int number) {
  if (number == 1) {
    return 1;
  }
  return (number % 10) + sumNumber(number ~/ 10);
}

void binarySearch(List<int> list, int target, int low, int high) {
  int mid = (low + high) ~/ 2;
  if (low == high) {
    if (list[mid] == target) {
      print("Found !");
    }
  } else if (low != high) {
    binarySearch(list, target, low, mid);
    binarySearch(list, target, mid + 1, high);
  }
}

void permute(String str, int start, int end) {
  if (start == end) {
    print(str);
  } else {
    for (var i = start; i <= end; i++) {
      str = swap(str, start, i);
      permute(str, start + 1, end);
      str = swap(str, start, i);
    }
  }
}

String swap(String string, int i, int j) {
  List<String> list = string.split('');
  String tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
  return list.join('');
}
