import 'package:count_app/repo/counting_repo/counting_repo_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockRepo extends Mock implements CountingRepoSharedPreferences {}

void main() {
  group("Repo test", () {
    group("Counting Repo share_preferences test", () {
      late MockRepo mockRepo;
      Map<String, Object> values = <String, Object>{};
      SharedPreferences.setMockInitialValues(values); //set values here
      late SharedPreferences pref;
      late CountingRepoSharedPreferences countingRepoSharedPreferences;
      setUp(() async {
        mockRepo = MockRepo();
        pref = await SharedPreferences.getInstance();
        countingRepoSharedPreferences =
            CountingRepoSharedPreferences(sharedPreferences: pref);
      });
      test("create", () async {
        countingRepoSharedPreferences.create();
        expect(countingRepoSharedPreferences.read(), 0);
      });
      test("read", () async {
        final int? value = countingRepoSharedPreferences.read();
        expect(value, 0);
      });
      test("update", () async {
        countingRepoSharedPreferences.update(2);
        expect(countingRepoSharedPreferences.read(), 2);
      });
      test("delete", () async {
        countingRepoSharedPreferences.delete();
        expect(countingRepoSharedPreferences.read(), null);
      });
      test("create but getting error", () async {
        when(() => mockRepo.create()).thenThrow(Error());
        expect(countingRepoSharedPreferences.read(), null);
      });
      test("read but getting error", () async {
        when(() => mockRepo.read()).thenThrow(Error());
        expect(countingRepoSharedPreferences.read(), null);
      });
      test("update but getting error", () async {
        when(() => mockRepo.update(any())).thenThrow(Exception());
        verifyNever(() => mockRepo.update(any()));
      });
      test("delete but getting error", () async {
        when(() => mockRepo.delete()).thenThrow(Error());
        expect(countingRepoSharedPreferences.read(), null);
      });
    });
  });
}
