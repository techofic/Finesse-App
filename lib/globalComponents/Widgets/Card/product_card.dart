import 'package:finesse/constants/color/app_color.dart';
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  // final Image? img;
  final String? name;
  final bool? check;
  final String? genre;
  final String? discount;
  final String? offerPrice;
  final String? regularPrice;

  const ProductCard(
      {
      // required this.img,
      required this.check,
      required this.name,
      required this.genre,
      required this.discount,
      required this.offerPrice,
      required this.regularPrice,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 183,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: background,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(4, 4), // changes position of shadow
          ),
          BoxShadow(
            color: shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(-4, -4), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/tshirt.png',
                  height: 68,
                ),
              ),
              const SizedBox(height: 13),
              Expanded(
                child: Text(
                  '$name',
                  style: KTextStyle.subtitle5.copyWith(color: blackbg),
                ),
              ),
              Text(
                '$genre',
                style: KTextStyle.subtitle8.copyWith(
                  color: blackbg.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$$offerPrice",
                          style: KTextStyle.subtitle7.copyWith(color: blackbg),
                        ),
                        const SizedBox(height: 2),
                        Stack(
                          children: [
                            Text(
                              '$regularPrice',
                              style: KTextStyle.subtitle8.copyWith(
                                color: blackbg.withOpacity(0.3),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              bottom: 1,
                              child: SvgPicture.asset('assets/images/line.svg'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: btnShadowColor.withOpacity(0.06),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset:
                              const Offset(4, 4), // changes position of shadow
                        ),
                        BoxShadow(
                          color: btnShadowColor.withOpacity(0.06),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: Offset(-4, -4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: background,
                      child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          check == true?Positioned(
            right: 5,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: stickerColor,
                ),
                child: Text(
                  '$discount',
                  style: KTextStyle.sticker.copyWith(color: whiteBg),
                ),
              ),
            ),
          ):Container(),
        ],
      ),
    );
  }
}
