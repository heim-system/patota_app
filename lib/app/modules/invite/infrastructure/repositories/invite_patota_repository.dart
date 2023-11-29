import 'package:patota_app/app/modules/invite/domain/repositories/i_invite_patota_repository.dart';
import 'package:patota_app/app/modules/invite/infrastructure/datasources/i_invite_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';

class InvitePatotaRepository extends IInvitePatotaRepository {
  final IInvitePatotaDatasource datasource;

  InvitePatotaRepository({required this.datasource});

  @override
  Future<void> call(IPatota patota, String userEmail) async {
    datasource(patota: patota, userEmail: userEmail);
  }
}
