
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskbloc/BLoC/screens/screen_one.dart';
import 'BLoC/blocs/bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLoC Counter Example',
      home: BlocProvider(
        // Provide the CounterBloc to the widget tree
        create: (context) => CounterBloc(),
        child: const SigninPage(), // Set CounterScreen as the home screen
      ),
    );
  }
}