class Phone {
  String _idPhone; // Phone ID
  String _namePhone; // Phone name
  String _brandProduct; // Brand of the phone
  double _importPrice; // Price the store bought the phone for
  double _sellingPrice; // Price the phone is sold for
  int _amount; // Amount of phones in stock
  bool _status; // Whether the phone is available for sale

  // Constructor to initialize a new phone
  Phone(this._idPhone, this._namePhone, this._brandProduct, this._importPrice,
      this._sellingPrice, this._amount, this._status);

  // Getters for all properties
  String get idPhone => _idPhone;
  String get namePhone => _namePhone;
  String get brandProduct => _brandProduct;
  double get importPrice => _importPrice;
  double get sellingPrice => _sellingPrice;
  int get amount => _amount;
  bool get status => _status;

  // Setter for idPhone with validation
  set idPhone(String idPhone) {
    if (idPhone.isNotEmpty && RegExp(r'^DT-\d{3}$').hasMatch(idPhone)) {
      _idPhone = idPhone; // Valid ID format (e.g., DT-001)
    } else {
      _idPhone = _idPhone; // If invalid, keep the current ID
    }
  }

  // Setter for namePhone (only updates if idPhone is not empty)
  set namePhone(String namePhone) {
    _namePhone = (idPhone.isNotEmpty) ? namePhone : _namePhone;
  }

  // Setter for brandProduct (only updates if brandProduct is not empty)
  set brandProduct(String brandProduct) {
    _brandProduct = (brandProduct.isNotEmpty) ? brandProduct : _brandProduct;
  }

  // Setter for importPrice with validation (prevents negative price)
  set importPrice(double importPrice) {
    _importPrice = (importPrice < 0) ? _importPrice : importPrice;
  }

  // Setter for sellingPrice (only updates if sellingPrice is greater than importPrice)
  set sellingPrice(double sellingPrice) {
    _sellingPrice = (sellingPrice > importPrice) ? _sellingPrice : sellingPrice;
  }

  // Setter for amount with validation (only allows positive integers)
  set amount(int amount) {
    if (amount is int && amount > 0) {
      _amount = amount; // Valid amount
    } else {
      print("Invalid amount value: $amount"); // Invalid value handling
    }
  }

  // Setter for status with validation (only accepts boolean values)
  set status(bool status) {
    if (status is bool) {
      _status = status; // Valid boolean value
    } else {
      print("Invalid status value: $status"); // Invalid value handling
    }
  }

  // Method to calculate profit from selling the phones
  double calculateProfit() {
    return (_sellingPrice - _importPrice) * _amount;
  }

  // Method to display phone information
  void displayInfo() {
    print("ID Phone: $_idPhone");
    print("Name: $_namePhone");
    print("Brand: $_brandProduct");
    print("Import Price: \$$_importPrice");
    print("Selling Price: \$$_sellingPrice");
    print("Amount: $_amount");
    print("Status: ${_status ? "Available" : "Not Available"}");
  }

  // Method to check if the phone can be sold (must be available and in stock)
  bool canSell() {
    return _status && _amount > 0 && _sellingPrice > _importPrice;
  }
}
