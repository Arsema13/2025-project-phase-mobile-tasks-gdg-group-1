import 'package:flutter/material.dart';
import 'domain/entities/product.dart';
import 'domain/repositories/product_repository_impl.dart';
import 'domain/usecases/view_all_products_usecase.dart';
import 'domain/usecases/create_product_usecase.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures async operations work properly

  final repository = ProductRepositoryImpl();

  // Creating a product
  final createProductUsecase = CreateProductUsecase(repository);
  await createProductUsecase.call(
    Product(
      id: '1',
      name: 'Laptop',
      description: 'A powerful laptop',
      imageUrl: 'https://example.com/laptop.jpg',
      price: 1500.0,
    ),
  );

  // Viewing all products
  final viewAllProductsUsecase = ViewAllProductsUsecase(repository);
  List<Product> products = await viewAllProductsUsecase.call();

  for (var product in products) {
    print('Product: ${product.name}, Price: \$${product.price}');
  }

  runApp(MyApp(products: products));
}

class MyApp extends StatelessWidget {
  final List<Product> products;

  const MyApp({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(products: products),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products;

  const ProductListScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('eCommerce App')),
      body: products.isEmpty
          ? Center(child: Text('No products available'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
    );
  }
}
