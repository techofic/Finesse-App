import 'package:dotted_line/dotted_line.dart';
import 'package:finesse/src/features/checkout/components/add_new_address.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/src/features/checkout/components/preview_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<String> items = [
    "Your parcel has been picked.6 May,2021 16:34",
    "Your parcel has been picked.6 May,2021 16:34",
    "Your parcel has been picked.6 May,2021 16:34",
    "Your parcel has been picked.6 May,2021 16:34",
  ];
  List<String> track = [
    "Picked",
    "In transit",
    "Out for delivery",
    "Delivered",
  ];

  List<dynamic> trackIcons = [
    'assets/images/picked.png',
    'assets/images/inTransit.png',
    'assets/images/productDelivery.png',
    'assets/images/delivered.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.bounceInOut,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _steps(index, context),
                const SizedBox(width: 18),
                _buildSteps(index),
                const SizedBox(width: 10),
                _stepsDescription(index),
              ],
            ),
          ),
        );
      },
    );
    Column(
      children: [
        /// MAIN BODY
        if (currentIndex == 0) const AddNewAddress(),
        if (currentIndex == 1) const PaymentPage(),
        if (currentIndex == 2) const PreviewPage(),
      ],
    );
  }

  Container _steps(int index, BuildContext context) {
    return Container(
      //color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.screenHeight * 0.05,
            //color: Colors.redAccent,
            child: Image.asset(
              trackIcons[index],
              height: 42,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            //color: Colors.orange,
            width: context.screenWidth * 0.17,
            child: Text(
              textAlign: TextAlign.center,
              track[index],
              style: KTextStyle.subtitle3.copyWith(
                color: KColor.blackbg,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible _stepsDescription(int index) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(top: (context.screenHeight * 0.04) / 2),
        child: Text(
          textAlign: TextAlign.left,
          items[index],
          style: KTextStyle.subtitle3.copyWith(
            color: index == currentIndex
                ? KColor.blackbg
                : KColor.textBorder.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Column _buildSteps(int index) {
    return Column(
      children: [
        Padding(
          padding: index == 0
              ? EdgeInsets.only(top: (context.screenHeight * 0.04) / 2)
              : const EdgeInsets.all(0),
          child: SizedBox(
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
        ),
        index == items.length - 1
            ? Container()
            : Container(
          color: Colors.lightBlue,
          child: SizedBox(
            width: 20,
            height:92,
            child: Align(
              alignment: Alignment.center,
              child: DottedLine(
                direction: Axis.vertical,
                dashLength: 6.0,
                dashColor: KColor.textBorder.withOpacity(0.8),
                lineThickness: 1,
                dashGapLength: 6.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
