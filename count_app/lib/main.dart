import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:count_app/app_connect_repo.dart';
import 'package:count_app/observer.dart';
import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:count_app/utils/logging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final CountingRepoSharedPreferences countingRepoSharedPreferences =
      CountingRepoSharedPreferences(sharedPreferences: sharedPreferences);
  bootstrap(repo: countingRepoSharedPreferences);
}

void bootstrap({required CountingRepoSharedPreferences repo}) {
  DebugLogger debugLogger = DebugLogger();
  FlutterError.onError = (details) {
    debugLogger.log(details.exceptionAsString(), details.stack);
  };

  Bloc.observer = CountingObserver();

  runZonedGuarded(
    () => runApp(CountAppConnectRepo(countingRepoSharedPreferences: repo)),
    (error, stackTrace) => debugLogger.log(error.toString(), stackTrace),
  );
}
