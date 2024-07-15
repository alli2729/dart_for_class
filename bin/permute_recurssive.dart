/*
  Ali Karimi
  Finds all permutations of the input word 
  with the help of (swap) function, recursively.
 */

void main(List<String> arguments) {
  String input = 'ABC';
  int end = input.length - 1;
  permute(input, 0, end);
}

void permute(String str, int start, int end) {
  if (start == end) {
    print(str);
  } else {
    for (var i = start; i <= end; i++) {
      str = swap(str, start, i);
      permute(str, start + 1, end);
      // backtracking
      str = swap(str, start, i);
    }
  }
}

// swaps [i] with [j]
String swap(String string, int i, int j) {
  List<String> list = string.split('');
  String tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
  return list.join('');
}
