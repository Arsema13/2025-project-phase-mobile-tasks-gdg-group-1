// main.dart
import 'dart:io';
import 'product_manager.dart';

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print('---- Welcome to the eCommerce Application ----');
    print('1. Add a product');
    print('2. View all products');
    print('3. View a single product');
    print('4. Edit a product');
    print('5. Delete a product');
    print('6. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
      // Add product
        print('Enter product name:');
        String? name = stdin.readLineSync();
        print('Enter product description:');
        String? description = stdin.readLineSync();
        print('Enter product price:');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        if (name != null && description != null && price != null) {
          manager.addProduct(name, description, price);
        }
        break;

      case '2':
      // View all products
        manager.viewAllProducts();
        break;

      case '3':
      // View a single product
        print('Enter product index to view:');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null) {
          manager.viewSingleProduct(index);
        }
        break;

      case '4':
      // Edit product
        print('Enter product index to edit:');
        int? editIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (editIndex != null) {
          print('Enter new product name:');
          String? editName = stdin.readLineSync();
          print('Enter new product description:');
          String? editDescription = stdin.readLineSync();
          print('Enter new product price:');
          double? editPrice = double.tryParse(stdin.readLineSync() ?? '');
          if (editName != null && editDescription != null && editPrice != null) {
            manager.editProduct(editIndex, editName, editDescription, editPrice);
          }
        }
        break;

      case '5':
      // Delete product
        print('Enter product index to delete:');
        int? deleteIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (deleteIndex != null) {
          manager.deleteProduct(deleteIndex);
        }
        break;

      case '6':
      // Exit
        print('Exiting application...');
        return;

      default:
        print('Invalid choice, please try again.');
    }
  }
}
