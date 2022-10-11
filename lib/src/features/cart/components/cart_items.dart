import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/wishlist/view/empty_product_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final cartState = ref.watch(cartProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          img: cartState.cartModel?.allCarts[index].details.img,
                          isChecked: false,
                          productName: cartState
                              .cartModel?.allCarts[index].details.productName,
                          group: cartState
                              .cartModel?.allCarts[index].details.groupName,
                          price: cartState
                              .cartModel?.allCarts[index].details.sellingPrice,
                          quantity:
                              cartState.cartModel?.allCarts[index].quantity,
                          cancel: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          delete: () {
                            if (cartState is! LoadingState) {
                              ref.read(cartProvider.notifier).deleteCart(
                                    id: cartState.cartModel!.allCarts[index].id
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
          ],
        );
      },
    );
  }
}
