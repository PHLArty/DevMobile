void main(){
  var name= 'Arty';
  int tuoi= 25;

  // null safety
  String? nameNullAble;
  nameNullAble = null;
  
  // late
  late String description;
  description = 'Dev mobile';

  // final and const
  final String country;
  country = 'Vietnam';
  // country = 'Lao' -> error

  const int year = 2024;

  print('year: $year');
}