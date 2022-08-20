import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String details =
      "Lorem ipsum dolor sit amet, consectetur adipi scing elit. Ultrices adipiscing sit integer ornare cras massa nulla. ces adipi scing sit integer ornare cras massa nulla";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: KTextStyle.subtitle7.copyWith(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 24),
          child: ReadMoreText(
            details,
            trimLines: 2,
            colorClickableText: Colors.pink,
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
        Row(
          children: [
            CircleAvatar(
              radius: 2,
              backgroundColor: KColor.black.withOpacity(0.5),
            ),
            const SizedBox(width: 7),
            Text(
              'Washable',
              style: KTextStyle.description.copyWith(
                color: KColor.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              radius: 2,
              backgroundColor: KColor.black.withOpacity(0.5),
            ),
            const SizedBox(width: 7),
            Text(
              'High Quality',
              style: KTextStyle.description.copyWith(
                color: KColor.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              radius: 2,
              backgroundColor: KColor.black.withOpacity(0.5),
            ),
            const SizedBox(width: 7),
            Text(
              'Travel Friendly',
              style: KTextStyle.description.copyWith(
                color: KColor.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'Recommended',
          style: KTextStyle.subtitle4.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 113,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    margin: const EdgeInsets.only(right: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: KColor.appBackground,
                      boxShadow: [
                        BoxShadow(
                          color: KColor.shadowColor.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset:
                              const Offset(4, 4), // changes position of shadow
                        ),
                        BoxShadow(
                          color: KColor.shadowColor.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: const Offset(
                              -4, -4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/travel-bag.png',
                        height: 57,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, top: 4),
                    child: Text(
                      '\$44.90',
                      style:
                          KTextStyle.subtitle4.copyWith(color: KColor.blackbg),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
