import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/components/shimmer/k_shimmer.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/wishlist/view/empty_product_page.dart';
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
        final List<CartModel> cartData = cartState is CartSuccessState ? cartState.cartList : [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cartState is LoadingState) ...[const KLoading(shimmerHeight: 123)],
            if (cartState is CartSuccessState) ...[
              cartData.isEmpty
                  ? const EmptyProductPage(message: 'Your cart is empty')
                  : ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartData.length,
                      itemBuilder: (ctx, index) {
                        return WishlistCard(
                          img: cartData[index].mproduct?.productImage,
                          isChecked: false,
                          productName: '${cartData[index].vproduct!.productName!}${cartData[index].vproduct?.variationformat?.values}',
                          price: cartData[index].vproduct?.sellingPrice,
                          quantity: cartData[index].quantity,
                          cancel: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          delete: () {
                            if (cartState is! LoadingState) {
                              ref.read(cartProvider.notifier).deleteCart(id: cartData[index].id.toString());
                            }
                            Navigator.pop(context);
                            ref.read(cartProvider.notifier).cartDetails();
                          },
                        );
                      },
                    ),
            ],
            SizedBox(height: context.screenHeight * 0.04),
          ],
        );
      },
    );
  }
}
