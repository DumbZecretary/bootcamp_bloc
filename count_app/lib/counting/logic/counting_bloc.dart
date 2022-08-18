import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';
import 'package:count_app/model/app_state/app_state_model.dart';
import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:count_app/utils/logging.dart';

class CountingBloc extends Bloc<CountingEvent, AppState> {
  final CountingRepoSharedPreferences _countingRepoSharedPreferences;
  CountingBloc(
      {required int initialState,
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
      final int newStateValue = state.value + event.value;
      await _countingRepoSharedPreferences.update(newValue: newStateValue);
      final AppState newAppState =
          state.rebuild((p0) => p0..value = newStateValue);
      emit(newAppState);
    } catch (e) {
      addError(Exception("increment error"), StackTrace.current);
    }
  }

  FutureOr<void> _onDecrease(
      CountingDecreaseEvent event, Emitter<AppState> emit) async {
    try {} catch (e) {
      addError(Exception("decrement error"), StackTrace.current);
    }
    final int newStateValue = state.value - event.value;
    await _countingRepoSharedPreferences.update(newValue: newStateValue);
    final AppState newAppState =
        state.rebuild((p0) => p0..value = newStateValue);
    emit(newAppState);
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
        await _countingRepoSharedPreferences.create();
      }
      final AppState newAppState =
          state.rebuild((p0) => p0..value = currentValue);
      emit(newAppState);
    } catch (e) {
      addError(Exception("get current error"), StackTrace.current);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
