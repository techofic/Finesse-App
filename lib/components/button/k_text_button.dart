
import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class KTextButton extends StatelessWidget {
  final String? title;
  final String? price;
  final VoidCallback? onTap;

  const KTextButton({this.price,this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
          color: KColor.blackbg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '$title',
                style:KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground)
            ),
            Text(
                '$price',
                style:KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground)
            ),
          ],
        ),
      ),
    );
  }
}
