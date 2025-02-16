import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewProductUsecase {
  final ProductRepository repository;

  ViewProductUsecase(this.repository);

  Future<Product?> call(String productId) async {
    return await repository.getProductById(productId);
  }
}
