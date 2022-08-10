import 'package:flutter/material.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class KBorderButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  const KBorderButton({this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
          border: Border.all(color: KColor.blackbg, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '$title',
            style:KTextStyle.subtitle1.copyWith(color: KColor.blackbg)
          ),
        ),
      ),
    );
  }
}
