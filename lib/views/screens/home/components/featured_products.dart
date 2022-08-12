import 'package:flutter/material.dart';

import '../../../components/Card/product_card.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      height: 207,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Mens Baseball Cap',
            genre: "Womens",
            offerPrice: "14.90",
            regularPrice: "",
            discount: "",
            check: false,
          ),
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Plain Loafer',
            genre: "Mens",
            offerPrice: "14.90",
            regularPrice: "\$24.90",
            discount: "-20%",
            check: true,
          ),
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Mens Baseball Cap',
            genre: "Womens",
            offerPrice: "14.90",
            regularPrice: "",
            discount: "",
            check: false,
          ),
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
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
