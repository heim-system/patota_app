import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/register/presenter/register_controller.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';
import 'package:patota_app/core/utils/utils_time.dart';
import 'package:patota_app/shared/widgets/week_days_widget.dart';

class PatotaRegisterPage extends StatelessWidget {
  const PatotaRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = doctor<AuthService>();
    final registerController = doctor<RegisterController>()..value.limpar;
    final nomeController = TextEditingController();
    final localController = TextEditingController();
    final horarioController = TextEditingController()..text = '19:30';
    final durationController = TextEditingController()..text = '1:30';

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nomeController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: localController,
                        decoration: const InputDecoration(
                          labelText: 'Local',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: horarioController,
                        decoration: InputDecoration(
                          labelText: 'Horário',
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final int hour = int.tryParse(horarioController.text.split(':')[0]) ?? 1;
                              final int minute = int.tryParse(horarioController.text.split(':')[1]) ?? 30;
                              final TimeOfDay? selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: hour, minute: minute));

                              horarioController.text = selectedTime!.toTime();
                            },
                            icon: const Icon(Icons.access_time),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: durationController,
                        decoration: InputDecoration(
                          labelText: 'Tempo jogo',
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final int hour = int.tryParse(durationController.text.split(':')[0]) ?? 1;
                              final int minute = int.tryParse(durationController.text.split(':')[1]) ?? 30;
                              final TimeOfDay? selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: hour, minute: minute));

                              durationController.text = selectedTime!.toTime();
                            },
                            icon: const Icon(Icons.access_alarm),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              WeekDayWidget(weekDay: registerController.value.weekDay),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        registerController.value
                          ..name = nomeController.text
                          ..place = localController.text
                          ..time = TimeOfDay(
                            hour: int.tryParse(horarioController.text.split(':')[0]) ?? 19,
                            minute: int.tryParse(horarioController.text.split(':')[1]) ?? 0,
                          )
                          ..duration = TimeOfDay(
                            hour: int.tryParse(durationController.text.split(':')[0]) ?? 1,
                            minute: int.tryParse(durationController.text.split(':')[1]) ?? 30,
                          )
                          ..owner = auth.value.userId;

                        registerController.addPatota();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Salvar',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
