import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/stepper/k_stepper.dart';
import 'package:finesse/src/features/checkout/components/take_address.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_stepper/stepper.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedIndex = 0;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [

             KStepper(),
            //AddressPage(),
            // PaymentPage(),
            // PreviewPage()
          ],
        ),
      ),
    );
  }
}
