import 'package:finesse/components/card/recommend_card.dart';
import 'package:finesse/src/features/home/controllers/category_controller.dart';
import 'package:finesse/src/features/home/models/category_model.dart';
import 'package:finesse/src/features/home/state/category_state.dart';
import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/product_details/controller/product_recommendation_controller.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:finesse/src/features/product_details/state/product_recommendation_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../model/producr_recommendation_model.dart';

class ProductDescription extends StatefulWidget {
  final String? id;
  final String? description;

  const ProductDescription({this.description, this.id, Key? key})
      : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  List<String> productDetails = ["Washable", "High Quality", "Travel Friendly"];
  String convert = '';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final productDetailsState = ref.watch(productDetailsProvider);
        final productRecommendationState =
            ref.watch(productRecommendationProvider);
        final List<Product>? productRecommendationData =
            productDetailsState is ProductRecommendationSuccessState
                ? productDetailsState.productRecommendationModel?.product
                : [];

        final categoryState = ref.watch(categoryProvider);
        final List<Group>? categoryData = categoryState is CategorySuccessState
            ? categoryState.categoryModel?.groups
            : [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: KTextStyle.subtitle7.copyWith(color: Colors.black),
            ),
            if (productDetailsState is ProductDetailsSuccessState) ...[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                child: ReadMoreText(
                  '${productDetailsState.productDetailsModel?.product.briefDescription}',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'read more...',
                  trimExpandedText: ' Show less',
                  style: KTextStyle.description.copyWith(
                    color: KColor.blackbg.withOpacity(0.5),
                  ),
                  moreStyle: KTextStyle.description.copyWith(
                    color: KColor.blackbg,
                  ),
                  lessStyle: KTextStyle.description.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
              Text(
                'Product Details',
                style: KTextStyle.subtitle4.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: categoryData!.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: KColor.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              categoryData[index].groupName.toString(),
                              style: KTextStyle.description.copyWith(
                                color: KColor.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 32),
            if (productRecommendationState
                is ProductRecommendationSuccessState) ...{
              Text(
                'Recommended',
                style: KTextStyle.subtitle4.copyWith(color: Colors.black),
              ),
              //const SizedBox(height: 16),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productRecommendationState
                      .productRecommendationModel?.product.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecommendCard(
                      img: productRecommendationState
                          .productRecommendationModel?.product[index].images
                          ?.split('')
                          .toString(),
                    );
                  },
                ),
              ),
            }
          ],
        );
      },
    );
  }
}
