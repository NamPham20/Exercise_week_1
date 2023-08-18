void main(List<String> args) {
  var student1 =
      Student(3804, "Phạm Phương Nam", "05/06/2002", "0367289425", 9, 7, 9);
  var student2 =
      Student(3805, "Phạm Hải Bắc", "02/07/2017", "0123456789", 4, 6, 3);
  var student3 =
      Student(3804, "Phạm Duy Linh", "28/08/2002", "9876543210", 9, 7.5, 6);
  print("Information Of Student 1: ${student1.getInfoStudent(student1)}");
  print("   Điểm trung Bình : ${student1.GpaOfStudent(student1)}");
  print("   Xếp Loại : ${student1.studentRating(student1)}");

  print("Information Of Student 1: ${student2.getInfoStudent(student2)}");
  print("   Điểm trung Bình : ${student2.GpaOfStudent(student2)}");
  print("   Xếp Loại : ${student2.studentRating(student2)}");

  print("Information Of Student 1: ${student3.getInfoStudent(student3)}");
  print("   Điểm trung Bình : ${student3.GpaOfStudent(student3)}");
  print("   Xếp Loại : ${student3.studentRating(student3)}");

  List<Student> listScores = [];
  listScores.add(student1);
  listScores.add(student2);
  listScores.add(student3);
  double maxScores = student1.GpaOfStudent(student1);
  int index = 0;
  for (int i = 0; i < listScores.length; i++) {
    if (maxScores < listScores[i].GpaOfStudent(listScores[i])) {
      maxScores = listScores[i].GpaOfStudent(listScores[i]);
      index = i;
    }
  }
  print(
      "\nHọc sinh có điểm trung bình lớn nhất là : ${listScores[index].name}");
}

class Student {
  var stId;
  var stName;
  var _stDateOfBirth;
  var phoneNumber;
  var mathScores;
  var litSorces;
  var englishSorces;

  Student(stId, stName, _stDateOfBirth, phoneNumber, mathScores, litSorces,
      englishSorces) {
    this.stId = stId;
    this.stName = stName;
    this._stDateOfBirth = _stDateOfBirth;
    this.phoneNumber = phoneNumber;
    this.mathScores = mathScores + 0.0;
    this.litSorces = litSorces + 0.0;
    this.englishSorces = englishSorces + 0.0;
  }

  int get Id => stId;
  set Id(var stId) {
    this.stId = stId;
  }

  String get name => stName;
  set name(var stName) {
    this.stName = stName;
  }

  String get dateOfBirth => _stDateOfBirth;
  set dateOfBirth(var dateOfBirth) {
    this._stDateOfBirth = dateOfBirth;
  }

  String get PhoneNumber => this.phoneNumber;
  set PhoneNumber(var phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  double get MathScores => mathScores;
  set MathScores(double mathScores) {
    this.mathScores = mathScores;
  }

  double get LitScores => litSorces;
  set LitScores(double liScores) {
    this.litSorces = liScores;
  }

  double get EnglishScores => englishSorces;
  set English(double englishScores) {
    this.englishSorces = englishScores;
  }

  Map getInfoStudent(Student studen) {
    Map<dynamic, dynamic> infStudent = {};
    infStudent['Id Student'] = studen.Id;
    infStudent["Name Student"] = studen.name;
    infStudent["Date Of Birth"] = studen.dateOfBirth;
    infStudent["Phone Number"] = studen.PhoneNumber;
    return infStudent;
  }

  String studentRating(Student student) {
    double averScorse;
    averScorse = student.GpaOfStudent(student);
    if (averScorse >= 8) {
      return "Excellent student";
    } else if (averScorse < 8 && averScorse >= 6.5) {
      return "Good Student";
    } else
      return "Bad Student";
  }

  double GpaOfStudent(Student student) {
    double averScorse;
    averScorse = (student.MathScores.toDouble() +
            student.LitScores.toDouble() +
            student.EnglishScores.toDouble()) /
        3;
    return averScorse;
  }
}
