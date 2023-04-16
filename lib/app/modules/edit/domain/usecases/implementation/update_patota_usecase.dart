import 'package:patota_app/app/modules/edit/domain/repositories/i_update_patota_repository.dart';
import 'package:patota_app/app/modules/edit/domain/usecases/i_update_patota_usecase.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';

class UpdatePatotaUsecase extends IUpdatePatotaUsecase {
  final IUpdatePatotaRepository repository;

  UpdatePatotaUsecase({required this.repository});

  @override
  Future<void> call(IPatota updatePatota) async {
    await repository(updatePatota);
  }
}
