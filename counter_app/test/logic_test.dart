import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:counter_app/counter_domain/logic/counter_logic.dart';
import 'package:counter_app/model/app_state.dart';
import 'package:flutter_test/flutter_test.dart';

// TODO: create file serializer for model and test it

void main() {
  initTest();
  normalTest();
  modelTest();
}

void modelTest() {
  group("AppState model test", () {
    test("initial AppState model", () {
      // given
      AppState appState = AppState.init();
      // then
      expect(appState, AppState((b) => b..value = 0));
    });
    test("serializer AppState model", () {
      // given
      AppState appState = AppState.init();
      Serializers serializers = Serializers();
      var a = serializers.deserializeWith(
          AppState.serializer, json.decode('{"value" : "0"}'));

      expect(a, "0");
    });
  });
}

void initTest() {
  AppState? appState;
  CounterBloc? counterBloc;

  group("CounterBloc initial", () {
    // given
    setUp(() {
      appState = AppState().rebuild((p0) => p0..value = 0);
    });

    tearDown(() {
      appState = AppState().rebuild((p0) => p0..value = 0);
    });
    test("initial state value is 0", () {
      // then
      expect(appState?..value, AppState((b) => b..value = 0));
    });
  });
  group("Interact CounterBloc Function from initial State", () {
    // given
    setUp(() {
      counterBloc = CounterBloc(initialValue: 0);
    });

    tearDown(() {
      counterBloc = CounterBloc(initialValue: 0);
    });
    test("CounterBloc Increase from initial state", () async {
      // when
      counterBloc?.add(CounterIncreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, 1);
    });
    test("CounterBloc Increase multiple from initial state", () async {
      // when
      counterBloc?.add(CounterIncreasePress());
      counterBloc?.add(CounterIncreasePress());
      counterBloc?.add(CounterIncreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, 3);
    });
    test("CounterBloc Increase from initial state", () async {
      // when
      counterBloc?.add(CounterDecreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, -1);
    });
    test("CounterBloc Decrease multiple from initial state", () async {
      // when
      counterBloc?.add(CounterDecreasePress());
      counterBloc?.add(CounterDecreasePress());
      counterBloc?.add(CounterDecreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, -3);
    });
  });
}

void normalTest() {
  AppState? appState;
  CounterBloc? counterBloc;

  group("CounterBloc normal", () {
    // given
    setUp(() {
      appState = AppState().rebuild((p0) => p0..value = 10);
    });

    tearDown(() {
      appState = AppState().rebuild((p0) => p0..value = 10);
    });
    test("normal state value is 10", () {
      // then
      expect(appState?..value, AppState((b) => b..value = 10));
    });
  });
  group("Interact CounterBloc Function from normal State", () {
    // given
    setUp(() {
      counterBloc = CounterBloc(initialValue: 10);
    });
    tearDown(() {
      counterBloc = CounterBloc(initialValue: 10);
    });

    test("CounterBloc Increase from normal state", () async {
      // when
      counterBloc!.add(CounterIncreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, 11);
    });
    test("CounterBloc Increase multiple from normal state", () async {
      // when
      counterBloc?.add(CounterIncreasePress());
      counterBloc?.add(CounterIncreasePress());
      counterBloc?.add(CounterIncreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, 13);
    });
    test("CounterBloc Increase from normal state", () async {
      // when
      counterBloc?.add(CounterDecreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, 9);
    });
    test("CounterBloc Decrease multiple from normal state", () async {
      // when
      counterBloc?.add(CounterDecreasePress());
      counterBloc?.add(CounterDecreasePress());
      counterBloc?.add(CounterDecreasePress());
      await Future.delayed(const Duration(seconds: 0));
      // then
      expect(counterBloc?.state.value, 7);
    });
  });
}
