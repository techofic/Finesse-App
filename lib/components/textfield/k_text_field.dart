import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class NameTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool readOnly;

  NameTextField(
      {Key? key,
      required this.label,
      required this.controller,
      required this.hintText,
      required this.readOnly})
      : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        String pattern = r'^[a-z A-Z]';
        RegExp regExp = RegExp(pattern);
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter valid name';
        }
        return null;
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? KTextStyle.subtitle3.copyWith(color: KColor.blackbg)
            : KTextStyle.subtitle3.copyWith(
                color: KColor.blackbg.withOpacity(0.4),
              ),
        labelText: widget.label,
        labelStyle: _focusNode.hasFocus
            ? KTextStyle.subtitle3.copyWith(color: KColor.blackbg)
            : KTextStyle.subtitle3.copyWith(
                color: KColor.blackbg.withOpacity(0.6),
              ),
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
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
