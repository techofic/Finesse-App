import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/stepper/stepper.dart';
import 'package:finesse/styles/k_colors.dart';

import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(checkTitle: true, title: 'Checkout'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: const [Steppers()],
          ),
        ),
      ),
    );
  }
}
