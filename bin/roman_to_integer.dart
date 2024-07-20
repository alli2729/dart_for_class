/*
  ALI KARIMI
  converting Roman numerals to Integer
  if low value digit comes before high value digit ,
  we should subtract from the high value digit 
  EX : 
  VI => (I : 1 , V = 5) => (5 + 1 = 6)
  IV => (I : 1 , V = 5) => (5 - 1 = 4)

*/
void main(List<String> args) {
  String romiNumber = 'MCMXCIV'; // 1994
  print(romanToInt(string: romiNumber));
}

int romanToInt({required String string}) {
  // creating map of Roman numerals and their integer values
  Map<String, int> roman = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  };
  int integer = 0;
  // iterate on string
  for (var i = 0; i < string.length; i++) {
    // if its the last word of string then there is no two digit number
    // if there is two digit number we must subtract from summation
    if (i < string.length - 1 && (roman[string[i]]! < roman[string[i + 1]]!)) {
      integer -= roman[string[i]]!;
    } else {
      integer += roman[string[i]]!;
    }
  }
  return integer;
}
