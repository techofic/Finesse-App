import 'package:finesse/views/styles/k_colors.dart';
import 'package:finesse/views/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/product_delivery.dart';
import 'components/product_description.dart';
import 'components/product_review.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> items = [
    "Descriptions",
    "Reviews",
    "Delivery",
  ];

  int current = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              )),
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
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: KColor.cirColor,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 24, left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Folded Double Pocket Backpack Men’s",
                              style: KTextStyle.headline2.copyWith(
                                color: KColor.blackbg,
                              ),
                            ),
                          ),
                          Text(
                            "\$44",
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
                            'Men’s',
                            style: KTextStyle.subtitle7.copyWith(
                              color: KColor.blackbg.withOpacity(0.3),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(32),
                            elevation: 4,
                            child: const CircleAvatar(
                              backgroundColor: KColor.appBackground,
                              radius: 16,
                              child: Icon(
                                Icons.favorite_outlined,
                                color: Colors.black,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0, bottom: 19),
                        child: SvgPicture.asset('assets/images/rating.svg'),
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
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.only(right: 16),
                                        width: 111,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: index == current ? KColor.blackbg.withOpacity(0.8) : KColor.searchColor.withOpacity(0.8),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            items[index],
                                            style: KTextStyle.subtitle3.copyWith(
                                              color: index == current ? KColor.whiteBackground : KColor.blackbg.withOpacity(0.4),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),

                          /// MAIN BODY
                          current == 0 ? const ProductDescription() : Container(),
                          current == 1 ? const ProductReview() : Container(),
                          current == 2 ? const ProductDelivery() : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            count++;
                          });
                        },
                        child: Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            border: Border.all(color: KColor.blackbg, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 16,
                              color: KColor.blackbg,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Text(
                          count.toString(),
                          style: KTextStyle.headline3.copyWith(
                            color: KColor.blackbg,
                          ),
                        ),
                      ),
                      InkWell(
                        // When using InkWell check the spalsh effect if its radius matches the container
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          // TODO :: Product count cannot be a negative number
                          setState(() {
                            count--;
                          });
                        },
                        child: Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            border: Border.all(color: KColor.blackbg, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 16,
                              color: KColor.blackbg,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 54,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: KColor.blackbg,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: KTextStyle.subtitle1.copyWith(
                            color: KColor.whiteBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
