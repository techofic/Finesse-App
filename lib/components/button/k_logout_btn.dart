import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class KLogoutButton extends StatelessWidget {
  final VoidCallback? tap;
  const KLogoutButton({Key? key, this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: context.screenWidth * 0.37,
        margin: const EdgeInsets.only(top: 20, bottom: 40),
        height: 54,
        decoration: BoxDecoration(
          color: KColor.blackbg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logout.png',
              height: 16,
            ),
            const SizedBox(width: 10),
            Text(
              'Logout',
              style: KTextStyle.subtitle7.copyWith(
                color: KColor.appBackground,
              ),
            )
          ],
        ),
      ),
    );
  }
}
