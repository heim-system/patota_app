import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IRemovePatotaRepository {
  Future call(IPatota patota) async {}
}
