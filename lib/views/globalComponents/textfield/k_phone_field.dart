import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class PhoneTextField extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool readOnly;

  PhoneTextField(
      {Key? key,
      required this.lable,
      required this.controller,
      required this.hintText,
      required this.readOnly})
      : super(key: key);

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
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: SvgPicture.asset(
            'assets/images/phoneIcon.svg',
            color: KColor.baseBlack.withOpacity(0.4),
            height: 16,
            width: 16,
          ),
        ),
        hintText: hintText,
        hintStyle: KTextStyle.subtitle3
            .copyWith(color: KColor.blackbg.withOpacity(0.4)),
        labelText: lable,
        labelStyle: KTextStyle.subtitle3
            .copyWith(color: KColor.blackbg.withOpacity(0.4)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 19.0),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            color: KColor.textBorder.withOpacity(0.8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColor.textBorder.withOpacity(0.8),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: KColor.blackbg, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
