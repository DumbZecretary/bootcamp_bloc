import 'package:bloc/bloc.dart';
import 'package:count_app/utils/logging.dart';

class CountingObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('${bloc.runtimeType} $change');
  }
}
