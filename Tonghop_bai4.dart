void main(List<String> args) {
  Map<String, int> scores = {'John': 30, 'Alice': 90, 'Bob': 75, 'Eve': 85};
  int sum = 0;
  scores.forEach((key,value) {
    sum = sum + value;
  });
  print(sum);
}
