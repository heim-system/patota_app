import 'dart:math';
import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/home_patota_controller.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';
import 'package:patota_app/core/routes/routes.dart';
import 'package:patota_app/core/utils/utils_date.dart';
import 'package:patota_app/core/utils/utils_time.dart';
import 'package:patota_app/shared/icons/app_icons.dart';

class PatotaExpansionTileWidget extends StatefulWidget {
  final IPatota patota;
  const PatotaExpansionTileWidget({super.key, required this.patota});

  @override
  State<PatotaExpansionTileWidget> createState() => _PatotaExpansionTileWidgetState();
}

class _PatotaExpansionTileWidgetState extends State<PatotaExpansionTileWidget> {
  final _auth = doctor<AuthService>();
  final _homePatotaController = doctor<HomePatotaController>();

  void _updateListView() {
    _homePatotaController.filterPatota();
    _homePatotaController.getPatotas();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.patota.name),
      leading: RotatedBox(quarterTurns: Random().nextInt(10), child: const Icon(AppIcons.soccerBall)),
      subtitle: Text('Proximo jogo: ${widget.patota.nextGame.toDate()} ${widget.patota.time.toTime()} - ${widget.patota.finalTime.toTime()}'),
      children: [
        ListTile(
          title: Text('Data fundação: ${widget.patota.beginDate.toDate()}'),
          trailing: Visibility(
            visible: _auth.value.userId == widget.patota.owner,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.patotaEdit, arguments: widget.patota).then((value) {
                  _updateListView();
                });
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
        ListTile(
          title: Text('Local jogo: ${widget.patota.place}'),
          trailing: Visibility(
            visible: _auth.value.userId == widget.patota.owner,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Deseja excluir a Patota'),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: () {
                            _homePatotaController.removePatotaUsecase(widget.patota).then((value) {
                              Navigator.pop(context);
                              _updateListView();
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ],
    );
  }
}
