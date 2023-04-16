import 'package:flutter/material.dart';

class CustomLogoWidget extends StatefulWidget {
  const CustomLogoWidget({super.key});

  @override
  State<CustomLogoWidget> createState() => _CustomLogoWidgetState();
}

class _CustomLogoWidgetState extends State<CustomLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Image.asset(
        'assets/images/logo/patota_logo_512.png',
      ),
    );
  }
}
