import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/product_details/components/add_to_cart.dart';
import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/src/features/product_details/components/product_preview.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetails extends StatefulWidget {
  final String? productName;
  final String? productGroup;
  final String? price;
  final String? description;
  final int? id;

  const ProductDetails({
    this.productName,
    this.productGroup,
    this.price,
    this.description,
    this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> items = [
    "Variations",
    "Descriptions",
    "Reviews",
  ];
  int currentIndex = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final wishlistProductsState = ref.watch(wishlistProvider);
        // final cartState = ref.watch(cartProvider);

        return Scaffold(
          backgroundColor: KColor.whiteBackground,
          appBar: AppBar(
            backgroundColor: KColor.cirColor,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: KColor.blackbg,
              ),
            ),
            actions: [
              if (wishlistProductsState is WishlistSuccessState) ...[
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/cart'),
                  child: SizedBox(
                    width: context.screenWidth * 0.2,
                    child: Stack(
                      children: [
                        Center(child: SvgPicture.asset(AssetPath.cartIcon)),
                        Positioned(
                          right: 18,
                          top: 8,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: KColor.stickerColor,
                              child: Center(
                                child: Text(
                                  wishlistProductsState.wishlistModel!.wishlist.total.toString(),
                                  style: KTextStyle.overline.copyWith(
                                    color: KColor.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
          body: Column(
            children: [
              ProductPreview(
                id: widget.id.toString(),
              ),
              ProductInfo(
                productName: widget.productName,
                productGroup: widget.productGroup,
                price: widget.price,
                description: widget.description,
                id: widget.id.toString(),
              ),
              AddToCart(
                quantity: quantity,
                add: () {
                  setState(() {
                    quantity++;
                  });
                },
                remove: () {
                  setState(() {
                    quantity--;
                    if (quantity < 0) {
                      quantity = 0;
                    }
                  });
                },
                cart: () {
                  // if (cartState is! LoadingState) {
                  //   ref
                  //       .read(cartProvider.notifier)
                  //       .addCart(
                  //     product:
                  //     wishlistData[index].product,
                  //     barCode: "3211",
                  //     quantity: quantity,
                  //   );
                  // }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
