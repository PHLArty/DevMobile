class Staff{
  String _codeStaff;
  String _fullName;
  double _salary;

  Staff(this._codeStaff, this._fullName, this._salary);

  String get codeStaff => _codeStaff;
  String get fullName => _fullName;
  double get salary => _salary;

  // Setters
  set codeStaff(String codeStaff){
    if(codeStaff.length <  10){
      _codeStaff = codeStaff;
    }
  }
  set fullName(String fullName){
    if(fullName.isNotEmpty){
      _fullName = fullName;
    }
  }
  set salary(double salary){
    _salary = (salary < 1)? _salary: salary; 
  }

  double caculatorSalary(){
    return _salary;
  }

  void displayInformation(){
    print('Code Staff: $codeStaff');
    print('Full name: $fullName');
    print('Salary: $salary');
    print('Total salary: ${caculatorSalary()}');
  }
}