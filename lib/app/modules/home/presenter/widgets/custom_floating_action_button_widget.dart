import 'package:flutter/material.dart';
import 'package:patota_app/core/routes/routes.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  final Function() afterOnPressed;
  const CustomFloatingActionButtonWidget({super.key, required this.afterOnPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.patotaRegister).then((value) => afterOnPressed());
      },
      child: const Icon(Icons.add),
    );
  }
}
