import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';

abstract class ISetPatotaUsecase {
  Future call(Patota newPatota);
}
