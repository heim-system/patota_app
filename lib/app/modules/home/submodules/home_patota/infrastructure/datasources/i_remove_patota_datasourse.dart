import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';

abstract class IRemovePatotaDatasource {
  Future call(IPatota patota) async {}
}
