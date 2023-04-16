import 'package:patota_app/app/modules/home/submodules/home_patota/infrastructure/models/patota.dart';

abstract class ISetPatotaUsecase {
  Future call(Patota newPatota);
}
