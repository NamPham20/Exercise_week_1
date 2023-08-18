void main(List<String> args) {
  int number = 10000;
  int countOf3 = 0;
  int countOf5 = 0;
  for (int i = 1; i <= number; i++) {
    if (i % 3 == 0) {
      countOf3++;
    }
    if (i % 5 == 0) {
      countOf5++;
    }
  }
  print("Total number divisible 3 : $countOf3");
  print("Total number divisible 5 : $countOf5");
}
