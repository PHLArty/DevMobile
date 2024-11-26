import '../models/Bill.dart';
import '../models/Phone.dart';
import '../models/Shop.dart';

void main() {
  // Create a shop
  Shop myShop = Shop("TechStore", "123 Main Street");

  // ----------------- Manage phones -----------------
  print("=== Managing Phone Information ===");
  // Add new phones
  myShop.addPhone(Phone("DT-001", "iPhone 15", "Apple", 1000.0, 1200.0, 10, true));
  myShop.addPhone(Phone("DT-002", "Galaxy S23", "Samsung", 15, 1000.0,10, true));
  myShop.addPhone(Phone("DT-003", "Pixel 8", "Google", 8, 900.0, 20, true));

  // Update phone information
  myShop.updatePhone(
      "P003", Phone("DT-003", "Pixel 8 Pro", "Google", 10, 950.0,20, true));

  // Display phone list
  myShop.displayPhoneList();

  // Search for phones
  print("\nSearch phones by name:");
  List<Phone> searchResults =
      myShop.searchPhone(namePhone: "iPhone");
  for (Phone phone in searchResults) {
    print("- ${phone.namePhone}, Brand: ${phone.brandProduct}, Price: \$${phone.sellingPrice}");
  }

  // Discontinue a phone
  myShop.discontinuePhone("P002");
  myShop.displayPhoneList();

  // ----------------- Manage bills -----------------
  print("\n=== Managing Bills ===");
  // Create a valid bill
  myShop.createBill("B001", DateTime(2024, 11, 1), "P001", 2, 2400.0, "John Doe",
      "123456789");

  // Create an invalid bill (insufficient stock)
  myShop.createBill("B002", DateTime(2024, 11, 2), "P003", 12, 11400.0,
      "Alice Smith", "987654321");

  // Display bill list
  myShop.displayBillList();

  // Search for bills
  print("\nSearch bills by customer name:");
  List<Bill> billSearchResults =
      myShop.searchBill(nameCustomer: "John");
  for (Bill bill in billSearchResults) {
    print("- Code: ${bill.codeBill}, Date: ${bill.dateSelling}, Total Price: \$${bill.calculateTotalPrice()}");
  }

  // ----------------- Statistics and Reports -----------------
  print("\n=== Statistics and Reports ===");
  // Calculate revenue within a time range
  double revenue = myShop.calculateTotalRevenue(
      DateTime(2024, 10, 31), DateTime(2024, 11, 30));
  print("Total Revenue: \$${revenue}");

  // Calculate profit within a time range
  double profit = myShop.calculateTotalProfit(
      DateTime(2024, 10, 31), DateTime(2024, 11, 30));
  print("Total Profit: \$${profit}");

  // Get top-selling phones
  List<Phone> topPhones = myShop.topSellingPhones(2);
  print("\nTop Selling Phones:");
  for (Phone phone in topPhones) {
    print("- ${phone.namePhone}, Brand: ${phone.brandProduct}");
  }

  // Inventory report
  myShop.inventoryReport();
}
