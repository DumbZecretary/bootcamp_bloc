import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountApp extends StatelessWidget {
  const CountApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountingBloc(0),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
