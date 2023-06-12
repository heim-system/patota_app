import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_get_patota_repository.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_get_patota_datasource.dart';

class GetPatotaRepository implements IGetPatotaRepository {
  final IGetPatotaDataSource datasource;

  GetPatotaRepository({required this.datasource});

  @override
  Future<List<IPatota>> call() async {
    return datasource();
  }
}
