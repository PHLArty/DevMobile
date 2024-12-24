class Student {
  String _fullName;
  String _codeStudent;
  int _age;
  double _average;

  // Constructor
  Student(this._age, this._average, this._codeStudent, this._fullName);

  // Getters
  String get fullName => _fullName;
  double get average => _average;
  String get codeStudent => _codeStudent;
  int get age => _age;

  //Setters
  set fullName(String fullName) {
    if (fullName.isNotEmpty) {
      _fullName = fullName;
    }
  }

  set age(int age) {
    _age = (age > 0) ? age : _age;
  }

  set average(double average) {
    _average = (average < 0 || average > 10) ? _average : average;
  }

  set codeStudent(String codeStudent) {
    _codeStudent = (codeStudent.length > 10) ? codeStudent : _codeStudent;
  }

  // methods
  void displayInformationStudent() {
    print('Full Name: $fullName');
    print('Age: $age');
    print('Code student: $codeStudent');
    print('Average score: $average');
  }

  String classification() {
    if (_average >= 8) 
      return "Excellent";
    if (_average >= 6.5) 
      return "Good";
    if (_average >= 5) 
      return "Average rating";
    return "Weak rating";
    
  }
}
