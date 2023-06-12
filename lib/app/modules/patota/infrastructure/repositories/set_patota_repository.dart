import 'package:patota_app/app/modules/patota/domain/repositories/i_set_patota_repository.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_set_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';

class SetPatotaRepository implements ISetPatotaRepository {
  final ISetPatotaDataSource datasource;

  SetPatotaRepository({required this.datasource});

  @override
  Future call(Patota newPatota) async {
    await datasource(newPatota);
  }
}
