import 'package:patota_app/app/modules/patota/domain/repositories/i_set_patota_repository.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_set_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';

class SetPatotaUsecase implements ISetPatotaUsecase {
  final ISetPatotaRepository repository;

  SetPatotaUsecase({required this.repository});

  @override
  Future call(Patota newPatota) async {
    await repository(newPatota);
  }
}
