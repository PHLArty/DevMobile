
import 'main.dart';

class classroom {
  List<Student> _studentClassroom; 
  String _nameClass;

  classroom(this._studentClassroom, this._nameClass );

  List<Student> get studentClassroom => _studentClassroom;
  String get nameClass => _nameClass;

  //Setters
  set studentList(List<Student> studentList){
    _studentClassroom = (studentList.isNotEmpty)? studentList : _studentClassroom;
  }
  set nameClass(String nameClass) {
    _nameClass = (nameClass.isNotEmpty)? nameClass: _nameClass;
  }

  //function 
  void addStudent(Student student) {
    studentClassroom.add(student);
  }

  void displayStudentList(){
    print('\n--------------------\n');
    print('Name class: $nameClass');
    for(var s in studentClassroom){
      print('Information');
      s.displayInformationStudent();
      print('Classification: ${s.classification()}');
    }
  }
}