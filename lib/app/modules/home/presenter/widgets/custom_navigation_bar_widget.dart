import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/home/presenter/home_controller.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  const CustomNavigationBarWidget({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: homeController,
      builder: (context, _) {
        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: homeController.value,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (value) {
            homeController.changeMenu(value);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Usuário',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Configuração',
            ),
          ],
        );
      },
    );
  }
}
