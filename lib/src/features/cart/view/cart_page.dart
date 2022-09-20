import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/components/cart_total.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/wishlist/view/empty_product_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final cartState = ref.watch(cartProvider);

        final List<AllCart>? cartData =
            cartState is CartSuccessState ? cartState.cartModel?.allCarts : [];

        return Scaffold(
          backgroundColor: KColor.appBackground,
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  if (cartState is CartSuccessState) ...[
                    cartState.cartModel!.allCarts.isEmpty
                        ? const EmptyProductPage(
                            message: 'Your cart is empty',
                          )
                        : ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cartState.cartModel?.allCarts.length,
                            itemBuilder: (ctx, index) {
                              return WishlistCard(
                                img: cartState
                                    .cartModel?.allCarts[index].details.img,
                                isChecked: false,
                                productName: cartState.cartModel
                                    ?.allCarts[index].details.productName,
                                group: cartState.cartModel?.allCarts[index]
                                    .details.groupName,
                                price: cartState.cartModel?.allCarts[index]
                                    .details.sellingPrice,
                                quantity: cartState
                                    .cartModel?.allCarts[index].quantity,
                                cancel: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                delete: () {
                                  if (cartState is! LoadingState) {
                                    ref.read(cartProvider.notifier).deleteCart(
                                          id: cartState
                                              .cartModel!.allCarts[index].id
                                              .toString(),
                                        );
                                  }
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                  ],
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
                      if (cartState is CartSuccessState) ...[
                        Flexible(
                          child: KButton(
                            title: 'Checkout',
                            onTap: () {
                              // if (cartState is! LoadingState) {
                              //   ref.read(cartProvider.notifier).updateCart(
                              //       id: cartState.cartModel?.allCarts.map((e) => e.id.toString()),
                              //       quantity: cartState.cartModel?.allCarts.map((e) => e.quantity.toString()),
                              //   );
                              // }
                              Navigator.pushNamed(context, '/checkout');
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
