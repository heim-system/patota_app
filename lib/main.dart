import 'package:flutter/material.dart';
import 'package:patota_app/app/app_widget.dart';
import 'package:patota_app/core/config/config.dart';

void main() async {
  await initConfigurations();
  runApp(const MyApp());
}
