
import 'package:finesse/src/features/cart/controller/zone_controller.dart';
import 'package:finesse/src/features/cart/model/city_model.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';
import 'package:finesse/src/features/cart/state/zone_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../styles/k_text_style.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({Key? key}) : super(key: key);

  @override
  State<PickAddress> createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  String? _cities;
  String? _zones;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {
          final zoneState = ref.watch(zoneProvider);
          final cityState = ref.watch(cityProvider);
          final List<Zone>? zoneData =
          zoneState is ZoneSuccessState ? zoneState.zoneModel?.zones : [];
          final List<City>? cityData =
          cityState is CitySuccessState ? cityState.cityModel?.cities : [];

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
                          child: DropdownButton<String>(
                            key: (_cities != null) ? Key(_cities!) : UniqueKey(),
                            isExpanded: true,
                            hint: Text(
                              'city',
                              style: KTextStyle.subtitle3.copyWith(
                                color: KColor.blackbg.withOpacity(0.4),
                              ),
                            ),
                            dropdownColor: KColor.appBackground,
                            menuMaxHeight: context.screenHeight * 0.5,
                            alignment: AlignmentDirectional.bottomStart,
                            value: _cities,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: KColor.blackbg,
                            ),
                            iconSize: 16,

                            onChanged: (newValue) {
                              setState(() {
                                _cities = newValue;
                                _zones = null;
                                print('selected item : $_cities');
                              });
                              ref.read(zoneProvider.notifier).allZone(id: _cities);
                            },
                            items: cityData?.map(
                                  (location) {
                                return DropdownMenuItem(
                                  value: location.id.toString(),
                                  onTap:(){
                                    print('location : ${location.id}');
                                    print('location name : ${location.name}');
                                  },
                                  child: Text(
                                    location.name.toString(),
                                    style: KTextStyle.subtitle3.copyWith(
                                      color: KColor.blackbg.withOpacity(0.4),
                                    ),
                                  ),
                                );
                              },
                            ).toList() ?? [],
                          ),
                        ),
                      ),
                    ),

                    //======================= State
                    const SizedBox(height: 20),


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
                                print('selected zone : $_zones');
                              });
                            },
                            items: zoneData?.map(
                                  (position) {
                                return DropdownMenuItem(
                                  value: position.id.toString(),
                                  onTap:(){
                                    print('zone city location : ${position.cityId}');
                                    print('zone location name : ${position.zoneName}');
                                  },
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
