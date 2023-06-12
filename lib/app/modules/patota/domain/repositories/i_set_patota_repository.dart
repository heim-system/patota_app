import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';

abstract class ISetPatotaRepository {
  Future call(Patota newPatota);
}
