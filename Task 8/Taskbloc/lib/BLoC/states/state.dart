class CounterState {
  final int count;
  final String username;
  final String password;
  final bool isPasswordVisible;
  final String email;
  final String mobileNumber;

  // Add email and mobileNumber with default empty string values
  CounterState({
    required this.count,
    this.username = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.email = '',
    this.mobileNumber = '',
  });

  // Create a copyWith method to update specific fields
  CounterState copyWith({
    int? count,
    String? username,
    String? password,
    bool? isPasswordVisible,
    String? email,
    String? mobileNumber,
  }) {
    return CounterState(
      count: count ?? this.count,
      username: username ?? this.username,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
    );
  }
}
