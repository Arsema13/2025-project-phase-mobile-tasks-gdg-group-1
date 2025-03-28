import 'package:flutter/material.dart';
import 'data/services/api_service.dart';
import 'data/services/ storage_service.dart';
import 'data/repositories/user_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  final userRepository = UserRepository(
    apiService: ApiService(),
    storageService: StorageService(),
  );

  runApp( MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(userRepository: userRepository),
    );
  }
}
