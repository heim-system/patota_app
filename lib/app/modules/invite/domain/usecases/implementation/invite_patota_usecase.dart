import 'package:patota_app/app/modules/invite/domain/repositories/i_invite_patota_repository.dart';
import 'package:patota_app/app/modules/invite/domain/usecases/i_invite_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

class InvitePatotaUsecase extends IInvitePatotaUsecase {
  final IInvitePatotaRepository repository;

  InvitePatotaUsecase({required this.repository});

  @override
  Future<void> call(IPatota patota, String userEmail) async {
    await repository(patota, userEmail);
  }
}
