import '../repositories/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<void> call(String productId) async {
    await repository.deleteProduct(productId);
  }
}
