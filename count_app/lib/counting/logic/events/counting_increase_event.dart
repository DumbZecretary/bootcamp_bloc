import 'package:built_value/built_value.dart';
import 'package:count_app/counting/logic/events/counting_event.dart';

part 'counting_increase_event.g.dart';

abstract class CountingIncreaseEvent extends CountingEvent
    implements Built<CountingIncreaseEvent, CountingIncreaseEventBuilder> {
  int get value;

  CountingIncreaseEvent._();
  factory CountingIncreaseEvent(
          [void Function(CountingIncreaseEventBuilder) updates]) =
      _$CountingIncreaseEvent;
}
