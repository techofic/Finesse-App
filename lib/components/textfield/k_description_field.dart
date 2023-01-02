import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class DescriptionTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool readOnly;
  final bool checkColor;

  DescriptionTextField(
      {Key? key, required this.label, required this.controller, required this.hintText, required this.checkColor, required this.readOnly})
      : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      readOnly: readOnly,
      controller: controller,
      maxLines: 8,
      minLines: 5,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.ltr,
        hintText: hintText,
        hintStyle: KTextStyle.bodyText1.copyWith(
          color: KColor.blackbg.withOpacity(0.4),
        ),
        labelText: label,
        labelStyle: KTextStyle.bodyText1.copyWith(
          color: KColor.blackbg.withOpacity(0.4),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: BorderSide(
            color: checkColor == false ? Colors.transparent : KColor.textBorder.withOpacity(0.8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: checkColor == false ? Colors.transparent : KColor.textBorder.withOpacity(0.8),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: checkColor == false ? Colors.transparent : KColor.blackbg,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        filled: checkColor == false ? true : false,
        fillColor: checkColor == false ? KColor.searchColor : Colors.transparent,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
