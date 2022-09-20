import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/src/features/wishlist/view/empty_product_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final wishlistProductsState = ref.watch(wishlistProvider);
        return Scaffold(
          backgroundColor: KColor.appBackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (wishlistProductsState is WishlistSuccessState) ...[
                  wishlistProductsState.wishlistModel!.wishlist.data.isEmpty
                      ? const EmptyProductPage(
                          message:
                              'Your haven’t added anything to your wishlist yet.Add your favourites here.',
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: wishlistProductsState
                              .wishlistModel?.wishlist.data.length,
                          itemBuilder: (ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: WishlistCard(
                                img: wishlistProductsState.wishlistModel
                                    ?.wishlist.data[index].product.productImage,
                                isChecked: true,
                                productName: wishlistProductsState.wishlistModel
                                    ?.wishlist.data[index].product.productName,
                                group: wishlistProductsState
                                    .wishlistModel
                                    ?.wishlist
                                    .data[index]
                                    .product
                                    .allgroup
                                    .groupName,
                                price: wishlistProductsState.wishlistModel
                                    ?.wishlist.data[index].product.sellingPrice,
                                cancel: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                delete: () {
                                  if (wishlistProductsState is! LoadingState) {
                                    ref
                                        .read(wishlistProvider.notifier)
                                        .deleteWishlist(
                                          id: wishlistProductsState
                                              .wishlistModel!
                                              .wishlist
                                              .data[index]
                                              .id
                                              .toString(),
                                        );
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                        ),
                ],
                const SizedBox(height: 20)
              ],
            ),
          ),
        );
      },
    );
  }
}
