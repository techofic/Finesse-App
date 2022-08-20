import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      //width: context.screenWidth*0.9,
      height: 114,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: KColor.appBackground,
        // color: Colors.lightBlue,
        boxShadow: [
          BoxShadow(
            color: KColor.shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(4, 4), // changes position of shadow
          ),
          BoxShadow(
            color: KColor.shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(-4, -4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: KColor.cirColor.withOpacity(0.6),
            child: Image.asset('assets/images/sound.png',height: 22,),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    'Price dropped on hanging clock, grab yours now before stock runs out!',
                    style: KTextStyle.subtitle3.copyWith(color: KColor.blackbg.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '12:34',
                  style: KTextStyle.subtitle5
                      .copyWith(color: KColor.blackbg.withOpacity(0.3)),
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
