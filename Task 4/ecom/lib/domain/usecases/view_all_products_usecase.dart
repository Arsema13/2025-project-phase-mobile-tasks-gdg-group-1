import '../entities/ product.dart';
import '../data/product_repository.dart';

class ViewAllProductsUsecase {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  Future<List<Product>> execute() async {
    return await repository.getAllProducts();
  }
}
