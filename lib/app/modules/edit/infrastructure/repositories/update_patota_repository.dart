import 'package:patota_app/app/modules/edit/domain/repositories/i_update_patota_repository.dart';
import 'package:patota_app/app/modules/edit/infrastructure/datasources/i_update_patota_datasource.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';

class UpdatePatotaRepository extends IUpdatePatotaRepository {
  final IUpdatePatotaDatasource datasource;

  UpdatePatotaRepository({required this.datasource});

  @override
  Future<void> call(IPatota patotaUpdate) async {
    datasource(patotaUpdate: patotaUpdate);
  }
}
