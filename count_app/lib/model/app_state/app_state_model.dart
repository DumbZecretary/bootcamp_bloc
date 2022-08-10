import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state_model.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  int get value;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initial({required int value}) {
    return AppState((b) => b..value = value);
  }
}

// command: flutter packages pub run build_runner build --delete-conflicting-outputs
