import 'package:dotted_line/dotted_line.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/src/features/checkout/components/preview_page.dart';
import 'package:finesse/src/features/checkout/components/take_address.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_text_style.dart';

class stepper extends StatefulWidget {
  const stepper({Key? key}) : super(key: key);

  @override
  State<stepper> createState() => _stepperState();
}

class _stepperState extends State<stepper> {
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
                      //_stepsDescription(index),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        stepTitle(),
        SizedBox(height: context.screenHeight*0.03),
        if (currentIndex == 0) const AddressPage(),
        if (currentIndex == 1) const PaymentPage(),
        if (currentIndex == 2) const PreviewPage(),

      ],
    );
  }

  Row _buildSteps(int index) {
    return Row(
      children: [
        Container(
          margin: index == 0
              ? const EdgeInsets.only(left: 24.0)
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
        //index == checkout.length - 1?const SizedBox(width: 12,):const SizedBox(width: 0,),
        index == checkout.length - 1
            ? Container()
            : Container(
                //color: Colors.lightBlue,
                child: SizedBox(
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
              ),
      ],
    );
  }

  Container stepTitle(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      // margin: index==0?
      // const EdgeInsets.only(left: 12):
      // index<checkout.length?
      // const EdgeInsets.all(0):
      // index==checkout.length-1?
      // const EdgeInsets.only(right: 20):
      // const EdgeInsets.all(0),

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

  Container _stepsDescription(int index) {
    return Container(
      color: Colors.orangeAccent,
      child: Text(
        textAlign: TextAlign.center,
        checkout[index],
        style: KTextStyle.subtitle3.copyWith(
          color: index == currentIndex
              ? KColor.blackbg
              : KColor.textBorder.withOpacity(0.8),
        ),
      ),
    );
  }
}
