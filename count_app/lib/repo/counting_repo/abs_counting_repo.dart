import 'package:count_app/repo/abs_repo.dart';

abstract class AbsCountingRepo extends AbsRepo {
  create();
  read();
  update({required int newValue});
  delete();
}
