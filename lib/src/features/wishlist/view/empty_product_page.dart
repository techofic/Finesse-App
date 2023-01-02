import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class EmptyProductPage extends StatelessWidget {
  final String? message;

  const EmptyProductPage({this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.screenHeight * 0.8,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$message',
              style: KTextStyle.bodyText1.copyWith(
                color: KColor.blackbg,
              ),
            ),
            const SizedBox(height: 30),
            KButton(
              title: 'Continue Shopping',
              onTap: () {
                Navigator.pushNamed(context, '/mainScreen');
              },
            )
          ],
        ),
      ),
    );
  }
}
