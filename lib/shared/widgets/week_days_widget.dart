import 'package:flutter/material.dart';
import 'package:patota_app/shared/enums/week_day_enum.dart';

class WeekDayWidget extends StatefulWidget {
  final List<bool> weekDay;
  const WeekDayWidget({
    super.key,
    required this.weekDay,
  });

  @override
  State<WeekDayWidget> createState() => _WeekDayWidgetState();
}

class _WeekDayWidgetState extends State<WeekDayWidget> {
  Set<int> selection = <int>{};

  @override
  void initState() {
    widget.weekDay.asMap().forEach((key, value) {
      if (value) {
        selection.add(key);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SegmentedButton<int>(
        selected: selection,
        emptySelectionAllowed: true,
        multiSelectionEnabled: true,
        showSelectedIcon: false,
        onSelectionChanged: (selected) {
          setState(() {
            selection = selected;
          });

          for (var i = 0; i < widget.weekDay.length; i++) {
            widget.weekDay[i] = selected.contains(i);
          }
        },
        segments: List.generate(
          WeekDayEnum.values.length,
          (index) {
            return ButtonSegment(
              value: index,
              label: Text(WeekDayEnum.values[index].translate.toUpperCase()[0]),
            );
          },
        ),
      ),
    );
  }
}
