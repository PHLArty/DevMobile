import '../models/StaffSelling.dart';
import '../models/staff.dart';

void main(){
  Staff sta = Staff('Sta001', 'Haidilao Suyun', 500000);
  sta.displayInformation();

  var staffSelling = StaffSelling('SS001', 'Camabaca Soudo', 500000, 0.02, 1000);

  staffSelling.displayInformation();
}