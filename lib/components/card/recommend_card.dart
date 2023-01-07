import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

import 'package:finesse/src/features/product_details/model/producr_recommendation_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendCard extends ConsumerStatefulWidget {
  // final String? img;
  // final String? price;
  final Product productData;
  const RecommendCard({required this.productData, Key? key}) : super(key: key);

  @override
  ConsumerState<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends ConsumerState<RecommendCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.read(productDetailsProvider.notifier).fetchProductsDetails(widget.productData.id);
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          '/productDetails',
          arguments: {
            'productName': widget.productData.productName,
            'productGroup': widget.productData.allgroup.groupName,
            'price': widget.productData.sellingPrice.toString(),
            'description': widget.productData.briefDescription,
            'id': widget.productData.id,
          },
        );
      },
      child: Column(
        children: [
          Container(
            height: 113,
            margin: const EdgeInsets.only(right: 20, left: 8, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: KColor.appBackground,
              boxShadow: [
                BoxShadow(
                  color: KColor.shadowColor.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: const Offset(4, 4), // changes position of shadow
                ),
                BoxShadow(
                  color: KColor.shadowColor.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: const Offset(-4, -4), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('${widget.productData.productImage}', height: 113, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 6),
            child: Text(
              '৳${widget.productData.sellingPrice}',
              style: KTextStyle.bodyText2.copyWith(color: KColor.blackbg),
            ),
          ),
        ],
      ),
    );
  }
}
