import '../entities/i_patota.dart';

abstract class IGetPatotaRepository {
  Future<List<IPatota>> call();
}
