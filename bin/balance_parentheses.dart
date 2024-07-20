/*
Ali Karimi
Cheking open and close Parentheses by using Stack
*/
void main(List<String> args) {
  String text_0 = "( a + ( c * d ) )";
  print(balance(text: text_0)); // true

  String text_1 = "( a + ( c * d ) ) )";
  print(balance(text: text_1)); // false
}

bool balance({required String text}) {
  // implementing stack
  // stack is empty
  List<String> stack = ['#'];

  for (var i = 0; i < text.length; i++) {
    if (text[i] == '(') {
      // if it is '(' then pushs it to stack
      stack.add('(');
    } else if (text[i] == ')') {
      // if its ')' pop from stack
      stack.removeLast();
    }
  }
  // checks if stack is empty and valid
  if (stack.length == 1 && stack[0] == '#') {
    return true;
  } else {
    return false;
  }
}
