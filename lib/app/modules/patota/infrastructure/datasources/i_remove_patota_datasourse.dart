import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IRemovePatotaDatasource {
  Future call(IPatota patota) async {}
}
