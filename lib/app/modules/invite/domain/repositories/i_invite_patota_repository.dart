import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IInvitePatotaRepository {
  Future<void> call(IPatota patota, String userEmail);
}
