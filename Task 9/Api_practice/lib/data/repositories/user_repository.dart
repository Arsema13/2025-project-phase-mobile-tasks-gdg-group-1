import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../services/ storage_service.dart';

class UserRepository {
  final ApiService apiService;
  final StorageService storageService;

  UserRepository({
    required this.apiService,
    required this.storageService,
  });

  // Fetch users from the API
  Future<List<User>> fetchUsers() async {
    try {
      return await apiService.fetchUsers();
    } catch (e) {
      debugPrint('Error fetching users: $e');
      return [];
    }
  }

  // Save a user locally
  Future<void> saveUser(User user) async {
    await storageService.saveUser(user);
  }

  // Retrieve saved user
  Future<User?> getSavedUser() async {
    return await storageService.getSavedUser();
  }
}
