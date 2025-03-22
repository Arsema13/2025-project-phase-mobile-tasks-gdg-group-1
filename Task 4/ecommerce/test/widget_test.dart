import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/domain/usecases/view_all_products_usecase.dart';
import 'package:ecommerce/domain/entities/ product.dart';
import 'package:ecommerce/path/mock_product_repository.dart';
void main() {
  late MockProductRepository mockRepository;
  late ViewAllProductsUsecase viewAllProductsUsecase;

  setUp(() {
    mockRepository = MockProductRepository();
    viewAllProductsUsecase = ViewAllProductsUsecase(mockRepository);

    // Mock the `getAllProducts()` to return a predefined list of products.
    when(mockRepository.getAllProducts()).thenAnswer((_) async => [
      Product(id: "1", name: "Laptop", description: "High-performance laptop", imageUrl: "", price: 1500.0),
      Product(id: "2", name: "Smartphone", description: "Latest model smartphone", imageUrl: "", price: 999.0),
    ]);
  });

  testWidgets('App loads and displays product list', (WidgetTester tester) async {
    // Provide the mocked use case and create the widget
    await tester.pumpWidget(MaterialApp(
      home: MyApp(viewAllProducts: viewAllProductsUsecase), // Pass the mocked use case here
    ));

    // Check if the app title appears
    expect(find.text('eCommerce App'), findsOneWidget);

    // Wait for FutureBuilder to complete the future and build the UI
    await tester.pumpAndSettle();

    // Verify if the ListView is present and products are displayed
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Laptop'), findsOneWidget);
    expect(find.text('Smartphone'), findsOneWidget);
  });
}
