import 'package:count_app/counting/logic/events/events.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CountingEvent Model Test", () {
    late CountingIncreaseEvent countingIncreaseEvent;
    late CountingDecreaseEvent countingDecreaseEvent;
    // CountingIncreaseEvent
    group("CountingIncreaseEvent test", () {
      // given
      setUp(() {
        countingIncreaseEvent = CountingIncreaseEvent((b) => b..value = 1);
      });
      tearDown(() {
        countingIncreaseEvent = CountingIncreaseEvent((b) => b..value = 1);
      });
      test("value is 1", () {
        // then
        expect(countingIncreaseEvent.value, 1);
      });
    });
    group("CountingIncreaseEventBuilder test", () {
      // given
      setUp(() {
        countingIncreaseEvent = CountingIncreaseEvent((b) => b..value = 1);
      });
      test("change value to 2", () {
        // when
        countingIncreaseEvent =
            countingIncreaseEvent.rebuild((p0) => p0..value = 2);
        // then
        expect(
            countingIncreaseEvent, CountingIncreaseEvent((b) => b..value = 2));
      });
      test("check builder type", () {
        // given
        CountingIncreaseEventBuilder sampleCountingIncreaseEventStateBuilder =
            countingIncreaseEvent.toBuilder();
        var type = sampleCountingIncreaseEventStateBuilder.runtimeType;
        // then
        expect(type, CountingIncreaseEventBuilder);
      });
      test("check hashcode", () {
        // given
        CountingIncreaseEvent sampleCountingIncreaseEvent =
            countingIncreaseEvent.rebuild((p0) => p0..value = 1);
        // when
        int sampleCountingIncreaseEventHashCode =
            sampleCountingIncreaseEvent.hashCode;
        // them
        expect(sampleCountingIncreaseEventHashCode,
            sampleCountingIncreaseEventHashCode);
      });
      test("check toString", () {
        // given
        String expectedStringCountingIncreaseEvent =
            'CountingIncreaseEvent {\n' '  value=1,\n' '}';
        // then
        expect(countingIncreaseEvent.toString(),
            expectedStringCountingIncreaseEvent);
      });
    });
    // CountingDecreaseEvent
    group("CountingDecreaseEvent test", () {
      // given
      setUp(() {
        countingDecreaseEvent = CountingDecreaseEvent((b) => b..value = 1);
      });
      tearDown(() {
        countingDecreaseEvent = CountingDecreaseEvent((b) => b..value = 1);
      });
      test("value is 1", () {
        // then
        expect(countingDecreaseEvent.value, 1);
      });
    });
    group("CountingDecreaseEventBuilder test", () {
      // given
      setUp(() {
        countingDecreaseEvent = CountingDecreaseEvent((b) => b..value = 1);
      });
      test("change value to 2", () {
        // when
        countingDecreaseEvent =
            countingDecreaseEvent.rebuild((p0) => p0..value = 2);
        // then
        expect(
            countingDecreaseEvent, CountingDecreaseEvent((b) => b..value = 2));
      });
      test("check builder type", () {
        // given
        CountingDecreaseEventBuilder sampleCountingDecreaseEventStateBuilder =
            countingDecreaseEvent.toBuilder();
        var type = sampleCountingDecreaseEventStateBuilder.runtimeType;
        // then
        expect(type, CountingDecreaseEventBuilder);
      });
      test("check hashcode", () {
        // given
        CountingDecreaseEvent sampleCountingDecreaseEvent =
            countingDecreaseEvent.rebuild((p0) => p0..value = 1);
        // when
        int sampleCountingDecreaseEventHashCode =
            sampleCountingDecreaseEvent.hashCode;
        // them
        expect(sampleCountingDecreaseEventHashCode,
            sampleCountingDecreaseEventHashCode);
      });
      test("check toString", () {
        // given
        String expectedStringCountingDecreaseEvent =
            'CountingDecreaseEvent {\n' '  value=1,\n' '}';
        // then
        expect(countingDecreaseEvent.toString(),
            expectedStringCountingDecreaseEvent);
      });
    });
  });
}
