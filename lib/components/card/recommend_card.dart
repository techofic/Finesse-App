import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatefulWidget {
  const RecommendCard({Key? key}) : super(key: key);

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //height: 113,
          padding: const EdgeInsets.only(left: 18,right:18,top: 16),
          margin: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //color: Colors.lightBlueAccent,
            color: KColor.appBackground,
            boxShadow: [
              BoxShadow(
                //color: Colors.redAccent,
                color: KColor.shadowColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 12,
                offset:
                const Offset(4, 4), // changes position of shadow
              ),
              BoxShadow(
                //color: Colors.redAccent,
                color: KColor.shadowColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(
                    -4, -4), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/images/travel-bag.png',
              height: 57,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0, top: 4),
          child: Text(
            '\$44.90',
            style:
            KTextStyle.subtitle4.copyWith(color: KColor.blackbg),
          ),
        ),
      ],
    );
  }
}