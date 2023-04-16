import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'doctor.dart';

Future<void> initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp();
}
