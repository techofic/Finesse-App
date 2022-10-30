import 'package:finesse/components/card/discount_card.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/controller/discount_controller.dart';
import 'package:finesse/src/features/cart/model/promocode_model.dart';
import 'package:finesse/src/features/cart/model/refferralcode_model.dart';
import 'package:finesse/src/features/cart/state/code_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetDiscount extends StatelessWidget {
  const GetDiscount({Key? key}) : super(key: key);

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
        TextEditingController promoCodeController = TextEditingController();
        TextEditingController referralCodeController = TextEditingController();
        TextEditingController giftCodeController = TextEditingController();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            referralCodeData?.success == true
                ? Container()
                : CouponCodeCard(
                    controller: promoCodeController,
                    title: 'Promo Code',
                    hintText: 'promo code',
                    buttonText:
                        codeState is LoadingState ? 'Clear' : 'Apply Code',
                    tap: () {
                      if (codeState is! LoadingState) {
                        ref
                            .read(discountProvider.notifier)
                            .sendPromoCode(code: promoCodeController.text);
                      }
                    },
                  ),
            const SizedBox(height: 17),
            promoCodeData?.success == true
                ? Container()
                : CouponCodeCard(
                    controller: referralCodeController,
                    title: 'Referral Code',
                    hintText: 'referral Code',
                    buttonText:
                        codeState is LoadingState ? 'Clear' : 'Apply Code',
                    tap: () {
                      if (codeState is! LoadingState) {
                        ref.read(discountProvider.notifier).sendCReferralCode(
                            barCode: referralCodeController.text);
                      }
                    },
                  ),
            const SizedBox(height: 17),
            if (codeState is ReferralCodeSuccessState) ...[
              Text(
                codeState.referralCodeModel!.message.toString(),
                style: KTextStyle.subtitle2.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 15),
            ],
            CouponCodeCard(
              controller: giftCodeController,
              title: 'Gift Voucher',
              hintText: 'gift voucher',
              buttonText: codeState is LoadingState ? 'Clear' : 'Apply Code',
              tap: () {
                if (codeState is! LoadingState) {
                  ref
                      .read(discountProvider.notifier)
                      .sendGiftVoucher(code: giftCodeController.text);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
