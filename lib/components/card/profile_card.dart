import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatelessWidget {
  final String? title;
  final String? image;
  final VoidCallback onPressed;

  const ProfileCard(
      {this.title, this.image,required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(color: KColor.appBackground),
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: context.screenWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: KColor.cirColor,
                          radius: 24,
                          child: Image.asset('$image',height: 17,),
                        ),
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '$title',
                          style: KTextStyle.subtitle7.copyWith(
                            color: KColor.blackbg,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/images/back-arrow.svg',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
