import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/src/features/checkout/components/payment_category.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/appbar/appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(checkTitle: true, title: 'Checkout'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/stepper_two.svg'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment',
                  style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                ),
                const SizedBox(height: 16),
                const PaymentCategory()
              ],
            ),
            SizedBox(height: context.screenHeight * 0.01),
            KButton(
              title: 'Preview And Confirm',
              onTap: () {
                Navigator.pushNamed(context, '/preview');
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
