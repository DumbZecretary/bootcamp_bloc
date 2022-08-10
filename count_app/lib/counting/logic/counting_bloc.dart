import 'package:bloc/bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';
import 'package:count_app/model/app_state/app_state_model.dart';
import 'package:count_app/utils/logging.dart';

class CountingBloc extends Bloc<CountingEvent, AppState> {
  CountingBloc(int initialState)
      : super(AppState((b) => b..value = initialState)) {
    on<CountingIncreaseEvent>((event, emit) {
      addError(Exception("increment error"), StackTrace.current);
      final int newStateValue = state.value + event.value;
      final AppState newAppState =
          state.rebuild((p0) => p0..value = newStateValue);
      emit(newAppState);
    });
    on<CountingDecreaseEvent>((event, emit) {
      addError(Exception("decrement error"), StackTrace.current);
      final int newStateValue = state.value - event.value;
      final AppState newAppState =
          state.rebuild((p0) => p0..value = newStateValue);
      emit(newAppState);
    });
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
