import 'package:finesse/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class EmailTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool readOnly;

  EmailTextField({Key? key, required this.label, required this.controller, required this.hintText, required this.readOnly}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return 'Please enter a valid Email';
        }
        return null;
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(AssetPath.emailIcon),
        ),
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? KTextStyle.bodyText1.copyWith(color: KColor.blackbg)
            : KTextStyle.bodyText1.copyWith(
                color: KColor.blackbg.withOpacity(0.4),
              ),
        labelText: widget.label,
        labelStyle: _focusNode.hasFocus
            ? KTextStyle.bodyText1.copyWith(color: KColor.blackbg)
            : KTextStyle.bodyText1.copyWith(
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
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
