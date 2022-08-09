import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/color/app_color.dart';

class MaterialTextField extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool readOnly;

  MaterialTextField(
      {required this.lable,
      required this.controller,
      required this.hintText,
      required this.readOnly});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fillup';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/images/phoneIcon.svg',
            color: baseBlack.withOpacity(0.4),
          ),
        ),
        hintText: hintText,
        hintStyle: KTextStyle.subtitle3.copyWith(color: blackbg),
        labelText: lable,
        labelStyle: KTextStyle.subtitle3.copyWith(color: blackbg),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: textBorder)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textBorder, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blackbg, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
