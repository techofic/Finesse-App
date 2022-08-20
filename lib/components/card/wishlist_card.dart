import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class WishlistCard extends StatefulWidget {
  final bool? isChecked;

  const WishlistCard({this.isChecked, Key? key}) : super(key: key);

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: const EdgeInsets.only(bottom: 16),
      height: 123,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/watch-two.png',
            height: 91,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        'Hanging Clock',
                        style: KTextStyle.subtitle3
                            .copyWith(color: KColor.blackbg),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '12:34',
                      style: KTextStyle.subtitle5.copyWith(
                        color: KColor.blackbg.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$44.90",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  widget.isChecked == true
                      ? SizedBox(width: context.screenWidth * 0.35)
                      : SizedBox(width: context.screenWidth * 0.16),
                  widget.isChecked == true
                      ? CircleAvatar(
                          radius: 18,
                          backgroundColor: KColor.baseBlack,
                          child: SvgPicture.asset(
                            'assets/images/trolly.svg',
                            color: Colors.white,
                            height: 19,
                          ),
                        )
                      : Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: KColor.blackbg,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 10,
                                    color: KColor.blackbg,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                count.toString(),
                                style: KTextStyle.headline4.copyWith(
                                  color: KColor.blackbg,
                                ),
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                setState(() {
                                  count--;
                                  if (count < 0) {
                                    count = 0;
                                  }
                                });
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: KColor.blackbg, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 10,
                                    color: KColor.blackbg,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
