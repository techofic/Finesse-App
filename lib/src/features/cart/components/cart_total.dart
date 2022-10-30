import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class CardTotal extends StatefulWidget {
  final int? subTotal;
  final int? deliveryFee;
  final int? rounding;
  final String? discount;
  int? total;

  CardTotal({
    Key? key,
    this.subTotal,
    this.deliveryFee,
    this.total,
    this.discount,
    this.rounding,
  }) : super(key: key);

  @override
  State<CardTotal> createState() => _CardTotalState();
}

class _CardTotalState extends State<CardTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 18.0),
      decoration: BoxDecoration(
        color: KColor.filterDividerColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getTotal('Subtotal', widget.subTotal.toString()),
          const SizedBox(height: 15),
          _getTotal('Delivery fee', widget.deliveryFee.toString()),
          const SizedBox(height: 15),
          _getTotal('Discount', widget.discount.toString()),
          const SizedBox(height: 15),
          _getTotal('Rounding', widget.rounding.toString()),
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
                widget.total.toString(),
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

  Row _getTotal(title, price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: KTextStyle.sticker.copyWith(
            color: KColor.blackbg.withOpacity(0.4),
          ),
        ),
        Text(
          price,
          style: KTextStyle.sticker.copyWith(
            color: KColor.blackbg.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
