void main(List<String> args) {
  int sum = 0;
  for (int i = 1; i <= 15; i++) {
    if (i % 2 == 0) {
      print(i);
    }
    sum += i;
  }
  print("Sum = $sum");
}
