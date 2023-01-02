import 'package:flutter/material.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class KTextField extends StatefulWidget {
  final String hintText;

  KTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  State<KTextField> createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
        RegExp regExp = RegExp(pattern);
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter valid mobile number';
        }
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? KTextStyle.bodyText1.copyWith(color: KColor.blackbg)
            : KTextStyle.bodyText1.copyWith(
                color: KColor.blackbg.withOpacity(0.4),
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 19.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColor.textBorder.withOpacity(0.8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColor.textBorder.withOpacity(0.8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: KColor.blackbg, width: 1.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
