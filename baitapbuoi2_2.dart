void main(List<String> args) {
  Student student = Student("123", "Nam Pham", 20, 30, "Bad Student");
  student.display();
}

abstract class PersonSample {
  void input();
  void display();
}

class Person implements PersonSample {
  var id;
  var name;
  var _age;

  Person(this.id, this.name, this._age);

  String get Id => id;
  set Id(String id) {
    this.id = id;
  }

  String get Name => name;
  set Name(String name) {
    this.name = name;
  }

  int get Age => _age;
  set Age(int age) {
    this._age = age;
  }

  @override
  void input() {}

  @override
  void display() {
    print("Id : $id");
    print("Name : $name");
    print("Age : $_age");
  }
}

class Student extends Person {
  int _mark;
  String _grade;

  Student(String id, String name, int age, this._mark, this._grade)
      : super(id, name, age);

  int get Mark => _mark;
  set Mark(int mark) {
    this._mark = mark;
  }

  String get Grade => _grade;

  @override
  void display() {
    super.display();
    print("Mark: $_mark");
    print("Grade: $_grade");
  }
}
