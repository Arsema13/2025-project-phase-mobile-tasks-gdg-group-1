// lib/domain/usecases/view_product_usecase.dart
import '../data/product_repository.dart';
import '../entities/ product.dart';

class ViewProductUsecase {
  final ProductRepository repository;

  ViewProductUsecase(this.repository);

  Future<Product?> execute(String productId) {
    return repository.getProductById(productId);
  }
}
