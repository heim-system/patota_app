import 'package:flutter/material.dart';

abstract class IPatota {
  String id = '';
  String name = '';
  DateTime beginDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String owner = '';
  String place = '';
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay duration = const TimeOfDay(hour: 1, minute: 30);
  TimeOfDay get finalTime => const TimeOfDay(hour: 0, minute: 0);
  List<bool> weekDay = List.empty();
  DateTime lastGame = DateTime.now();
  DateTime get nextGame => DateTime.now();
}
