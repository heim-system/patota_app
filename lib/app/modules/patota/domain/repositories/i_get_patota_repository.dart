import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IGetPatotaRepository {
  Future<List<IPatota>> call();
}
