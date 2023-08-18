void main(List<String> args) {
  int number1 = 8;
  int number2 = 25;
  int result = 1;
  for (int i = 1; i <= number1; i++) {
    result *= i;
  }
  print("$number1 ! = $result");
  for (int j = 1; j < number2; j++) {
    if (j % 2 == 1) {
      print("$j ");
    }
  }
}
