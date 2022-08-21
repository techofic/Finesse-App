import 'package:dotted_line/dotted_line.dart';
import 'package:finesse/src/features/checkout/components/add_new_address.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/src/features/checkout/components/preview_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KStepper extends StatefulWidget {
  const KStepper({Key? key}) : super(key: key);

  @override
  State<KStepper> createState() => _KStepperState();
}

class _KStepperState extends State<KStepper> {

  List<String> items = [
    "Address",
    "Payment",
    "Preview",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.screenWidth,
            height: 55,
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 5 / 4,
              ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
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

                            index==items.length-1?Container():Flexible(
                              child: DottedLine(
                                dashLength: 8.0,
                                dashColor: KColor.textBorder.withOpacity(0.8),
                                dashGapLength: 6.0,
                              ),
                            ),
                            //Divider(color: Colors.black,thickness: 5,)
                          ],
                        ),
                        Text(
                          items[index],
                          style: KTextStyle.subtitle3.copyWith(
                            color: index == currentIndex
                                ? KColor.blackbg
                                : KColor.textBorder.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// MAIN BODY
          // if (currentIndex == 0) const AddNewAddress(),
          // if (currentIndex == 1) const PaymentPage(),
          // if (currentIndex == 2) const PreviewPage(),
        ],
      ),
    );
  }
}
