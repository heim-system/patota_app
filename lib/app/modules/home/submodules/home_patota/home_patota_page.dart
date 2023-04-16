import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/home/presenter/widgets/custom_floating_action_button_widget.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/domain/entities/i_patota.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/home_patota_controller.dart';
import 'package:patota_app/app/modules/home/submodules/home_patota/presenter/widgets/patota_expansion_tile_widget.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';

import 'presenter/widgets/filter_patota_widget.dart';

class HomePatotaPage extends StatefulWidget {
  const HomePatotaPage({super.key});

  @override
  State<HomePatotaPage> createState() => _HomePatotaPageState();
}

class _HomePatotaPageState extends State<HomePatotaPage> {
  final homePatotaController = doctor<HomePatotaController>();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> refreshListView() async {
    await homePatotaController.getPatotas();
    await homePatotaController.filterPatota();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refreshListView();
      },
      child: Column(
        children: [
          const FilterPatotaWidget(),
          Expanded(
            child: Scaffold(
              body: ValueListenableBuilder(
                  valueListenable: homePatotaController,
                  builder: (context, List<IPatota> value, _) {
                    return ReorderableListView(
                      padding: const EdgeInsets.all(8),
                      proxyDecorator: (child, index, animation) {
                        return child;
                      },
                      children: List.generate(
                        value.length,
                        (index) => Card(
                          key: Key(index.toString()),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          child: PatotaExpansionTileWidget(patota: value[index]),
                        ),
                      ),
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final IPatota newPatota = value.removeAt(oldIndex);
                          value.insert(newIndex, newPatota);
                        });
                      },
                    );
                  }),
              floatingActionButton: CustomFloatingActionButtonWidget(afterOnPressed: refreshListView),
            ),
          ),
        ],
      ),
    );
  }
}
