import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_remove_patota_repository.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_remove_patota_datasourse.dart';

class RemovePatotaRepository implements IRemovePatotaRepository {
  final IRemovePatotaDatasource datasource;

  RemovePatotaRepository({required this.datasource});

  @override
  Future call(IPatota patota) async {
    await datasource(patota);
  }
}
