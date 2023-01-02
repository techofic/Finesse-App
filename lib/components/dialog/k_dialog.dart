import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KDialog extends StatelessWidget {
  final String? message;
  final String? subMessage;
  final bool? checkTitle;
  final VoidCallback? tap;

  const KDialog({this.subMessage, this.checkTitle, this.message, this.tap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: KColor.appBackground,
      insetPadding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/success.svg'),
                const SizedBox(height: 16),
                Text(
                  '$message',
                  style: KTextStyle.headline3.copyWith(color: KColor.blackbg),
                ),
                if (checkTitle == true) const SizedBox(height: 16),
                if (checkTitle == true)
                  Text(
                    '$subMessage',
                    style: KTextStyle.bodyText1.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                InkWell(
                  onTap: tap,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 54,
                    decoration: BoxDecoration(
                      color: KColor.blackbg,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Go Back',
                        style: KTextStyle.subtitle1.copyWith(
                          color: KColor.whiteBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
