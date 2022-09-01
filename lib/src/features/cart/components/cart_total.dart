import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class CardTotal extends StatefulWidget {
  const CardTotal({Key? key}) : super(key: key);

  @override
  State<CardTotal> createState() => _CardTotalState();
}

class _CardTotalState extends State<CardTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 144,
      decoration: BoxDecoration(
        color: KColor.filterDividerColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              Text(
                '\$269.4',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VAT',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              Text(
                '\$269.4',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery fee',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              Text(
                '\$269.4',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Divider(
              color: KColor.dividerColor.withOpacity(0.2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.8),
                ),
              ),
              Text(
                '\$269.4',
                style: KTextStyle.sticker.copyWith(
                  color: KColor.blackbg.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
