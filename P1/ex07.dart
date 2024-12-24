import 'dart:io';
import 'dart:math';

void main() {
  int n = 0, result = 0, i = 1;
  do{
    stdout.write("Enter one number interger:");
    String? input = stdin.readLineSync();
    if(input != null){
      n = int.tryParse(input) ?? 0;
      do{
        if(n%i == 0)
        {
          result +=i;
        }
        i++;
      }while(i<=n);
    }
  }while(n<1);
  print("Result: ${result}");
}