import 'package:built_value/built_value.dart';
import 'package:count_app/counting/logic/events/counting_event.dart';

part 'counting_decrease_event.g.dart';

abstract class CountingDecreaseEvent extends CountingEvent
    implements Built<CountingDecreaseEvent, CountingDecreaseEventBuilder> {
  int get value;

  CountingDecreaseEvent._();
  factory CountingDecreaseEvent(
          [void Function(CountingDecreaseEventBuilder) updates]) =
      _$CountingDecreaseEvent;
}
