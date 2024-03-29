import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_remove_patota_repository.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_remove_patota_usecase.dart';

class RemovePatotaUsecase implements IRemovePatotaUsecase {
  final IRemovePatotaRepository repository;

  RemovePatotaUsecase({required this.repository});

  @override
  Future call(IPatota patota) async {
    await repository(patota);
  }
}
