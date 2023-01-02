import 'package:finesse/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class PhoneTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool readOnly;

  PhoneTextField({Key? key, required this.label, required this.controller, required this.hintText, required this.readOnly}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
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
      keyboardType: TextInputType.number,
      readOnly: widget.readOnly,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: SvgPicture.asset(
            AssetPath.phoneIcon,
            color: KColor.baseBlack.withOpacity(0.4),
            height: 16,
            width: 16,
          ),
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
