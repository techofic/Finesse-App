import 'package:finesse/src/features/cart/components/cart_items.dart';
import 'package:finesse/src/features/cart/components/cart_total.dart';
import 'package:finesse/src/features/cart/components/get_discount.dart';
import 'package:finesse/src/features/cart/components/get_location.dart';
import 'package:finesse/src/features/cart/controller/discount_controller.dart';
import 'package:finesse/src/features/cart/controller/zone_controller.dart';
import 'package:finesse/src/features/cart/model/promocode_model.dart';
import 'package:finesse/src/features/cart/model/refferralcode_model.dart';
import 'package:finesse/src/features/cart/state/code_state.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/cart_controller.dart';

class ProductsAmount extends StatefulWidget {
  const ProductsAmount({Key? key}) : super(key: key);

  @override
  State<ProductsAmount> createState() => _ProductsAmountState();
}

class _ProductsAmountState extends State<ProductsAmount> {
  String? _cities;
  String? _zones;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final codeState = ref.watch(discountProvider);
        final PromoCodeModel? promoCodeData = codeState is PromoCodeSuccessState
            ? codeState.promoCodeModel
            : null;
        final ReferralCodeModel? referralCodeData =
            codeState is ReferralCodeSuccessState
                ? codeState.referralCodeModel
                : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartItems(),
            DeliveryAddress(cities: _cities, zones: _zones, checkCities: true),
            const SizedBox(height: 20),
            DeliveryAddress(cities: _cities, zones: _zones, checkCities: false),
            const SizedBox(height: 20),
            const GetDiscount(),
            SizedBox(height: context.screenHeight * 0.05),
            CardTotal(
              subTotal: ref.read(cartProvider.notifier).subtotal,
              deliveryFee: ref.read(zoneProvider.notifier).deliveryFee,
              rounding: ref.read(zoneProvider.notifier).roundingFee,
              discount: promoCodeData?.success == true
                  ? '${promoCodeData?.coupon.discount.toString()}%'
                  : referralCodeData?.success == true
                      ? '${referralCodeData?.discount.toString()}%'
                      : '0',
              total: ref.read(zoneProvider.notifier).totalAmount,
            ),
            SizedBox(height: context.screenHeight * 0.05),
          ],
        );
      },
    );
  }
}
