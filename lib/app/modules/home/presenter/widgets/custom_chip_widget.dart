import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/patota/filter_patota_enum.dart';
import 'package:patota_app/app/modules/patota/home_patota_controller.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

class CustomChipWiget extends StatefulWidget {
  const CustomChipWiget({
    super.key,
    required this.filter,
  });

  final FilterPatotaEnum filter;

  @override
  State<CustomChipWiget> createState() => _CustomChipWigetState();
}

class _CustomChipWigetState extends State<CustomChipWiget> {
  final homePatotaController = doctor<HomePatotaController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homePatotaController,
      builder: (context, List<IPatota> value, _) {
        return ChoiceChip(
          selected: homePatotaController.filter == widget.filter,
          label: Text(widget.filter.name),
          onSelected: (value) {
            setState(() {
              if (homePatotaController.filter == widget.filter) {
                homePatotaController.filter = FilterPatotaEnum.all;
              } else {
                homePatotaController.filter = widget.filter;
              }
            });
            homePatotaController.filterPatota();
          },
        );
      },
    );
  }
}
