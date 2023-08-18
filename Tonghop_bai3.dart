void main(List<String> args) {
  List<int> list = [4, 3, 10, 9, 15, 7, 6, 5, 8];
  int sum = 0;
  for (int i in list) {
    if (i % 3 == 0) {
      sum += i;
    }
  }
  print(sum);
}
