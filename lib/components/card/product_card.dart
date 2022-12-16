import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String? img;
  final String? name;
  final bool? check;
  final String? genre;
  final String? discount;
  final String? offerPrice;
  final String? regularPrice;
  final VoidCallback? tap;
  final VoidCallback? pressed;

  const ProductCard(
      {required this.img,
      required this.check,
      required this.name,
      required this.genre,
      required this.discount,
      required this.offerPrice,
      required this.regularPrice,
      this.tap,
      this.pressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 198,
            //padding: const EdgeInsets.only(left: 12,right: 12),
            margin: const EdgeInsets.only(top: 12, right: 12, left: 6),
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
            child: Column(
              children: [
                SizedBox(
                  height: 91,
                  width: context.screenWidth,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      '$img',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12.0,
                      left: 12.0,
                      bottom: 4.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            '$name',
                            style: KTextStyle.subtitle5
                                .copyWith(color: KColor.blackbg),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$genre',
                          style: KTextStyle.subtitle8.copyWith(
                            color: KColor.blackbg.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$$offerPrice",
                                    style: KTextStyle.subtitle7
                                        .copyWith(color: KColor.blackbg),
                                  ),
                                  const SizedBox(height: 2),
                                  Stack(
                                    children: [
                                      Text(
                                        '$regularPrice',
                                        style: KTextStyle.subtitle8.copyWith(
                                          color:
                                              KColor.blackbg.withOpacity(0.3),
                                        ),
                                      ),
                                      Positioned(
                                        left: 8,
                                        bottom: 1,
                                        child: SvgPicture.asset(
                                          'assets/images/line.svg',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: pressed,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: KColor.btnShadowColor
                                          .withOpacity(0.06),
                                      spreadRadius: 0,
                                      blurRadius: 12,
                                      offset: const Offset(4, 4),
                                    ),
                                    BoxShadow(
                                      color: KColor.btnShadowColor
                                          .withOpacity(0.06),
                                      spreadRadius: 0,
                                      blurRadius: 12,
                                      offset: const Offset(-4, -4),
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 13,
                                  backgroundColor: KColor.appBackground,
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.black,
                                    size: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (check == true)
            Positioned(
              right: 20,
              top: 20,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 51,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: KColor.stickerColor,
                  ),
                  child: Center(
                    child: Text(
                      '$discount',
                      style: KTextStyle.sticker
                          .copyWith(color: KColor.whiteBackground),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
