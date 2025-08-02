// A. Define an interface named Role
abstract class Role {
  void displayRole();
}

// B. Create a class Person
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print("Role: Undefined");
  }
}

// C. Create a class Student that extends Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverage() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }

  void displayStudentInfo() {
    print("\nStudent Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverage().toStringAsFixed(1)}");
  }
}

// D. Create another class Teacher that extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayTeacherInfo() {
    print("\nTeacher Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (String course in coursesTaught) {
      print("- $course");
    }
  }
}

// E. Create a class StudentManagementSystem
void main() {
  // Creating a student
  Student student = Student(
    name: "Rabiul Islam",
    age: 20,
    address: "123 Main St",
    studentID: "S001",
    grade: "A",
    courseScores: [90, 85, 82],
  );

  // Creating a teacher
  Teacher teacher = Teacher(
    name: "Mr. Rabin Khan",
    age: 35,
    address: "456 Oak St",
    teacherID: "T001",
    coursesTaught: ["Math", "English", "Bangla"],
  );

  // Display information
  student.displayStudentInfo();
  teacher.displayTeacherInfo();
}
