import 'dart:io';

void main() {
  int? number; // Declare as nullable to handle parsing errors.
  do {
    stdout.write("Enter one integer number: ");
    String? input = stdin.readLineSync();

    // Parse input as an integer
    number = int.tryParse(input ?? '');
    if (number == null || number < 1) {
      print("Invalid input. Please enter a positive integer.");
    } else {
      // Convert to binary string
      String binary = number.toRadixString(2);
      print("The binary representation of $number is $binary.");
    }
  } while (number == null || number < 1);
}
