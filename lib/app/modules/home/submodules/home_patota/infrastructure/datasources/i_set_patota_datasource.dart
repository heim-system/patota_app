import '../models/patota.dart';

abstract class ISetPatotaDataSource {
  Future call(Patota newPatota);
}
