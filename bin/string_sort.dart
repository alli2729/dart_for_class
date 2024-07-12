void main(List<String> arguments) {
  List<String> word = [
    "a",
    "",
    "abc",
    "de",
    "frss",
    "saawwqqqs",
    "",
    "r",
    "ab",
    "zxc"
  ];
  List<String> stringSort({required List<String> list}) {
    int n = list.length - 1;
    // implementing Bubble Sort
    for (var i = 1; i <= n; i++) {
      for (var j = 0; j <= n - 1; j++) {
        if (list[j].length > list[j + 1].length) {
          String temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
    return list;
  }

  print(stringSort(list: word));
}
