// lib/main.dart
import 'package:flutter/material.dart';
import 'domain/entities/ product.dart';
import 'domain/usecases/view_all_products_usecase.dart';
import 'domain/usecases/view_product_usecase.dart';
import 'domain/usecases/create_product_usecase.dart';
import 'domain/usecases/update_product_usecase.dart';
import 'domain/usecases/delete_product_usecase.dart';
import 'domain/data/product_repository.dart';

void main() async {
  // Initialize Repository and Use Cases
  final repository = ProductRepositoryImpl();
  final viewAllProducts = ViewAllProductsUsecase(repository);
  final viewProduct = ViewProductUsecase(repository);
  final createProduct = CreateProductUsecase(repository);
  final updateProduct = UpdateProductUsecase(repository);
  final deleteProduct = DeleteProductUsecase(repository);

  // Create Products
  await createProduct.execute(Product(
    id: "1",
    name: "Laptop",
    description: "High-performance laptop",
    imageUrl: "https://example.com/laptop.jpg",
    price: 1500.0,
  ));

  await createProduct.execute(Product(
    id: "2",
    name: "Smartphone",
    description: "Latest model smartphone",
    imageUrl: "https://example.com/smartphone.jpg",
    price: 999.0,
  ));

  // Run the app
  runApp(MyApp(
    viewAllProducts: viewAllProducts,
  ));
}

class MyApp extends StatelessWidget {
  final ViewAllProductsUsecase viewAllProducts;

  const MyApp({Key? key, required this.viewAllProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce App',
      home: HomePage(viewAllProducts: viewAllProducts),
    );
  }
}

class HomePage extends StatelessWidget {
  final ViewAllProductsUsecase viewAllProducts;

  const HomePage({Key? key, required this.viewAllProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eCommerce App'),
      ),
      body: FutureBuilder<List<Product>>(
        future: viewAllProducts.execute(), // Fetch all products using the use case
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }

          if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                );
              },
            );
          } else {
            return const Center(child: Text('No products available.'));
          }
        },
      ),
    );
  }
}
