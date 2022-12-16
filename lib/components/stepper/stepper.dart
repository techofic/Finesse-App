import 'package:dotted_line/dotted_line.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_text_style.dart';

class Steppers extends StatefulWidget {
  final int? checkIndex;
  const Steppers({Key? key, this.checkIndex}) : super(key: key);

  @override
  State<Steppers> createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  List<String> checkout = [
    "Address",
    "Payment",
    "Preview",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.screenWidth,
          height: 25,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: checkout.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSteps(index),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        stepTitle(),
      ],
    );
  }

  Row _buildSteps(int index) {
    return Row(
      children: [
        Container(
          margin: index == 0
              ? const EdgeInsets.only(left: 18.0)
              : const EdgeInsets.all(0),
          height: 24,
          width: 24,
          child: currentIndex == index
              ? SvgPicture.asset(
                  'assets/images/success.svg',
                )
              : SvgPicture.asset(
                  'assets/images/inactiveIcon.svg',
                ),
        ),
        index == checkout.length - 1
            ? Container()
            : SizedBox(
              width: context.screenWidth / 2.9,
              child: Align(
                alignment: Alignment.center,
                child: DottedLine(
                  direction: Axis.horizontal,
                  dashLength: 6.0,
                  dashColor: KColor.textBorder.withOpacity(0.8),
                  lineThickness: 1,
                  dashGapLength: 4.0,
                ),
              ),
            ),
      ],
    );
  }

  Container stepTitle(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Address",
            style: KTextStyle.subtitle3.copyWith(
              color: KColor.blackbg
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            "Payment",
            style: KTextStyle.subtitle3.copyWith(
                color: KColor.blackbg
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            "Preview",
            style: KTextStyle.subtitle3.copyWith(
                color: KColor.blackbg
            ),
          ),
        ],
      ),
    );
  }

}
