import 'package:patota_app/app/modules/home/submodules/home_patota/domain/repositories/i_set_patota_repository.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/infrastructure/datasources/i_set_patota_datasource.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/infrastructure/models/patota.dart';

class SetPatotaRepository implements ISetPatotaRepository {
  final ISetPatotaDataSource datasource;

  SetPatotaRepository({required this.datasource});

  @override
  Future call(Patota newPatota) async {
    await datasource(newPatota);
  }
}
