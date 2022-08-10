import 'package:flutter/material.dart';

import '../../../globalComponents/Card/product_card.dart';

class NewArrivals extends StatefulWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  List<dynamic> newArrivals = [
    'assets/images/mask.png',
    'assets/images/bag.png',
    'assets/images/mask.png',
    'assets/images/bag.png',
    'assets/images/mask.png',
    'assets/images/bag.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          height: 207,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const ProductCard(
                  //img: Image.asset(newArrivalProducts[index]),
                  name: 'Finesse Regular T-Shirt (Black)',
                  genre: "",
                  offerPrice: "14.90",
                  regularPrice: "",
                  discount: "-20%",
                  check: true,
                );
              }),
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            //const SizedBox(height: 24),
            SizedBox(
              height: 242,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: newArrivals.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Image.asset(newArrivals[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
