import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IInvitePatotaDatasource {
  Future<void> call({required IPatota patota, required String userEmail});
}
