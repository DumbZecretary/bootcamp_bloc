import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';
import 'package:count_app/model/app_state/app_state_model.dart';
import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:count_app/utils/logging.dart';

class CountingBloc extends Bloc<CountingEvent, AppState> {
  final CountingRepoSharedPreferences _countingRepoSharedPreferences;
  CountingBloc(
      {required int? initialState,
      required CountingRepoSharedPreferences countingRepoSharedPreferences})
      : _countingRepoSharedPreferences = countingRepoSharedPreferences,
        super(AppState((b) => b..value = initialState)) {
    on<CountingGetCurrentStateEvent>(_onGetCurrentState);
    on<CountingIncreaseEvent>(_onIncrease);
    on<CountingDecreaseEvent>(_onDecrease);
  }

  FutureOr<void> _onIncrease(
      CountingIncreaseEvent event, Emitter<AppState> emit) async {
    try {
      final int newStateValue = (state.value ?? 0) + event.value;
      final AppState newAppState =
          state.rebuild((p0) => p0..value = newStateValue);
      await _countingRepoSharedPreferences.update(newStateValue);
      emit(newAppState);
    } catch (e) {
      addError(Exception("increment error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onDecrease(
      CountingDecreaseEvent event, Emitter<AppState> emit) async {
    try {
      final int newStateValue = (state.value ?? 0) - event.value;
      final AppState newAppState =
          state.rebuild((p0) => p0..value = newStateValue);
      await _countingRepoSharedPreferences.update(newStateValue).whenComplete(
            () => emit(newAppState),
          );
    } catch (e) {
      addError(Exception("decrement error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  Future<void> _onGetCurrentState(
    CountingGetCurrentStateEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      int? currentValue;
      currentValue = _countingRepoSharedPreferences.read();
      if (currentValue == null) {
        currentValue = 0;
        final AppState newAppState =
            state.rebuild((p0) => p0..value = currentValue);
        await _countingRepoSharedPreferences.create().whenComplete(() {
          emit(newAppState);
        });
      } else {
        emit(state.rebuild((b) => b..value = currentValue));
      }
    } catch (e) {
      addError(Exception("get current error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
