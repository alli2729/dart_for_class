import 'dart:math';

void main(List<String> args) async {
  printName(sec: 3).then((value) => print(value));
  greet();
  timer(sec: 5);
  for (var i = 0; i < 5; i++) {
    await _fetchInformation()
        .then((value) => print(value))
        .catchError((e) => print('oops'));
  }
  await hello().then(
    (value) => print(value),
  );
}

Future<String> _fetchInformation() async {
  await Future.delayed(Duration(seconds: 2));
  final bool hasError = Random().nextBool();

  if (hasError) {
    throw Error();
  } else {
    return 'info';
  }
}

Future<String> printName({required int sec}) async {
  await Future.delayed(Duration(seconds: sec));
  return 'My name is Alan !';
}

Future<void> timer({required int sec}) async {
  int count = 1;
  while (count <= sec) {
    print(count++);
    await Future.delayed(Duration(seconds: 1));
  }
}

void greet() {
  print('greeing user...');
  fetchUser();
}

Future<void> fetchUser() async {
  int count = 4;
  while (count != 0) {
    await Future.delayed(Duration(seconds: 2));
    final Random random = Random();
    final int nameIndex = random.nextInt(4);
    final int lastNameIndex = random.nextInt(4);
    print('${names[nameIndex]} ${lastNames[lastNameIndex]}');
    count--;
  }
}

List<String> names = ['Ali', 'Hassan', 'Gholi', 'Asghar', 'Kazem'];
List<String> lastNames = [
  'Aliiii',
  'Hassaniii',
  'Gholiiii',
  'Asghariii',
  'Kazemiii'
];

Future<String> fetchHello() async {
  await Future.delayed(Duration(seconds: 1));
  return 'hello';
}

Future<String> fetchDear() async {
  await Future.delayed(Duration(seconds: 2));
  return 'dear';
}

Future<String> fetchUserr() async {
  await Future.delayed(Duration(seconds: 3));
  return 'user';
}

Future<String> hello() async {
  print(await fetchHello());
  print(await fetchDear());
  print(await fetchUserr());
  // print('${await fetchHello()} ${await fetchDear()} ${await fetchUserr()}');

  return '${await fetchHello().then(
    (value) => '$value',
  )} ${await fetchDear().then(
    (value) => '$value',
  )} ${await fetchUserr().then(
    (value) => '$value',
  )}';
}
