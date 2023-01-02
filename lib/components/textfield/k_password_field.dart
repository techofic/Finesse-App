import 'package:finesse/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  final String label;
  final String hintText;

  PasswordTextField({Key? key, required this.label, required this.controller, required this.hintText}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<PasswordTextField> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = true;
  final FocusNode _focusNode = FocusNode();

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
          return 'Please FillUp';
        }
        return null;
      },
      obscureText: _passwordVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(AssetPath.passwordIcon),
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
        suffixIcon: IconButton(
          icon: _passwordVisible
              ? Icon(
                  Icons.visibility_off,
                  size: 16,
                  color: Colors.black.withOpacity(0.4),
                )
              : SvgPicture.asset('assets/images/visible.svg'),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColor.textBorder.withOpacity(0.8),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
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
