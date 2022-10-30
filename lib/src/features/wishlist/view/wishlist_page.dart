import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/components/shimmer/k_shimmer.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/src/features/wishlist/model/wishlist_product_model.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/src/features/wishlist/view/empty_product_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

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
        final cartState = ref.watch(cartProvider);

        final List<Datum>? wishlistData =
            wishlistProductsState is WishlistSuccessState
                ? wishlistProductsState.wishlistModel?.wishlist.data
                : [];

        bool checkLogin = getBoolAsync(loggedIn, defaultValue: false);

        return checkLogin
            ? Scaffold(
                backgroundColor: KColor.appBackground,
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Column(
                      children: [
                        if (wishlistProductsState is LoadingState) ...[
                          const KLoading(shimmerHeight: 123)
                        ],
                        if (wishlistProductsState is WishlistSuccessState) ...[
                          wishlistData!.isEmpty
                              ? const EmptyProductPage(
                                  message:
                                      'Your haven’t added anything to your wishlist yet.Add your favourites here.',
                                )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: wishlistData.length,
                                  itemBuilder: (ctx, index) {
                                    return WishlistCard(
                                      img: wishlistData[index]
                                          .product
                                          .productImage,
                                      isChecked: true,
                                      productName: wishlistData[index]
                                          .product
                                          .productName,
                                      group: wishlistData[index]
                                          .product
                                          .allgroup
                                          .groupName,
                                      price: wishlistData[index]
                                          .product
                                          .sellingPrice,
                                      cancel: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                      delete: () {
                                        if (wishlistProductsState
                                            is! LoadingState) {
                                          ref
                                              .read(wishlistProvider.notifier)
                                              .deleteWishlist(
                                                id: wishlistData[index]
                                                    .id
                                                    .toString(),
                                              );
                                        }
                                        Navigator.pop(context);
                                        ref
                                            .read(wishlistProvider.notifier)
                                            .fetchWishlistProducts();
                                      },
                                      add: () {
                                        if (cartState is! LoadingState) {
                                          ref
                                              .read(cartProvider.notifier)
                                              .addCart(
                                                product:
                                                    wishlistData[index].product,
                                                barCode: "3211",
                                                quantity: 1,
                                              );
                                        }
                                        ref
                                            .read(cartProvider.notifier)
                                            .cartDetails();
                                      },
                                    );
                                  },
                                ),
                        ],
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
              )
            : const LoginPage();
      },
    );
  }
}
