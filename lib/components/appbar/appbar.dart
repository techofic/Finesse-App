import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class KappBar extends StatelessWidget {
  final String? title;
  final bool? checkTitle;
  const KappBar({this.title,this.checkTitle,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColor.appBackground,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: checkTitle == true?Text(
        '$title',
        style: KTextStyle.subtitle7.copyWith(
          color: KColor.blackbg,
        ),
      ):Container(),
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          size: 24,
          color: KColor.blackbg,
        ),
      ),
    );
  }
}
