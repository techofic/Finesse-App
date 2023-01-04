import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/b_style.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
  SearchTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.callbackFunction,
    this.onTap,
    required this.readOnly,
  }) : super(key: key);
  final String hintText;
  final bool readOnly;
  TextEditingController controller = TextEditingController();
  final Function(String value)? callbackFunction;
  final Function()? onTap;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: (val) {
        if (widget.callbackFunction != null) widget.callbackFunction!(val);
      },
      onTap: widget.readOnly
          ? () {
              widget.onTap!();
            }
          : null,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(AssetPath.searchIcon),
        ),
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: KColor.searchColor.withOpacity(0.8),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
