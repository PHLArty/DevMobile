import '../models/classroom.dart';
import '../models/main.dart';

void main(){
  var s1 = Student(20, 8.5, 'S001', 'Join master');
  var s2 = Student(18, 7.5, 'S002', 'Join maddie');
  // print(s.fullName);
  // s.displayInformationStudent();
  // print("--------------");
  // s.fullName = "Sonia jenie";
  // s.displayInformationStudent();
  // print("----------------");
  // s.fullName = '';
  // s.displayInformationStudent();
  // print("----------------");
  // // Test function classification
  // print(s.classification());

  // Create Student objects

  // Create a list of students
  List<Student> students = [s1, s2];

  // Create a classroom
  var class_room = classroom(students, "21DTHF1");

  // Test adding a new student
  var s3 = Student(19, 9.0, 'S003', 'Join alex');
  class_room.addStudent(s3);

  // Display the student list
  class_room.displayStudentList();
}
