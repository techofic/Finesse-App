import 'package:flutter/material.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class KFillNormal extends StatelessWidget {
  final String label;
  final String hintText;
  final bool readOnly;

  KFillNormal(
      {Key? key,
      required this.label,
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
        hintText: hintText,
        hintStyle: KTextStyle.subtitle3.copyWith(
          color: KColor.blackbg.withOpacity(0.4),
        ),
        labelText: label,
        labelStyle: KTextStyle.subtitle3.copyWith(
          color: KColor.blackbg.withOpacity(0.4),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: KColor.searchColor.withOpacity(0.8),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
