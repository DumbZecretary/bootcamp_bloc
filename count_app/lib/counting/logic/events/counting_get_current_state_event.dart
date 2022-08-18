import 'package:built_value/built_value.dart';
import 'package:count_app/counting/logic/events/counting_event.dart';

part 'counting_get_current_state_event.g.dart';

abstract class CountingGetCurrentStateEvent extends CountingEvent
    implements
        Built<CountingGetCurrentStateEvent,
            CountingGetCurrentStateEventBuilder> {
  CountingGetCurrentStateEvent._();
  factory CountingGetCurrentStateEvent(
          [void Function(CountingGetCurrentStateEventBuilder) updates]) =
      _$CountingGetCurrentStateEvent;
}
