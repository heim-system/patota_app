import '../entities/i_patota.dart';

abstract class IGetPatotaUsecase {
  Future<List<IPatota>> call();
}
