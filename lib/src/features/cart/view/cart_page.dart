import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/src/features/cart/components/cart_total.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> watchName = [
    'Hanging Clock',
    'Atomic Clock',
    'Mechanical Clock',
    'Spring-Driven Clock',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: watchName.length,
                itemBuilder: (ctx, index) {
                  return WishlistCard(
                    isChecked: false,
                    productName: watchName[index],
                    cancel: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    delete: () {
                      setState(() {
                        watchName.removeAt(index);
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              ),
              SizedBox(height: context.screenHeight * 0.05),
              const CardTotal(),
              SizedBox(height: context.screenHeight * 0.05),
              Row(
                children: [
                  Flexible(
                    child: KBorderButton(
                      title: 'Go Back',
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: KButton(
                      title: 'Checkout',
                      onTap: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
