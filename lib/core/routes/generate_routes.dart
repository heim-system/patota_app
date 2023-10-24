import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/presenter/auth_widget.dart';
import 'package:patota_app/app/modules/edit/presenter/edit_page.dart';
import 'package:patota_app/app/modules/home/presenter/home_page.dart';
import 'package:patota_app/app/modules/invite/presenter/invite_page.dart';
import 'package:patota_app/app/modules/login/presenter/register/login_register_page.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/register/presenter/register_page.dart';
import 'package:patota_app/core/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context) => const AuthWidget());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.loginRegister:
        return MaterialPageRoute(builder: (context) => const LoginRegisterPage());
      case Routes.patotaRegister:
        return MaterialPageRoute(builder: (context) => const PatotaRegisterPage());
      case Routes.patotaEdit:
        if (args is IPatota) {
          return MaterialPageRoute(builder: (context) => PatotaEditPage(patota: args));
        }
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.patotaInvite:
        if (args is IPatota) {
          return MaterialPageRoute(builder: (context) => PatotaInvitePage(patota: args));
        }
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
