import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/product_details/components/product_description.dart';
import 'package:finesse/src/features/product_details/components/product_review.dart';
import 'package:finesse/src/features/product_details/components/product_variation.dart';
import 'package:finesse/src/features/product_details/controller/product_recommendation_controller.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductInfo extends StatefulWidget {
  final String? productName;
  final String? productGroup;
  final String? price;
  final String? description;
  final String? id;

  const ProductInfo({
    this.productName,
    this.productGroup,
    this.price,
    this.description,
    this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  List<String> items = [
    "Variations",
    "Descriptions",
    "Reviews",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.productName.toString(),
                      style: KTextStyle.headline2.copyWith(
                        color: KColor.blackbg,
                      ),
                    ),
                  ),
                  Text(
                    widget.price.toString(),
                    style: KTextStyle.headline2.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.productGroup.toString(),
                    style: KTextStyle.subtitle7.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final wishlistState = ref.watch(wishlistProvider);
                      return InkWell(
                        onTap: () {
                          if (wishlistState is! LoadingState) {
                            ref.read(wishlistProvider.notifier).addWishlist(
                                  id: widget.id.toString(),
                                );
                          }
                          ref.read(wishlistProvider.notifier).fetchWishlistProducts();
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(32),
                          elevation: 4,
                          child: const CircleAvatar(
                            backgroundColor: KColor.appBackground,
                            radius: 16,
                            child: Icon(
                              Icons.favorite_outlined,
                              color: KColor.baseBlack,
                              size: 13,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19.0, bottom: 19),
                child: SvgPicture.asset(AssetPath.ratingIcon),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            Consumer(
                              builder: (context, ref, _) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                    ref.read(productRecommendationProvider.notifier).fetchProductsRecommendation(
                                          widget.id.toString(),
                                        );
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 111,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: index == currentIndex ? KColor.blackbg.withOpacity(0.8) : KColor.searchColor.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        items[index],
                                        style: KTextStyle.bodyText1.copyWith(
                                          color: index == currentIndex ? KColor.whiteBackground : KColor.blackbg.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  /// MAIN BODY
                  if (currentIndex == 0) ProductVariation(id: widget.id.toString()),
                  if (currentIndex == 1) ProductDescription(id: widget.id.toString()),
                  if (currentIndex == 2) const ProductReview(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
