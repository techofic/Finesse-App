import 'package:dotted_line/dotted_line.dart';
import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/src/features/checkout/components/preview_page.dart';
import 'package:finesse/src/features/checkout/components/take_address.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Checkout'),
      ),
      body: Column(
        children: [
          AddressPage(),
          // PaymentPage(),
          // PreviewPage()
        ],
      ),
    );
  }

}
