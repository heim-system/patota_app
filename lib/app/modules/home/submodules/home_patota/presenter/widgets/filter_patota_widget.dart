import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/filter_patota_enum.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/home_patota_controller.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class FilterPatotaWidget extends StatefulWidget {
  const FilterPatotaWidget({super.key});

  @override
  State<FilterPatotaWidget> createState() => _FilterPatotaWidgetState();
}

class _FilterPatotaWidgetState extends State<FilterPatotaWidget> {
  Set<int> selection = <int>{0};
  final homePatotaController = doctor<HomePatotaController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SegmentedButton<int>(
        selected: selection,
        onSelectionChanged: (selected) {
          homePatotaController.filter = FilterPatotaEnum.values[selected.elementAt(0)];
          homePatotaController.filterPatota();
          setState(() {
            selection = selected;
          });
        },
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(fontSize: 9);
            } else {
              return const TextStyle(fontSize: 12);
            }
          }),
        ),
        segments: List.generate(
          FilterPatotaEnum.values.length,
          (index) {
            return ButtonSegment(
              value: index,
              label: Text(FilterPatotaEnum.values[index].translate),
            );
          },
        ),
      ),
    );
  }
}
