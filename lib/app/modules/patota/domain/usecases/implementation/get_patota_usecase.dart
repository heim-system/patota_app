import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_get_patota_repository.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_get_patota_usecase.dart';

class GetPatotaUsecase implements IGetPatotaUsecase {
  final IGetPatotaRepository repository;

  GetPatotaUsecase({required this.repository});

  @override
  Future<List<IPatota>> call() async {
    return repository();
  }
}
