import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/invite/presenter/invite_controller.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class PatotaInvitePage extends StatelessWidget {
  final IPatota patota;
  const PatotaInvitePage({super.key, required this.patota});

  @override
  Widget build(BuildContext context) {
    final inviteController = doctor<InviteController>();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text('Convidar'),
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
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        inviteController.sendInvite(patotaId: patota.id, email: emailController.text);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Enviar convite',
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
