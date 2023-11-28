import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patota_app/firebase_options.dart';

import 'doctor.dart';

Future<void> initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
