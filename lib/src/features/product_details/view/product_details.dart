import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/product_details/components/add_to_cart.dart';
import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/src/features/product_details/components/product_preview.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

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
  List<String> items = ["Variations", "Descriptions", "Reviews"];
  int currentIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final cartState = ref.watch(cartProvider);
        final cartItemsLength = cartState is CartSuccessState ? cartState.cartList.length : 0;

        return Scaffold(
          backgroundColor: KColor.whiteBackground,
          appBar: AppBar(
            backgroundColor: KColor.cirColor,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, size: 24, color: KColor.blackbg),
            ),
            actions: [
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
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: KColor.stickerColor,
                          child: cartState is CartSuccessState
                              ? Text(
                                  cartItemsLength > 10 ? '9+' : '$cartItemsLength',
                                  textAlign: TextAlign.center,
                                  style: KTextStyle.caption2.copyWith(color: KColor.white, fontWeight: FontWeight.bold),
                                )
                              : const CupertinoActivityIndicator(radius: 6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              ProductPreview(id: widget.id.toString()),
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
                  if (!getBoolAsync(isLoggedIn)) {
                    toast('Please login to continue...', bgColor: KColor.red);
                    Navigator.pushNamed(context, '/login');
                  }
                  if (cartState is! LoadingState) {
                    ref.read(cartProvider.notifier).addCart(quantity: quantity);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
