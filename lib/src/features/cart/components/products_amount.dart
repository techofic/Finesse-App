import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/components/textfield/k_field.dart';
import 'package:finesse/src/features/cart/components/cart_items.dart';
import 'package:finesse/src/features/cart/components/cart_total.dart';
import 'package:finesse/src/features/cart/controller/zone_controller.dart';
import 'package:finesse/src/features/cart/model/city_model.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';
import 'package:finesse/src/features/cart/state/zone_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsAmount extends StatefulWidget {
  const ProductsAmount({Key? key}) : super(key: key);

  @override
  State<ProductsAmount> createState() => _ProductsAmountState();
}

class _ProductsAmountState extends State<ProductsAmount> {
  TextEditingController promoCodeController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  TextEditingController giftCodeController = TextEditingController();

  var zones = [];
  String? _cities;
  String? _zones;
  int selectedIndex = 0;
  int selectedCities = 0;

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartItems(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    KDropdown(
                      hint: 'cities',
                      selectedReason: _cities,
                      data: cityData!.map((e) => e.name).toList(),
                      change: (value) {
                        setState(() {
                          _cities = value;
                        });
                        print('new id : $_cities');
                        print('new id : ${cityData[index].id}');
                      },
                    ),
                    const SizedBox(height: 20),
                    KDropdown(
                      hint: 'zones',
                      selectedReason: _zones,
                      data: zoneData!.map((e) => e.zoneName).toList(),
                      change: (value) {
                        setState(() {
                          _zones = value;
                          ref
                              .read(zoneProvider.notifier)
                              .allZone(id: cityData[index].id);
                          print('new id : $_cities');
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    _getOfferCode(),
                    SizedBox(height: context.screenHeight * 0.05),
                    CardTotal(
                      subTotal: 45,
                      deliveryFee: 55,
                      total: 55,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: context.screenHeight * 0.05),
          ],
        );
      },
    );
  }

  Column _getOfferCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promo Code',
          style: KTextStyle.subtitle1.copyWith(
            color: KColor.blackbg,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: KTextField(
                controller: promoCodeController,
                hintText: 'promo code',
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
                child: KButton(
              title: 'Apply Code',
              onTap: () {},
            ))
          ],
        ),
        const SizedBox(height: 15),
        Text(
          'Referral Code',
          style: KTextStyle.subtitle1.copyWith(
            color: KColor.blackbg,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: KTextField(
                controller: referralCodeController,
                hintText: 'referral code',
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
                child: KButton(
              title: 'Apply Code',
              onTap: () {},
            ))
          ],
        ),
        const SizedBox(height: 15),
        Text(
          'Gift Voucher',
          style: KTextStyle.subtitle1.copyWith(
            color: KColor.blackbg,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: KTextField(
                controller: giftCodeController,
                hintText: 'gift voucher',
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
                child: KButton(
              title: 'Apply Code',
              onTap: () {},
            ))
          ],
        ),
      ],
    );
  }
}
