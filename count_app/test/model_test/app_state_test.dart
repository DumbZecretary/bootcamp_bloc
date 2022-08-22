import 'dart:convert';

import 'package:count_app/model/app_state/app_state_model.dart';
import 'package:count_app/model/serializers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AppState Model Test", () {
    late AppState appState;
    group("Initial test", () {
      // given
      setUp(() {
        appState = AppState.initial(value: 0);
      });
      tearDown(() {
        appState = AppState.initial(value: 0);
      });
      test("Initial State value is 0", () {
        // then
        expect(appState.value, 0);
      });
    });
    group("Normal test", () {
      // given
      setUp(() {
        appState = AppState((b) => b..value = 10);
      });
      tearDown(() {
        appState = AppState((b) => b..value = 10);
      });
      test("Normal State value is 10", () {
        // then
        expect(appState.value, 10);
      });
    });
    group("Serializer test", () {
      // given
      const String sampleAppState =
          '{"value": 10, "status": "idle", "locale": "en"}';
      setUp(() {
        appState = AppState((b) => b
          ..value = 10
          ..status = "idle"
          ..locale = "en");
      });
      tearDown(() {
        appState = AppState((b) => b
          ..value = 10
          ..status = "idle"
          ..locale = "en");
      });
      test("Normal State value is 10 when encoding", () {
        // when
        var encode = serializers.serialize(appState);
        // then
        expect(encode.toString(),
            '''{\$: AppState, value: 10, locale: en, status: idle}''');
      });
      test("Normal State value is 10 when decoding", () {
        // when
        var decode = serializers.deserializeWith(
            AppState.serializer, json.decode(sampleAppState));
        // then
        expect(decode, appState);
      });
    });
    group("AppStateBuilder test", () {
      // given
      setUp(() {
        appState = AppState.initial(value: 0);
      });
      test("change value to 1", () {
        // when
        appState = appState.rebuild((p0) => p0..value = 1);
        // then
        expect(appState, AppState((b) => b..value = 1));
      });
      test("check builder type", () {
        // given
        AppStateBuilder sampleAppStateBuilder = appState.toBuilder();
        var type = sampleAppStateBuilder.runtimeType;
        // then
        expect(type, AppStateBuilder);
      });
      test("check hashcode", () {
        // given
        AppState sampleAppState = appState.rebuild((p0) => p0..value = 1);
        // when
        int sampleAppStateHashCode = sampleAppState.hashCode;
        // them
        expect(sampleAppStateHashCode, sampleAppStateHashCode);
      });
      test("check toString", () {
        // given
        String expectedStringAppState = 'AppState {\n' '  value=0,\n' '}';
        // then
        expect(appState.toString(), expectedStringAppState);
      });
    });
  });
}
