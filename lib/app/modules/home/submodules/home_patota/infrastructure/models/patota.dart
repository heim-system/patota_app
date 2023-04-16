import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';

class Patota implements IPatota {
  @override
  DateTime beginDate = DateTime.now();

  @override
  DateTime endDate = DateTime.now();

  @override
  String id = '';

  @override
  String name = '';

  @override
  String owner = '';

  @override
  TimeOfDay duration = const TimeOfDay(hour: 1, minute: 30);

  @override
  String place = '';

  @override
  TimeOfDay time = TimeOfDay.now();

  @override
  List<bool> weekDay = List.generate(7, (index) => false, growable: false);

  @override
  DateTime lastGame = DateTime.now();

  @override
  DateTime get nextGame {
    for (int i = 0; i < weekDay.length; i++) {
      if (weekDay[i]) {
        return lastGame.add(Duration(days: i + 1));
      }
    }
    return lastGame;
  }

  @override
  TimeOfDay get finalTime {
    int minute = time.minute + duration.minute;
    int hour = time.hour + duration.hour;
    if (minute >= 60) {
      hour += 1;
      minute -= 60;
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  void limpar() {
    id = '';
    name = '';
    owner = '';
    place = '';
    beginDate = DateTime.now();
    endDate = DateTime.now();
    weekDay = List.empty();
    lastGame = DateTime.now();
    duration = const TimeOfDay(hour: 1, minute: 30);
    time = const TimeOfDay(hour: 19, minute: 30);
  }

  Patota();

  Patota.copyFrom(IPatota patota) {
    id = patota.id;
    name = patota.name;
    owner = patota.owner;
    place = patota.place;
    beginDate = patota.beginDate;
    endDate = patota.endDate;
    weekDay = patota.weekDay;
    lastGame = patota.lastGame;
    duration = patota.duration;
    time = patota.time;
  }

  Patota.fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? '';
    name = map['name'] ?? '';
    owner = map['owner'] ?? '';
    place = map['place'] ?? '';
    beginDate = DateTime.tryParse(map['beginDate']) ?? DateTime.now();
    endDate = DateTime.tryParse(map['endDate']) ?? DateTime.now();
    weekDay = List.generate(7, (index) => map['weekDay'][index] ?? false);
    lastGame = DateTime.tryParse(map['lastGame']) ?? DateTime.now();

    if (map.containsKey('duration')) {
      duration = TimeOfDay(hour: map['duration']['hour'] ?? 0, minute: map['duration']['minute'] ?? 0);
    } else {
      duration = const TimeOfDay(hour: 1, minute: 30);
    }
    if (map.containsKey('time')) {
      time = TimeOfDay(hour: map['time']['hour'] ?? 0, minute: map['time']['minute'] ?? 0);
    } else {
      time = const TimeOfDay(hour: 1, minute: 30);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'beginDate': beginDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'id': id,
      'name': name,
      'owner': owner,
      'duration': {
        'hour': duration.hour,
        'minute': duration.minute,
      },
      'place': place,
      'time': {
        'hour': time.hour,
        'minute': time.minute,
      },
      'weekDay': weekDay,
      'lastGame': lastGame.toIso8601String(),
    };
  }
}
