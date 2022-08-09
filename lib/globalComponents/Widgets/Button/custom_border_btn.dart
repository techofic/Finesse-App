
import 'package:finesse/constants/color/app_color.dart';
import 'package:flutter/material.dart';
class CustomBorderButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  CustomBorderButton({ this.title,this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:MediaQuery.of(context).size.width,
        height:54,
        decoration: BoxDecoration(
          border: Border.all(color: blackbg,width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text('$title',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: blackbg,
            ),
          ),
        ),
      ),
    );
  }
}
