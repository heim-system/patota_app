import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/edit/domain/repositories/i_update_patota_repository.dart';
import 'package:patota_app/app/modules/edit/domain/usecases/i_update_patota_usecase.dart';
import 'package:patota_app/app/modules/edit/domain/usecases/implementation/update_patota_usecase.dart';
import 'package:patota_app/app/modules/edit/external/datasources/update_patota_datasource.dart';
import 'package:patota_app/app/modules/edit/infrastructure/datasources/i_update_patota_datasource.dart';
import 'package:patota_app/app/modules/edit/infrastructure/repositories/update_patota_repository.dart';
import 'package:patota_app/app/modules/home/presenter/home_controller.dart';
import 'package:patota_app/app/modules/invite/presenter/invite_controller.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_get_patota_repository.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_remove_patota_repository.dart';
import 'package:patota_app/app/modules/patota/domain/repositories/i_set_patota_repository.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_get_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_remove_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_set_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/implementation/get_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/implementation/remove_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/implementation/set_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/external/datasources/get_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/external/datasources/remove_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/external/datasources/set_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/home_patota_controller.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_get_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_remove_patota_datasourse.dart';
import 'package:patota_app/app/modules/patota/infrastructure/datasources/i_set_patota_datasource.dart';
import 'package:patota_app/app/modules/patota/infrastructure/repositories/get_patota_repository.dart';
import 'package:patota_app/app/modules/patota/infrastructure/repositories/remove_patota_repository.dart';
import 'package:patota_app/app/modules/patota/infrastructure/repositories/set_patota_repository.dart';
import 'package:patota_app/app/modules/register/presenter/register_controller.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

Future setup() async {
  doctor.singleton(AuthService.new);
  doctor.singleton(RegisterController.new);
  doctor.singleton(HomeController.new);
  doctor.singleton(InviteController.new);

  doctor.instance<IUpdatePatotaDatasource>(UpdatePatotaDatasource.new);
  doctor.instance<IUpdatePatotaRepository>(() => UpdatePatotaRepository(datasource: doctor()));
  doctor.instance<IUpdatePatotaUsecase>(() => UpdatePatotaUsecase(repository: doctor()));

  doctor.instance<IGetPatotaDataSource>(GetPatotaDataSource.new);
  doctor.instance<IGetPatotaRepository>(() => GetPatotaRepository(datasource: doctor()));
  doctor.instance<IGetPatotaUsecase>(() => GetPatotaUsecase(repository: doctor()));

  doctor.instance<ISetPatotaDataSource>(() => SetPatotaDataSource(auth: doctor()));
  doctor.instance<ISetPatotaRepository>(() => SetPatotaRepository(datasource: doctor()));
  doctor.instance<ISetPatotaUsecase>(() => SetPatotaUsecase(repository: doctor()));

  doctor.instance<IRemovePatotaDatasource>(() => RemovePatotaDatasource());
  doctor.instance<IRemovePatotaRepository>(() => RemovePatotaRepository(datasource: doctor()));
  doctor.instance<IRemovePatotaUsecase>(() => RemovePatotaUsecase(repository: doctor()));

  doctor.singleton(
    () => HomePatotaController(
      getPatotaUsecase: doctor(),
      setPatotaUsecase: doctor(),
      removePatotaUsecase: doctor(),
    ),
  );
}
