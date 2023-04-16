import 'package:flutter/material.dart';
import 'package:patota_app/core/routes/generate_routes.dart';
import 'package:patota_app/core/routes/routes.dart';
import 'package:patota_app/core/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patota',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: Routes.initial,
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
