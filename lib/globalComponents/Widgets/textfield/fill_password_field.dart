import 'package:flutter/material.dart';

import '../../../constants/color/app_color.dart';
import '../../Style/k_text_style.dart';

class FillTextFieldPassword extends StatefulWidget {
  final String lable;
  final String hintText;

  FillTextFieldPassword(
      {required this.lable, required this.controller, required this.hintText});

  TextEditingController controller = TextEditingController();

  @override
  State<FillTextFieldPassword> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<FillTextFieldPassword> {
  bool _passwordVisible = true;

  @override
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
          hintStyle: KTextStyle.subtitle3.copyWith(color: blackbg),
          labelText: widget.lable,
          labelStyle: KTextStyle.subtitle3.copyWith(color: blackbg),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible
                  ? Icons.visibility_off //visibility
                  : Icons.visibility_outlined,
              color: blackbg.withOpacity(0.4),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide.none
          ),
          filled: true,
          fillColor: const Color(0xFFEAE7E7)),
    );
  }
}
