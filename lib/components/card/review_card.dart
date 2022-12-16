import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
            offset:
            const Offset(-4, -4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/watch-two.png',
            height: 49,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hanging Clock',
                style: KTextStyle.subtitle4.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "\$44.90",
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.blackbg,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}