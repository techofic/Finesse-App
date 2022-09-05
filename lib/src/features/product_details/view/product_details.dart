import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/src/features/product_details/components/product_preview.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/add_to_cart.dart';

class ProductDetails extends StatefulWidget {
  final String? productName;
  final String? productGroup;
  final String? price;
  final String? description;
  final int? id;

  const ProductDetails(
      {this.productName, this.productGroup, this.price, this.description,this.id, Key? key})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                SvgPicture.asset(AssetPath.cartIcon),
                const SizedBox(width: 31.0),
                SvgPicture.asset(AssetPath.dotIcon),
              ],
            ),
          ),
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
          const AddToCart(),
        ],
      ),
    );
  }
}
