import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/src/features/product_details/components/product_preview.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/add_to_cart.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  
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
                SvgPicture.asset('assets/images/cart.svg'),
                const SizedBox(width: 31.0),
                SvgPicture.asset('assets/images/pin.svg'),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          ProductPreview(),
          ProductInfo(),
          AddToCart(),
        ],
      ),
    );
  }
}
