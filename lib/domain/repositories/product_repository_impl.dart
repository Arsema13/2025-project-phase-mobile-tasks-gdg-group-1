import 'dart:async';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final List<Product> _products = [];

  @override
  Future<List<Product>> getAllProducts() async {
    return _products;
  }

  @override
  Future<Product?> getProductById(String id) async {
    return _products.isNotEmpty
        ? _products.firstWhere(
            (product) => product.id == id,
            orElse: () => Product(
                id: '', name: '', description: '', imageUrl: '', price: 0),
          )
        : null;
  }

  @override
  Future<void> addProduct(Product product) async {
    _products.add(product);
  }

  @override
  Future<void> updateProduct(Product updatedProduct) async {
    int index = _products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    _products.removeWhere((product) => product.id == id);
  }
}
