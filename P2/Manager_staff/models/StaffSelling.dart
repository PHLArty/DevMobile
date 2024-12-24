
import 'staff.dart';

class StaffSelling extends Staff{
  double _rose;
  double _sales;

  StaffSelling(String codeStaff, String fullName, double salary,this._rose, this._sales): super(codeStaff, fullName, salary);

  double get rose => _rose;
  double get sales => _sales;

  set rose(double rose){
    if(rose > 0){
      _rose = rose;
    }
  } 
  set sales(double sales){
    if(sales > 0){
      _sales = sales;
    }
  }

  // function
  @override
  double caculatorSalary(){
    return salary + (_sales * _rose);
  }

  @override
  void displayInformation(){
    super.displayInformation();
    print('Rose: $rose');
    print('sales: $sales');
  }
}