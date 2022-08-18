import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counting/logic/events/events.dart';

class AppView extends StatefulWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    context.read<CountingBloc>().add(CountingGetCurrentStateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // TODO: idle state - home, else - loading circle
      home: HomeScreen(),
    );
  }
}
