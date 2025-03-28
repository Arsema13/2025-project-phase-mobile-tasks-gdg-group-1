import 'package:flutter/material.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/models/user.dart';

class HomeScreen extends StatefulWidget {
  final UserRepository userRepository;

  const HomeScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  User? savedUser;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      List<User> fetchedUsers = await widget.userRepository.fetchUsers();
      User? userFromStorage = await widget.userRepository.getSavedUser();
      setState(() {
        users = fetchedUsers;
        savedUser = userFromStorage;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'No internet connection or API failure';
      });
    }
  }

  Future<void> _saveUser(User user) async {
    await widget.userRepository.saveUser(user);
    setState(() {
      savedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Column(
        children: [
          if (savedUser != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Last Saved: ${savedUser!.name} - ${savedUser!.email}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : errorMessage != null
                ? Center(child: Text(errorMessage!))
                : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: ElevatedButton(
                    onPressed: () => _saveUser(user),
                    child: const Text('Save'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
