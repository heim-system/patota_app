import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IUpdatePatotaRepository {
  Future<void> call(IPatota patotaUpdate);
}
