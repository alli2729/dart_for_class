/*

  ? Ali Karimi

*/

void main(List<String> args) {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(apply(list, mulBy5));

  list.forEach((item) {
    print(item * 10);
  });

  List<String> lst2 = list.map((item) => item.toString()).toList();
  print(lst2);
}

int Function(int) mulBy5 = (int value) => value * 5;

List<int> apply(List<int> list, int Function(int) mul) {
  List<int> res = [];
  for (var item in list) {
    int tmp = mul(item);
    res.add(tmp);
  }
  return res;
}
