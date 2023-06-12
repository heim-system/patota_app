import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/edit/domain/usecases/i_update_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/domain/usecases/i_set_patota_usecase.dart';
import 'package:patota_app/app/modules/patota/infrastructure/models/patota.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class RegisterController extends ValueNotifier<Patota> {
  RegisterController() : super(Patota());

  final IUpdatePatotaUsecase _update = doctor<IUpdatePatotaUsecase>();
  final ISetPatotaUsecase setPatotaUsecase = doctor<ISetPatotaUsecase>();

  void update() async {
    await _update(value);
  }

  void addPatota() async {
    await setPatotaUsecase(value);
  }

  Set<int> getWeekDays() {
    final Set<int> result = {};

    for (var i = 0; i < value.weekDay.length; i++) {
      if (value.weekDay[i]) {
        result.add(i);
      }
    }
    return result;
  }
}
