import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/src/features/filter/components/select_color.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductVariation extends StatefulWidget {
  const ProductVariation({Key? key}) : super(key: key);

  @override
  State<ProductVariation> createState() => _ProductVariationState();
}

class _ProductVariationState extends State<ProductVariation> {
  List<String> items = [
    "4",
    "5",
    "7",
    "8",
  ];
  List<Color> colors = [
    Colors.grey,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.orangeAccent,
    Colors.green,
    Colors.yellowAccent,
    Colors.lightBlueAccent,
    Colors.lime,
  ];
  int selectColor = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Variations',
          style: KTextStyle.headline6.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 24),
        Text(
          'Color',
          style: KTextStyle.subtitle1.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: context.screenWidth,
          height: 40,
          child: ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectColor = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceInOut,
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectColor == index
                          ? KColor.borderColor
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle,
                      ),
                      child: selectColor == index
                          ? Center(
                        child: SvgPicture.asset(
                          'assets/images/right.svg',
                        ),
                      )
                          : Container(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Size',
          style: KTextStyle.subtitle1.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 16),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? KColor.blackbg.withOpacity(0.8)
                            : KColor.searchColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: KTextStyle.subtitle3.copyWith(
                            color: index == currentIndex
                                ? KColor.whiteBackground
                                : KColor.blackbg.withOpacity(0.4),
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
        const SizedBox(height: 24),
        Text(
          'Brand',
          style: KTextStyle.subtitle1.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 16),
        const KDropdown(hint: 'Select a Brand'),
        const SizedBox(height: 70),
      ],
    );
  }
}
