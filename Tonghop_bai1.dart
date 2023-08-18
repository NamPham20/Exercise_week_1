void main(List<String> args) {
  int number = 400;
  int i = 2;
  int sum = 0;
  while (sum + i <= number) {
    if (i % 2 == 0) {
      print(i);
      sum += i;
    }
    i++;
  }
}
