// product.dart
class Product {
  String _name;
  String _description;
  double _price;

  // Constructor
  Product(this._name, this._description, this._price);

  // Getters and Setters
  String get name => _name;
  set name(String value) => _name = value;

  String get description => _description;
  set description(String value) => _description = value;

  double get price => _price;
  set price(double value) => _price = value;

  // String representation for easy viewing
  @override
  String toString() {
    return 'Name: $_name\nDescription: $_description\nPrice: \$$_price';
  }
}
