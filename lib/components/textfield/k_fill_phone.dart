import 'package:flutter/material.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class KFillPhone extends StatefulWidget {
  final String label;
  final String hintText;
  final bool readOnly;

  KFillPhone({Key? key, required this.label, required this.controller, required this.hintText, required this.readOnly}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  State<KFillPhone> createState() => _KFillPhoneState();
}

class _KFillPhoneState extends State<KFillPhone> {
  final FocusNode _focusNode = FocusNode();
  Color _color = KColor.searchColor.withOpacity(0.8);

  @override
  // ignore: must_call_super
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _color = Colors.transparent;
        });
      } else {
        setState(() {
          _color = KColor.searchColor.withOpacity(0.8);
        });
      }
    });
  }

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
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? KTextStyle.bodyText1.copyWith(
                color: KColor.blackbg.withOpacity(0.8),
              )
            : KTextStyle.bodyText1.copyWith(
                color: KColor.blackbg.withOpacity(0.4),
              ),
        labelText: widget.label,
        labelStyle: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.4)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColor.blackbg.withOpacity(0.8),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: _color,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
