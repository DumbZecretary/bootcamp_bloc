import 'package:count_app/repo/abs_repo.dart';

abstract class AbsCountingRepo extends AbsRepo {
  create();
  read();
  update(int? newValue);
  delete();
}
