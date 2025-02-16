import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts(); // Get all products
  Future<Product?> getProductById(String id); // Get product by ID
  Future<void> addProduct(Product product); // Create a new product
  Future<void> updateProduct(Product product); // Update a product
  Future<void> deleteProduct(String id); // Delete a product
}
