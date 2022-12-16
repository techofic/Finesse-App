import 'package:finesse/src/features/cart/controller/zone_controller.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';
import 'package:finesse/src/features/cart/state/zone_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ZoneDropdown extends StatefulWidget {
  const ZoneDropdown({Key? key}) : super(key: key);

  @override
  State<ZoneDropdown> createState() => _ZoneDropdownState();
}

class _ZoneDropdownState extends State<ZoneDropdown> {
  String? _zones;
  String? _cities;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final zoneState = ref.watch(zoneProvider);

        final List<Zone>? zoneData =
            zoneState is ZoneSuccessState ? zoneState.zoneModel?.zones : [];

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: KColor.searchColor.withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 9),
                        child: DropdownButton(
                          key: (_zones != null) ? Key(_zones!) : UniqueKey(),
                          isExpanded: true,
                          hint: Text(
                            'zone',
                            style: KTextStyle.subtitle3.copyWith(
                              color: KColor.blackbg.withOpacity(0.4),
                            ),
                          ),
                          dropdownColor: KColor.appBackground,
                          menuMaxHeight: context.screenHeight * 0.5,
                          alignment: AlignmentDirectional.bottomStart,
                          value: _zones,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: KColor.blackbg,
                          ),
                          iconSize: 16,
                          onChanged: (newValue) {
                            setState(() {
                              _zones = newValue as String?;
                              _cities = null;
                            });
                            ref
                                .read(zoneProvider.notifier)
                                .allZone();
                          },
                          items: zoneData?.map(
                            (position) {
                              return DropdownMenuItem(
                                value: position.id.toString(),
                                child: Text(
                                  position.zoneName.toString(),
                                  style: KTextStyle.subtitle3.copyWith(
                                    color: KColor.blackbg.withOpacity(0.4),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
