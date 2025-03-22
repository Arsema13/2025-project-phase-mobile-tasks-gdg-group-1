// lib/domain/usecases/update_product_usecase.dart
import '../data/product_repository.dart';
import '../entities/ product.dart';

class UpdateProductUsecase {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  Future<void> execute(Product product) {
    return repository.updateProduct(product);
  }
}
