import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IUpdatePatotaUsecase {
  Future<void> call(IPatota updatePatota);
}
