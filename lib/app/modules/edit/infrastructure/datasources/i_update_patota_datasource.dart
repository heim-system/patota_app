import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';

abstract class IUpdatePatotaDatasource {
  Future<void> call({required IPatota patotaUpdate});
}
