import 'package:finesse/components/card/product_card.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 207,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ProductCard(
            name: 'Mens Baseball Cap',
            genre: "Womens",
            offerPrice: "14.90",
            regularPrice: "",
            discount: "",
            check: false,
          ),
          ProductCard(
            name: 'Plain Loafer',
            genre: "Mens",
            offerPrice: "14.90",
            regularPrice: "\$24.90",
            discount: "-20%",
            check: true,
          ),
          ProductCard(
            name: 'Mens Baseball Cap',
            genre: "Womens",
            offerPrice: "14.90",
            regularPrice: "",
            discount: "",
            check: false,
          ),
          ProductCard(
            name: 'Plain Loafer',
            genre: "Mens",
            offerPrice: "14.90",
            regularPrice: "\$24.90",
            discount: "-20%",
            check: true,
          ),
        ],
      ),
    );
  }
}
