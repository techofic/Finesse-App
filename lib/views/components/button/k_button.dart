import 'package:finesse/views/styles/k_text_style.dart';
import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';

class KButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  const KButton({this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
          color: KColor.blackbg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '$title',
            style:KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground)
          ),
        ),
      ),
    );
  }
}
