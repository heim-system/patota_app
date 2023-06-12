import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';

abstract class ISetPatotaDataSource {
  Future call(Patota newPatota);
}
