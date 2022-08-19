import 'package:count_app/counting/logic/counting_bloc.dart';
import 'package:count_app/counting/logic/events/events.dart';
import 'package:count_app/model/app_state/app_state_model.dart';
import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCountingRepoSharedPreferences extends Mock
    implements CountingRepoSharedPreferences {}

void main() {
  group("Counter", () {
    late MockCountingRepoSharedPreferences mockCountingRepoSharedPreferences;
    setUp(() {
      mockCountingRepoSharedPreferences = MockCountingRepoSharedPreferences();
    });
    CountingBloc countingBloc() {
      return CountingBloc(
          countingRepoSharedPreferences: mockCountingRepoSharedPreferences,
          initialState: 0);
    }

    CountingBloc currentCountingBloc() {
      return CountingBloc(
          countingRepoSharedPreferences: mockCountingRepoSharedPreferences,
          initialState: null);
    }

    group("constructor", () {
      test("work properly", () {
        expect(countingBloc, returnsNormally);
      });
      test('has correct initial state', () {
        expect(
          countingBloc().state,
          AppState((b) => b..value = 0),
        );
      });
    });
    group("current state", () {
      var getCurrentEvent = CountingGetCurrentStateEvent();
      blocTest<CountingBloc, AppState>("emit new state with value 0",
          setUp: () {
            when(() => mockCountingRepoSharedPreferences.create())
                .thenAnswer((_) async {});
          },
          build: countingBloc,
          act: (bloc) => bloc.add(CountingGetCurrentStateEvent()),
          expect: () => [
                AppState((b) => b..value = 0),
              ],
          verify: (_) {
            verify(() => mockCountingRepoSharedPreferences.create()).called(1);
          });
      blocTest<CountingBloc, AppState>("emit new state with the last value, 10",
          setUp: () {
            when(() => mockCountingRepoSharedPreferences.read()).thenReturn(10);
          },
          build: currentCountingBloc,
          act: (bloc) => bloc.add(CountingGetCurrentStateEvent()),
          expect: () => [
                AppState((b) => b..value = 10),
              ],
          verify: (_) {
            verifyNever(() => mockCountingRepoSharedPreferences.create());
          });
      blocTest<CountingBloc, AppState>("current state get error",
          setUp: () {
            final bool checkHashcode = getCurrentEvent.hashCode != 0;
            final bool checkPrint = getCurrentEvent.toString().isNotEmpty;
            if (getCurrentEvent == CountingGetCurrentStateEvent() &&
                checkHashcode &&
                checkPrint) {
              when(() => mockCountingRepoSharedPreferences.create())
                  .thenThrow(Error());
            }
          },
          build: countingBloc,
          act: (bloc) => bloc.add(getCurrentEvent.rebuild((p0) => null)),
          expect: () => [],
          verify: (_) {
            verify(() => mockCountingRepoSharedPreferences.create()).called(1);
          });
    });
    group("increase", () {
      blocTest<CountingBloc, AppState>("emit new state with value 1",
          setUp: () {
            when(() => mockCountingRepoSharedPreferences.update(any()))
                .thenAnswer((_) async {});
          },
          build: countingBloc,
          act: (bloc) => bloc.add(CountingIncreaseEvent((b) => b..value = 1)),
          expect: () => [
                AppState((b) => b..value = 1),
              ],
          verify: (_) {
            verify(() => mockCountingRepoSharedPreferences.update(any()))
                .called(1);
          });
      blocTest<CountingBloc, AppState>("increase but getting error",
          setUp: () {
            when(() => mockCountingRepoSharedPreferences.update(any()))
                .thenThrow(Error());
          },
          build: countingBloc,
          act: (bloc) => bloc.add(CountingIncreaseEvent((b) => b..value = 1)),
          expect: () => [],
          verify: (_) {
            verify(() => mockCountingRepoSharedPreferences.update(any()))
                .called(1);
          });
    });
    group("decrease", () {
      blocTest<CountingBloc, AppState>("emit new state with value -1",
          setUp: () {
            when(() => mockCountingRepoSharedPreferences.update(any()))
                .thenAnswer((_) async {});
          },
          build: countingBloc,
          act: (bloc) => bloc.add(CountingDecreaseEvent((b) => b..value = 1)),
          expect: () => [
                AppState((b) => b..value = -1),
              ],
          verify: (_) {
            verify(() => mockCountingRepoSharedPreferences.update(any()))
                .called(1);
          });
      blocTest<CountingBloc, AppState>("decrease but getting error",
          setUp: () {
            when(() => mockCountingRepoSharedPreferences.update(any()))
                .thenThrow(Error());
          },
          build: countingBloc,
          act: (bloc) => bloc.add(CountingDecreaseEvent((b) => b..value = 1)),
          expect: () => [],
          verify: (_) {
            verify(() => mockCountingRepoSharedPreferences.update(any()))
                .called(1);
          });
    });
  });
}
