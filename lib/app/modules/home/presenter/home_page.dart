import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/home/presenter/home_controller.dart';
import 'package:patota_app/app/modules/home/presenter/widgets/custom_navigation_bar_widget.dart';
import 'package:patota_app/app/modules/patota/home_patota_controller.dart';
import 'package:patota_app/app/modules/patota/home_patota_page.dart';
import 'package:patota_app/app/modules/user/user_page.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';
import 'package:patota_app/core/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final _auth = doctor<AuthService>();
  final _homeController = doctor<HomeController>();
  final _homePatotaController = doctor<HomePatotaController>();

  final List _pages = [
    const HomePatotaPage(),
    const UserPage(),
    const Icon(
      Icons.settings,
      size: 50,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _homePatotaController.getPatotas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patota'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              try {
                _auth.logout().then((_) => Navigator.popAndPushNamed(context, Routes.initial));
              } catch (e) {
                /*ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erro ao efetuar Logoff'),
                  ),
                );*/
              }
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([_homeController]),
        builder: (context, _) {
          return Center(
            child: _pages.elementAt(_homeController.value),
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBarWidget(
        homeController: _homeController,
      ),
    );
  }
}
