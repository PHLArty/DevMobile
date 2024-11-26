import 'Phone.dart';
import 'Bill.dart';

class Shop {
  String _nameShop;
  String _address;
  List<Phone> _phoneList = [];
  List<Bill> _billList = [];

  // Constructor with name and address
  Shop(this._nameShop, this._address);

  // Getters
  String get nameShop => _nameShop;
  String get address => _address;
  List<Phone> get phoneList => _phoneList;
  List<Bill> get billList => _billList;

  // Setters with validation
  set nameShop(String nameShop) {
    if (nameShop.isNotEmpty) {
      _nameShop = nameShop;
    } else {
      throw ArgumentError("Shop name cannot be empty.");
    }
  }

  set address(String address) {
    if (address.isNotEmpty) {
      _address = address;
    } else {
      throw ArgumentError("Shop address cannot be empty.");
    }
  }

  // --------------------- Phone Management Methods ---------------------

  /// Add a new phone to the phone list.
  void addPhone(Phone newPhone) {
    if (_phoneList.any((phone) => phone.idPhone == newPhone.idPhone)) {
      print("A phone with ID ${newPhone.idPhone} already exists.");
    } else {
      _phoneList.add(newPhone);
      print("Added phone ${newPhone.namePhone} to the inventory.");
    }
  }

  /// Update phone information by ID.
  void updatePhone(String idPhone, Phone updatedPhone) {
    for (int i = 0; i < _phoneList.length; i++) {
      if (_phoneList[i].idPhone == idPhone) {
        _phoneList[i] = updatedPhone;
        print("Updated phone information for ID $idPhone.");
        return;
      }
    }
    print("No phone found with ID $idPhone.");
  }

  /// Discontinue a phone by marking its status as false.
  void discontinuePhone(String idPhone) {
    for (Phone phone in _phoneList) {
      if (phone.idPhone == idPhone) {
        phone.status = false;
        print("Discontinued phone with ID $idPhone.");
        return;
      }
    }
    print("No phone found with ID $idPhone.");
  }

  /// Search for phones by optional criteria (ID, brand, or name).
  List<Phone> searchPhone(
      {String? idPhone, String? brandPhone, String? namePhone}) {
    return _phoneList.where((phone) {
      bool matchId = idPhone != null ? phone.idPhone == idPhone : true;
      bool matchBrand = brandPhone != null
          ? phone.brandProduct.toLowerCase().contains(brandPhone.toLowerCase())
          : true;
      bool matchName = namePhone != null
          ? phone.namePhone.toLowerCase().contains(namePhone.toLowerCase())
          : true;
      return matchId && matchBrand && matchName;
    }).toList();
  }

  /// Display the list of all phones in the inventory.
  void displayPhoneList() {
    if (_phoneList.isEmpty) {
      print("No phones available in the inventory.");
    } else {
      print("Phone List:");
      for (Phone phone in _phoneList) {
        print(
            "- ID: ${phone.idPhone}, Name: ${phone.namePhone}, Brand: ${phone.brandProduct}, Selling Price: \$${phone.sellingPrice}, Status: ${phone.status ? "Active" : "Discontinued"}");
      }
    }
  }

  // --------------------- Bill Management Methods ---------------------

  /// Create a new bill and update the inventory.
  void createBill(
      String codeBill,
      DateTime dateSelling,
      String idPhone,
      int amountBuy,
      double priceFact,
      String nameCustomer,
      String numberPhoneCustomer) {
    // Find the phone by ID
    Phone? selectedPhone;
    try {
      selectedPhone =
          _phoneList.firstWhere((phone) => phone.idPhone == idPhone);
    } catch (e) {
      selectedPhone = null; // Không tìm thấy sản phẩm
    }

    if (selectedPhone == null) {
      print("Phone with ID $idPhone not found.");
      return;
    }

    // Check inventory
    if (amountBuy > selectedPhone.amount) {
      print("Insufficient stock. Available: ${selectedPhone.amount}.");
      return;
    }

    // Update inventory
    selectedPhone.amount -= amountBuy;

    // Create a new bill and add it to the list
    Bill newBill = Bill(codeBill, dateSelling, selectedPhone, amountBuy,
        priceFact, nameCustomer, numberPhoneCustomer);
    _billList.add(newBill);

    print("Bill $codeBill created successfully.");
  }

  /// Search for bills by optional criteria (code, date, or customer name).
  List<Bill> searchBill(
      {String? codeBill, DateTime? dateSelling, String? nameCustomer}) {
    return _billList.where((bill) {
      bool matchCode = codeBill != null ? bill.codeBill == codeBill : true;
      bool matchDate =
          dateSelling != null ? bill.dateSelling == dateSelling : true;
      bool matchName = nameCustomer != null
          ? bill.nameCustomer.toLowerCase().contains(nameCustomer.toLowerCase())
          : true;
      return matchCode && matchDate && matchName;
    }).toList();
  }

  /// Display the list of all bills.
  void displayBillList() {
    if (_billList.isEmpty) {
      print("No bills available.");
    } else {
      print("Bill List:");
      for (Bill bill in _billList) {
        print(
            "- Code: ${bill.codeBill}, Date: ${bill.dateSelling}, Customer: ${bill.nameCustomer}, Total Price: \$${bill.calculateTotalPrice()}");
      }
    }
  }

  // --------------------- Statistical Methods ---------------------

  /// Calculate total revenue between two dates.
  double calculateTotalRevenue(DateTime startDate, DateTime endDate) {
    return _billList
        .where((bill) =>
            bill.dateSelling.isAfter(startDate) &&
            bill.dateSelling.isBefore(endDate))
        .fold(0, (sum, bill) => sum + bill.calculateTotalPrice());
  }

  /// Calculate total profit between two dates.
  double calculateTotalProfit(DateTime startDate, DateTime endDate) {
    return _billList
        .where((bill) =>
            bill.dateSelling.isAfter(startDate) &&
            bill.dateSelling.isBefore(endDate))
        .fold(0, (sum, bill) => sum + bill.calculateActualProfit());
  }

  /// Get the top N best-selling phones.
  List<Phone> topSellingPhones(int topN) {
    // Calculate total sales for each phone
    Map<String, int> salesCount = {};
    for (Bill bill in _billList) {
      String idPhone = bill.phoneSelling.idPhone;
      salesCount[idPhone] = (salesCount[idPhone] ?? 0) + bill.amountBuy;
    }

    // Sort by sales count
    List<String> sortedIds = salesCount.keys.toList()
      ..sort((a, b) => salesCount[b]!.compareTo(salesCount[a]!));

    // Return the top N phones
    return sortedIds
        .take(topN)
        .map((id) => _phoneList.firstWhere((phone) => phone.idPhone == id))
        .toList();
  }

  /// Generate an inventory report.
  void inventoryReport() {
    if (_phoneList.isEmpty) {
      print("No products in stock.");
    } else {
      print("Inventory Report:");
      for (Phone phone in _phoneList) {
        print(
            "- ID: ${phone.idPhone}, Name: ${phone.namePhone}, Stock: ${phone.amount}");
      }
    }
  }
}
