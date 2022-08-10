import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentCounterWidget extends StatelessWidget {
  const ContentCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CountingBloc, AppState, int>(selector: (state) {
      return state.value;
    }, builder: (context, data) {
      return Text(
        data.toString(),
        style: const TextStyle(
          color: Colors.pink,
          fontSize: 32,
        ),
      );
    });
  }
}
