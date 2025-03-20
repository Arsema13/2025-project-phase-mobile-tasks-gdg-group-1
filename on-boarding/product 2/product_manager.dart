// product_manager.dart
import 'product.dart';

class ProductManager {
  List<Product> products = [];

  // Add a new product
  void addProduct(String name, String description, double price) {
    Product product = Product(name, description, price);
    products.add(product);
    print('Product added successfully.');
  }

  // View all products
  void viewAllProducts() {
    if (products.isEmpty) {
      print('No products available.');
    } else {
      for (var product in products) {
        print(product);
        print('-----------------------');
      }
    }
  }

  // View a single product by index
  void viewSingleProduct(int index) {
    if (index >= 0 && index < products.length) {
      print(products[index]);
    } else {
      print('Product not found.');
    }
  }

  // Edit a product
  void editProduct(int index, String name, String description, double price) {
    if (index >= 0 && index < products.length) {
      products[index].name = name;
      products[index].description = description;
      products[index].price = price;
      print('Product updated successfully.');
    } else {
      print('Product not found.');
    }
  }

  // Delete a product
  void deleteProduct(int index) {
    if (index >= 0 && index < products.length) {
      products.removeAt(index);
      print('Product deleted successfully.');
    } else {
      print('Product not found.');
    }
  }
}
