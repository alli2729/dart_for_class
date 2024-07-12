/*
Ali Karimi
*/

import 'dart:io';

void main(List<String> args) {
  void reverseNumber() {
    stdout.write("Enter number : ");
    String? num = stdin.readLineSync();
    if (num != null) {
      int number = int.parse(num);
      int reversedNumber = 0;
      while (number > 0) {
        int digit = number % 10;
        reversedNumber = reversedNumber * 10 + digit;
        number = number ~/ 10;
      }
      print(reversedNumber);
    }
  }

  void sumOfNumber() {
    stdout.write("Enter number : ");
    String? num = stdin.readLineSync();
    if (num != null) {
      int number = int.parse(num);
      int sum = 0;
      while (number > 0) {
        int digit = number % 10;
        sum = sum + digit;
        number = number ~/ 10;
      }
      print(sum);
    }
  }

  void palindromNumber() {
    stdout.write("Enter number : ");
    String? num = stdin.readLineSync();
    if (num != null) {
      int number = int.parse(num);
      int oldNumber = number;
      int palindrom = 0;
      while (number > 0) {
        int digit = number % 10;
        palindrom = palindrom * 10 + digit;
        number = number ~/ 10;
      }
      if (palindrom == oldNumber) {
        print("it is Palindrom !!");
      } else {
        print("it is NOT Palindrom !!");
      }
    }
  }

  void maximumNumber() {
    int num, max;
    stdout.write("How many input : ");
    String? n = stdin.readLineSync();
    if (n != null) {
      List<int> list = [];
      num = int.tryParse(n)!;
      for (var i = 0; i < num; i++) {
        stdout.write("Enter : ");
        String? input = stdin.readLineSync();
        if (input != null) {
          int numInput = int.parse(input);
          list.add(numInput);
        }
      }
      max = list[0];
      for (var i = 0; i < list.length; i++) {
        if (list[i] > max) {
          max = list[i];
        }
      }

      print(list);
      print("max is $max");
    }
  }

  void prime() {
    for (var num = 2; num <= 100; num++) {
      bool isPrime = true;
      for (var i = 2; i <= num / 2; i++) {
        if (num % i == 0) {
          isPrime = false;
        }
      }
      if (isPrime) {
        print(num);
      }
    }
  }

  // reverseNumber();

  // sumOfNumber();

  // palindromNumber();

  // maximumNumber();

  // prime();
}
