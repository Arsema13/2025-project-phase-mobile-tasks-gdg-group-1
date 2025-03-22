
import '../entities/ product.dart';




// Abstract Class
abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(String id); // No nullable return type
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}

// Concrete Implementation
class ProductRepositoryImpl implements ProductRepository {
  final List<Product> _products = [];

  @override
  Future<List<Product>> getAllProducts() async {
    return _products;
  }

  @override
  Future<Product> getProductById(String id) async {
    return _products.firstWhere((product) => product.id == id,
        orElse: () => Product(id: '', name: 'Not Found', description: '', imageUrl: '', price: 0.0));
  }

  @override
  Future<void> createProduct(Product product) async {
    _products.add(product);
  }

  @override
  Future<void> updateProduct(Product product) async {
    int index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    _products.removeWhere((product) => product.id == id);
  }
}
