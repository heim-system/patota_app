import '../../domain/entities/i_patota.dart';

abstract class IGetPatotaDataSource {
  Future<List<IPatota>> call();
}
