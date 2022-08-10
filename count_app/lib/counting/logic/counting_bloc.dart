import 'package:bloc/bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';

class CountingBloc extends Bloc<CountingEvent, int> {
  CountingBloc(int initialState) : super(initialState) {
    on<CountingIncreaseEvent>((event, emit) {
      addError(Exception("increment error"), StackTrace.current);
      int newState = state + event.value;
      emit(newState);
    });
    on<CountingDecreaseEvent>((event, emit) {
      addError(Exception("decrement error"), StackTrace.current);
      int newState = state - event.value;
      emit(newState);
    });
  }
}
