import 'package:flutter/material.dart';

extension FormatTime on TimeOfDay {
  String toTime() {
    return '$hour:${minute.toString().padLeft(2, '0')}';
  }
}
