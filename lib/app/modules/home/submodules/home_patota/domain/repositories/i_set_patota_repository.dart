import '../../infrastructure/models/patota.dart';

abstract class ISetPatotaRepository {
  Future call(Patota newPatota);
}
