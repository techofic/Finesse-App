import 'package:finesse/views/styles/b_style.dart';
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
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/productDetails');
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 183,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(top: 8,right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: KColor.appBackground,
              // color: Colors.lightBlue,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/tshirt.png',
                    height: 68,
                  ),
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Text(
                    '$name',
                    style: KTextStyle.subtitle5.copyWith(color: KColor.blackbg),
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
                                  color: KColor.blackbg.withOpacity(0.3),
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
                            color: KColor.btnShadowColor.withOpacity(0.06),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: const Offset(4, 4),
                          ),
                          BoxShadow(
                            color: KColor.btnShadowColor.withOpacity(0.06),
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
                  ],
                ),
              ],
            ),
          ),
        ),
        check == true
            ? Positioned(
                right: 36,
                top: 15,
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
              )
            : Container(),
      ],
    );
  }
}
