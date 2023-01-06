import 'package:finesse/components/card/recommend_card.dart';
import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/product_details/controller/product_recommendation_controller.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:finesse/src/features/product_details/state/product_recommendation_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescription extends StatefulWidget {
  final String? id;
  final String? description;

  const ProductDescription({this.description, this.id, Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String convert = '';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final productDetailsState = ref.watch(productDetailsProvider);
        final productRecommendationState = ref.watch(productRecommendationProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: KTextStyle.subtitle7.copyWith(color: Colors.black),
            ),
            if (productDetailsState is ProductDetailsSuccessState) ...[
              Html(
                data: productDetailsState.productDetailsModel?.product?.briefDescription ?? 'No data available',
                style: {
                  'span': Style(
                    color: KColor.blackbg.withOpacity(0.5),
                    fontSize: FontSize.medium,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    whiteSpace: WhiteSpace.NORMAL,
                  ),
                },
              ),
            ],
            if (productRecommendationState is ProductRecommendationSuccessState) ...{
              Text(
                'Recommended',
                style: KTextStyle.bodyText2.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productRecommendationState.productRecommendationModel?.product.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecommendCard(
                      img: productRecommendationState.productRecommendationModel?.product[index].productImage,
                      price: productRecommendationState.productRecommendationModel?.product[index].sellingPrice.toString(),
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
