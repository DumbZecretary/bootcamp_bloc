import 'package:counter_app/counter_domain/logic/counter_logic.dart';
import 'package:counter_app/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterViewWidget extends StatelessWidget {
  const CounterViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CounterBloc, AppState, int>(selector: (state) {
      return state.value ?? 0;
    }, builder: (context, data) {
      return Text(
        data.toString(),
        style: const TextStyle(
          color: Colors.pinkAccent,
          fontSize: 32,
        ),
      );
    });
  }
}
