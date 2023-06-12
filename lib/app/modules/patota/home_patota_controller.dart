import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_get_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_remove_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';

import '../../../../../core/dependency_injector/doctor.dart';
import 'domain/usecases/i_set_patota_usecase.dart';
import 'filter_patota_enum.dart';

class HomePatotaController extends ValueNotifier<List<IPatota>> {
  HomePatotaController({required this.getPatotaUsecase, required this.setPatotaUsecase, required this.removePatotaUsecase}) : super([]);

  final List<IPatota> _list = [];
  final auth = doctor<AuthService>();
  final IGetPatotaUsecase getPatotaUsecase;
  final ISetPatotaUsecase setPatotaUsecase;
  final IRemovePatotaUsecase removePatotaUsecase;
  FilterPatotaEnum filter = FilterPatotaEnum.all;

  Future filterPatota() async {
    value = _list.where((element) {
      switch (filter) {
        case FilterPatotaEnum.all:
          return true;
        case FilterPatotaEnum.owner:
          return (element.owner.compareTo(auth.value.userId).isEven);
        case FilterPatotaEnum.progress:
          return (element.endDate.isBefore(DateTime.now()));
        case FilterPatotaEnum.ended:
          return (element.endDate.isAfter(DateTime.now()));
        default:
          return true;
      }
    }).toList();
  }

  Future getPatotas() async {
    _list.clear();
    final List<IPatota> result = await getPatotaUsecase();
    _list.addAll(result);
    value = _list.toList();
    debugPrint('GetPatotas');
  }

  List<IPatota> get patotas => value;

  Future<void> addPatota(Patota newPatota) async {
    await setPatotaUsecase(newPatota);
  }

  Future<void> removePatota(Patota patota) async {
    await removePatotaUsecase(patota);
  }
}
