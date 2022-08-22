import 'package:count_app/application/app.dart';
import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountAppConnectRepo extends StatelessWidget {
  const CountAppConnectRepo(
      {required this.countingRepoSharedPreferences, Key? key})
      : super(key: key);
  final CountingRepoSharedPreferences countingRepoSharedPreferences;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: countingRepoSharedPreferences,
      child: const CountApp(),
    );
  }
}
