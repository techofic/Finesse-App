import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDelivery extends StatelessWidget {
  const ProductDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery',
              style: KTextStyle.subtitle7.copyWith(color: Colors.black),
            ),
            SvgPicture.asset('assets/images/bottom-arrow.svg'),
          ],
        ),
        const SizedBox(height: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Standard Delivery',
                  style: KTextStyle.subtitle4.copyWith(
                    color: KColor.baseBlack.withOpacity(0.8),
                  ),
                ),
                Text(
                  '\$30',
                  style: KTextStyle.subtitle7.copyWith(color: KColor.baseBlack),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              '20-25 working days',
              style: KTextStyle.description
                  .copyWith(color: KColor.blackbg.withOpacity(0.5)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(
                color: KColor.dividerColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Standard Delivery',
                  style: KTextStyle.subtitle4.copyWith(
                    color: KColor.baseBlack.withOpacity(0.8),
                  ),
                ),
                SvgPicture.asset('assets/images/bottom-arrow.svg'),
              ],
            ),
            const SizedBox(height: 35),
          ],
        )
      ],
    );
  }
}
