import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskbloc/BLoC/blocs/bloc.dart';
import 'package:taskbloc/BLoC/events/event.dart';
import 'package:taskbloc/BLoC/states/state.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Welcome to our App! Please sign in to continue."),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return TextField(
                          controller: TextEditingController(text: state.username),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.only(left: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            context.read<CounterBloc>().add(UpdateUsernameEvent(value));
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return TextField(
                          controller: TextEditingController(text: state.password),
                          obscureText: !state.isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            contentPadding: EdgeInsets.only(left: 20),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.lightBlue,
                              ),
                              onPressed: () {
                                context.read<CounterBloc>().add(TogglePasswordVisibilityEvent());
                              },
                            ),
                          ),
                          onChanged: (value) {
                            context.read<CounterBloc>().add(UpdatePasswordEvent(value));
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Logic for forgotten password
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text('Username: ${state.username}'),
                      Text('Password: ${state.password}'),
                    ],
                  );
                },
              ),
              SizedBox(height: 40),
              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  String email = context.read<CounterBloc>().state.username;
                  String password = context.read<CounterBloc>().state.password;
                  // Handle sign-in logic
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 20),
              // Facebook and Google login buttons above the "Don't have an account?" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook icon in a circular shape
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/Facebook-logo.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(width: 20),
                  // Google icon in a circular shape
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/channels4_profile.jpg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the Sign Up page or handle Sign Up flow
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue, // Adjust color as needed
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Increment logic if needed
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
