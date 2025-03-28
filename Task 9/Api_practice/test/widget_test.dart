import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:api_practice/main.dart';
import 'package:api_practice/data/repositories/user_repository.dart';
import 'package:api_practice/data/services/api_service.dart';
import 'package:api_practice/data/services/ storage_service.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    // Create necessary service instances
    final userRepository = UserRepository(
      apiService: ApiService(),
      storageService: StorageService(),
    );

    // Pass the repository to MyApp
    await tester.pumpWidget(MyApp(userRepository: userRepository));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
