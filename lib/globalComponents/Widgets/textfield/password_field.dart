import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color/app_color.dart';
import '../../Style/k_text_style.dart';

class MaterialTextFieldPassword extends StatefulWidget {
  final String lable;
  final String hintText;

  MaterialTextFieldPassword(
      {Key? key,
      required this.lable,
      required this.controller,
      required this.hintText})
      : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<MaterialTextFieldPassword> createState() => _MaterialTextFieldState();
}

class _MaterialTextFieldState extends State<MaterialTextFieldPassword> {
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
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/images/lock.svg',
          ),
        ),
        hintText: widget.hintText,
        hintStyle: KTextStyle.subtitle3.copyWith(color: blackbg),
        labelText: widget.lable,
        labelStyle: KTextStyle.subtitle3.copyWith(color: blackbg),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility_off : Icons.visibility_outlined,
            color: blackbg.withOpacity(0.4),
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: textBorder, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: blackbg, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
