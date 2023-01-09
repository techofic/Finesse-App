import 'package:finesse/src/features/cart/controller/zone_controller.dart';
import 'package:finesse/src/features/cart/model/city_model.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';
import 'package:finesse/src/features/cart/state/zone_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class DeliveryAddress extends StatefulWidget {
  String? cities;
  String? zones;
  final bool? checkCities;

  DeliveryAddress({Key? key, this.cities, this.zones, this.checkCities}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final zoneState = ref.watch(zoneProvider);
        final cityState = ref.watch(cityProvider);
        final List<Zone>? zoneData = zoneState is ZoneSuccessState ? zoneState.zoneModel?.zones : [];
        final List<City>? cityData = cityState is CitySuccessState ? cityState.cityModel?.cities : [];

        return Container(
          height: 48,
          width: context.screenWidth,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: KColor.searchColor.withOpacity(0.8)),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 9),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  widget.checkCities == true ? 'City' : 'Zone',
                  style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.4)),
                ),
                dropdownColor: KColor.appBackground,
                menuMaxHeight: context.screenHeight * 0.5,
                alignment: AlignmentDirectional.centerStart,
                value: widget.checkCities == true ? widget.cities : widget.zones,
                icon: const Icon(Icons.keyboard_arrow_down, color: KColor.blackbg),
                iconSize: 16,
                onChanged: (newValue) {
                  setState(() {
                    widget.checkCities == true ? widget.cities = newValue : widget.zones = newValue;
                    if (widget.checkCities == true) widget.zones = null;
                  });
                  if (widget.checkCities == true) {
                    ref.read(zoneProvider.notifier).allZone(id: widget.cities);
                  }
                },
                items: widget.checkCities == true
                    ? cityData?.map(
                        (location) {
                          return DropdownMenuItem(
                            value: location.id.toString(),
                            child: Text(
                              location.name.toString(),
                              style: KTextStyle.bodyText1.copyWith(
                                color: KColor.blackbg.withOpacity(0.4),
                              ),
                            ),
                          );
                        },
                      ).toList()
                    : zoneData?.map(
                        (position) {
                          return DropdownMenuItem(
                            value: position.id.toString(),
                            child: Text(
                              position.zoneName.toString(),
                              style: KTextStyle.bodyText1.copyWith(
                                color: KColor.blackbg.withOpacity(0.4),
                              ),
                            ),
                          );
                        },
                      ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
