import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
  final String lable;
  final String hintText;
  final bool readOnly;

  EmailTextField(
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
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/images/email.svg',
          ),
        ),
        hintText: hintText,
        hintStyle: KTextStyle.subtitle3
            .copyWith(color: KColor.blackbg.withOpacity(0.4)),
        labelText: lable,
        labelStyle: KTextStyle.subtitle3
            .copyWith(color: KColor.blackbg.withOpacity(0.4)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
