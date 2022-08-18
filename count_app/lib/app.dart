import 'package:count_app/app_view.dart';
import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountApp extends StatelessWidget {
  const CountApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountingBloc(
        initialState: 0,
        countingRepoSharedPreferences:
            context.read<CountingRepoSharedPreferences>(),
      ),
      child: const AppView(),
    );
  }
}
