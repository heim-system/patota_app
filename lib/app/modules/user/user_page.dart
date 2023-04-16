import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = doctor<AuthService>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(auth.value.displayName),
      ],
    );
  }
}
