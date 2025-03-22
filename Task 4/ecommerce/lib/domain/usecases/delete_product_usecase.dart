// lib/domain/usecases/delete_product_usecase.dart
import '../data/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<void> execute(String productId) {
    return repository.deleteProduct(productId);
  }
}
