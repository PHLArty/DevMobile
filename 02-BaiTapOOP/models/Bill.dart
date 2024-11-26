import 'Phone.dart';

class Bill {
  String _codeBill; // Bill code
  DateTime _dateSelling; // Selling date
  Phone _phoneSelling; // Sold phone information
  int _amountBuy; // Quantity purchased
  double _priceFact; // Actual selling price
  String _nameCustomer; // Customer name
  String _numberPhoneCustomer; // Customer phone number

  // Constructor
  Bill(
    this._codeBill,
    this._dateSelling,
    this._phoneSelling,
    this._amountBuy,
    this._priceFact,
    this._nameCustomer,
    this._numberPhoneCustomer,
  );

  // Getters
  String get codeBill => _codeBill;
  DateTime get dateSelling => _dateSelling;
  Phone get phoneSelling => _phoneSelling;
  int get amountBuy => _amountBuy;
  double get priceFact => _priceFact;
  String get nameCustomer => _nameCustomer;
  String get numberPhoneCustomer => _numberPhoneCustomer;

  // Setters
  set codeBill(String codeBill) {
    // Validate the bill code format (e.g., HD-001)
    if (codeBill.isNotEmpty && RegExp(r'^HD-\d{3}$').hasMatch(codeBill)) {
      _codeBill = codeBill;
    }
  }

  set dateSelling(DateTime dateSelling) {
    // Ensure the selling date is not in the future
    if (dateSelling.isBefore(DateTime.now()) || dateSelling.isAtSameMomentAs(DateTime.now())) {
      _dateSelling = dateSelling;
    }
  }

  set amountBuy(int amountBuy) {
    // Validate the purchase quantity (greater than 0 and not exceeding stock)
    if (amountBuy > 0 && amountBuy <= _phoneSelling.amount) {
      _amountBuy = amountBuy;
    }
  }

  set priceFact(double priceFact) {
    // Ensure the selling price is positive
    if (priceFact > 0) {
      _priceFact = priceFact;
    }
  }

  set nameCustomer(String nameCustomer) {
    // Ensure the customer name is not empty
    if (nameCustomer.isNotEmpty) {
      _nameCustomer = nameCustomer;
    }
  }

  set numberPhoneCustomer(String numberPhoneCustomer) {
    // Validate the customer phone number (10 digits)
    if (RegExp(r'^\d{10}$').hasMatch(numberPhoneCustomer)) {
      _numberPhoneCustomer = numberPhoneCustomer;
    }
  } 

  // Calculate the total price of the bill
  double calculateTotalPrice() {
    return _amountBuy * _priceFact;
  }

  // Calculate the actual profit from the bill
  double calculateActualProfit() {
    double profitPerUnit = _priceFact - _phoneSelling.importPrice;
    return profitPerUnit * _amountBuy;
  }

  // Display bill information
  void displayBillInfo() {
    print("Bill Code: $_codeBill");
    print("Selling Date: $_dateSelling");
    print("Product Information:");
    print("  - Name: ${_phoneSelling.namePhone}");
    print("  - Brand: ${_phoneSelling.brandProduct}");
    print("  - Import Price: \$${_phoneSelling.importPrice}");
    print("  - Selling Price: \$${_priceFact}");
    print("Quantity Purchased: $_amountBuy");
    print("Total Price: \$${calculateTotalPrice()}");
    print("Actual Profit: \$${calculateActualProfit()}");
    print("Customer Information:");
    print("  - Name: $_nameCustomer");
    print("  - Phone Number: $_numberPhoneCustomer");
  }
}
