import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyOrderCard extends StatelessWidget {
  final bool isChecked;

  const MyOrderCard({required this.isChecked, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: KColor.appBackground,
        boxShadow: [
          BoxShadow(
            color: KColor.shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(4, 4), // changes position of shadow
          ),
          BoxShadow(
            color: KColor.shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(-4, -4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ID: #99045677 ",
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              Text(
                isChecked == true ? "Delivered" : "Shipped",
                style: KTextStyle.subtitle4.copyWith(
                  color: isChecked == true ? KColor.selectColor : KColor.red12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Placed on 8 May",
            style: KTextStyle.subtitle3.copyWith(
              color: KColor.blackbg.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Mariam Crane",
            style: KTextStyle.subtitle3.copyWith(
              color: KColor.blackbg.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "+97 4556 7681",
            style: KTextStyle.subtitle3.copyWith(
              color: KColor.blackbg.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                Text(
                  "Total : ",
                  style: KTextStyle.subtitle4.copyWith(
                    color: KColor.blackbg.withOpacity(0.7),
                  ),
                ),
                Text(
                  "\$44.90",
                  style: KTextStyle.subtitle4.copyWith(
                    color: KColor.blackbg.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/success.svg', height: 18),
                  const SizedBox(width: 3),
                  Text(
                    "Payment made via Paypal",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              if (isChecked == true)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/orderDetails');
                  },
                  child: Container(
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: KColor.blackbg.withOpacity(0.7),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Review',
                          style: KTextStyle.subtitle1.copyWith(
                            color: KColor.blackbg,
                          ),
                        ),
                        const SizedBox(width: 3),
                        SvgPicture.asset('assets/images/edit.svg', height: 20)
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
