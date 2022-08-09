import 'package:counter_app/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_domain/logic/counter_logic.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(initialValue: 0),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
