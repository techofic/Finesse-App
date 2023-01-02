import 'package:finesse/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class FillTextFieldPassword extends StatefulWidget {
  final String label;
  final String hintText;

  FillTextFieldPassword({Key? key, required this.label, required this.controller, required this.hintText}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  State<FillTextFieldPassword> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<FillTextFieldPassword> {
  bool _passwordVisible = true;

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fillup';
        }
        return null;
      },
      obscureText: _passwordVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: KTextStyle.bodyText1.copyWith(
          color: KColor.blackbg.withOpacity(0.4),
        ),
        labelText: widget.label,
        labelStyle: KTextStyle.bodyText1.copyWith(
          color: KColor.blackbg.withOpacity(0.4),
        ),
        suffixIcon: IconButton(
          icon: _passwordVisible
              ? Icon(
                  Icons.visibility_off,
                  color: KColor.blackbg.withOpacity(0.4),
                  size: 16,
                )
              : SvgPicture.asset(AssetPath.passwordVisibleIcon),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: KColor.searchColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
