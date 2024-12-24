/*
Exercise: solve equadratic equation
*/
import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;
  do {
    stdout.write("Enter cofficient a (a different 0):");
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
    if (a == 0) {
      print("Cofficient must different 0. Please enter again!");
    }
  } while (a == 0);

  // Enter b
  stdout.write("Enter cofficient b:");
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    a = double.tryParse(inputB) ?? 0;
  }

  // Enter c
  stdout.write("Enter cofficient c:");
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    a = double.tryParse(inputC) ?? 0;
  }

  //Display result
  print('\n Equation: ${a}x^2 + ${b}x + ${c} = 0');

  //Caculate delta
  double delta = sqrt(b) - 4*a*c;
  print(delta);

  if(delta < 0)
  {
    print("Equation with no solution");
  } else if(delta == 0){
    print("Equation with double roots");
    double x = -b / (2 * a);
    // Làm tròn đến 2 chữ số thập phân
    x = double.parse(x.toStringAsFixed(2));
    print('Phương trình có nghiệm kép x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    // Làm tròn đến 2 chữ số thập phân
    x1 = double.parse(x1.toStringAsFixed(2));
    x2 = double.parse(x2.toStringAsFixed(2));
    print('Phương trình có 2 nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}
