// lib/domain/usecases/create_product_usecase.dart
import '../data/product_repository.dart';
import '../entities/ product.dart';

class CreateProductUsecase {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  Future<void> execute(Product product) {
    return repository.createProduct(product);
  }
}
