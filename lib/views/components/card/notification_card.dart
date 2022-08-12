import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      height: 114,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: KColor.whiteBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: KColor.cirColor.withOpacity(0.6),
          ),
          // const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Price dropped on hanging clock, grab yours now before stock runs out!',
                    style: KTextStyle.subtitle4.copyWith(color: KColor.blackbg),
                  ),
                ),
                const SizedBox(height: 5),
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
