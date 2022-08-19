import 'package:count_app/repo/counting_repo/abs_counting_repo.dart';
import 'package:count_app/utils/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountingRepoSharedPreferences extends AbsCountingRepo {
  final SharedPreferences sharedPreferences;
  CountingRepoSharedPreferences({required this.sharedPreferences});
  @override
  Future create() async {
    try {
      await sharedPreferences.setInt('counter', 0);
    } catch (e) {
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log("Counting repo create error: $e");
    }
  }

  @override
  Future delete() async {
    try {
      await sharedPreferences.remove('counter');
    } catch (e) {
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log("Counting repo delete error: $e");
    }
  }

  @override
  int? read() {
    try {
      return sharedPreferences.getInt('counter');
    } catch (e) {
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log("Counting repo read error: $e");
    }
    return null;
  }

  @override
  Future<void> update(int? newValue) async {
    try {
      await sharedPreferences.setInt('counter', newValue ?? 0);
    } catch (e) {
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log("Counting repo update error: $e");
    }
  }
}
