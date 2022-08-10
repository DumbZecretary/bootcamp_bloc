import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';
import 'package:count_app/model/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counting Function Test", () {
    group("test from initial state", () {
      late CountingBloc countingBloc;
      setUp(() {
        countingBloc = CountingBloc(0);
      });
      tearDown(() {
        countingBloc = CountingBloc(0);
      });
      test("Counting increase from initial state", () async {
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = 1));
      });
      test("Counting decrease from initial state", () async {
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = -1));
      });
    });
    group("test from normal state", () {
      late CountingBloc countingBloc;
      setUp(() {
        countingBloc = CountingBloc(10);
      });
      tearDown(() {
        countingBloc = CountingBloc(10);
      });
      test("Counting increase from initial state", () async {
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = 11));
      });
      test("Counting decrease from initial state", () async {
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = 9));
      });
    });
    group("test from initial state, multiple", () {
      late CountingBloc countingBloc;
      setUp(() {
        countingBloc = CountingBloc(0);
      });
      tearDown(() {
        countingBloc = CountingBloc(0);
      });
      test("Counting increase from initial state", () async {
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = 3));
      });
      test("Counting decrease from initial state", () async {
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = -3));
      });
    });
    group("test from normal state, multiple", () {
      late CountingBloc countingBloc;
      setUp(() {
        countingBloc = CountingBloc(10);
      });
      tearDown(() {
        countingBloc = CountingBloc(10);
      });
      test("Counting increase from initial state", () async {
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingIncreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = 13));
      });
      test("Counting decrease from initial state", () async {
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        countingBloc.add(CountingDecreaseEvent((b) => b..value = 1));
        await Future.delayed(const Duration(seconds: 0));
        expect(countingBloc.state, AppState((b) => b..value = 7));
      });
    });
  });
}
