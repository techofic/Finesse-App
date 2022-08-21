import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/src/features/cart/components/cart_total.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return Slidable(
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                      extentRatio: 0.85,
                      dismissible: DismissiblePane(
                        onDismissed: () async {},
                      ),
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (index) {},
                          backgroundColor: KColor.deleteColor,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_outline_outlined,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                      ],
                    ),
                    child: const WishlistCard(isChecked: false),
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
