import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

abstract class IInvitePatotaUsecase {
  Future<void> call(IPatota patota, String userEmail);
}
