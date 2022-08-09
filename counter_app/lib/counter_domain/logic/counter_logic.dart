import 'package:bloc/bloc.dart';
import 'package:counter_app/model/app_state.dart';

abstract class CounterEvent {}

class CounterIncreasePress extends CounterEvent {}

class CounterDecreasePress extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, AppState> {
  CounterBloc({required int initialValue})
      : super(
          AppState((b) => b..value = initialValue),
        ) {
    on<CounterIncreasePress>((event, emit) {
      addError(Exception('increment error!'), StackTrace.current);
      emit(AppState().rebuild((p0) => p0..value = state.value! + 1));
    });
    on<CounterDecreasePress>((event, emit) {
      addError(Exception('decrement error!'), StackTrace.current);
      emit(AppState().rebuild((p0) => p0..value = state.value! - 1));
    });
  }
}
