import 'dart:math';

void main(List<String> args) {
  List<int> mlist = [5, 2, 7, 10, 1, 13, 4];
  int maxNumber = mlist[0];
  int sumOfList = 0;
  //1.Tìm giá trị lớn nhất trong mảng
  //2.Tổng các phần tử trong mảng
  for (int i in mlist) {
    if (maxNumber < i) maxNumber = i;
    sumOfList += i;
  }
  print("1.Số lớn nhất trong mảng là : $maxNumber");
  print("2.Tổng các phần tử trong mảng : $sumOfList");

  //3.in các số chẵn trong mảng
  //4.in số nguyên tố trong mảng
  List<int> listEvenNumber = [];
  List<int> listPrimeNumber = [];

  for (int j in mlist) {
    if (j % 2 == 0) {
      listEvenNumber.add(j);
    }
    if (isPrimeNumber(j)) {
      listPrimeNumber.add(j);
    }
  }
  print("3.Số chẵn trong mảng :$listEvenNumber");
  print("4.Số nguyên tố trong mảng : $listPrimeNumber");

  //5.đảo thứ tự mảng
  List<int> reverseList = [];
  reverseList = reverseOrder(mlist);
  print("5.Mảng đã đảo ngược : $reverseList");

  //6.Xắp xếp mảng tăng dần
  mlist.sort();
  print("6.Mảng đã xắp xếp : $mlist");
}

bool isPrimeNumber(int x) {
  if (x < 2) return true;

  for (int i = 2; i <= sqrt(x); i++) {
    if (x % i == 0) {
      return false;
    }
  }
  return true;
}

List<int> reverseOrder(List<int> list) {
  List<int> reverseList = [];
  for (int i = list.length - 1; i >= 0; i--) {
    reverseList.add(list[i]);
  }
  return reverseList;
}
