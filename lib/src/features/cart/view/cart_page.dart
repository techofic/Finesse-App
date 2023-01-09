import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/cart/components/products_amount.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    bool checkLogin = getBoolAsync(isLoggedIn, defaultValue: false);
    return checkLogin
        ? Scaffold(
            backgroundColor: KColor.appBackground,
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductsAmount(),
                    SizedBox(height: context.screenHeight * 0.05),
                    Row(
                      children: [
                        Flexible(
                          child: KBorderButton(
                            title: 'Go Back',
                            onTap: () => Navigator.pushNamed(context, '/home'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: KButton(
                            title: 'Checkout',
                            onTap: () => Navigator.pushNamed(context, '/addAddress'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          )
        : const LoginPage();
  }
}
