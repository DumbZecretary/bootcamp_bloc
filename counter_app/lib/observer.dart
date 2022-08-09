import 'package:bloc/bloc.dart';

import 'package:counter_app/tools/logging.dart';

class CounterObserver extends BlocObserver {
  DebugLogger debugLogger = DebugLogger();
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugLogger.log("${bloc.runtimeType} $change");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugLogger.log('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
