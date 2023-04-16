import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/home/presenter/home_page.dart';
import 'package:patota_app/app/modules/login/presenter/login/login_page.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    final auth = doctor<AuthService>();

    return Scaffold(
      body: AnimatedBuilder(
        animation: auth,
        builder: (context, child) {
          if (auth.isLoading) {
            return const LoginPage();
          } else if (auth.isReady) {
            return const HomePage();
          } else if (auth.isError) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(auth.errorMessage),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        auth.setReady();
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(body: SizedBox());
        },
      ),
    );
  }
}
