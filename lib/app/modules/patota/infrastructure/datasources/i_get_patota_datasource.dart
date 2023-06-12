import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IGetPatotaDataSource {
  Future<List<IPatota>> call();
}
