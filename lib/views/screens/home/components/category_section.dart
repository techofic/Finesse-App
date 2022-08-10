import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles/k_colors.dart';
import '../../../styles/k_text_style.dart';

class CategoryScetion extends StatefulWidget {
  const CategoryScetion({Key? key}) : super(key: key);

  @override
  State<CategoryScetion> createState() => _CategoryScetionState();
}

class _CategoryScetionState extends State<CategoryScetion> {
  int selectIndex = 0;
  List<String> category = ['All', 'Men’s', 'Women’s', 'Kid’s', 'Beauty'];
  List<dynamic> categoryIcons = [
    'assets/images/box.svg',
    'assets/images/box.svg',
    'assets/images/box.svg',
    'assets/images/box.svg',
    'assets/images/box.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: selectIndex == index
                        ? KColor.blackbg
                        : KColor.searchColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      categoryIcons[index],
                      color: index == selectIndex
                          ? KColor.whiteBackground
                          : KColor.blackbg,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  child: Text(
                    category[index],
                    style: KTextStyle.subtitle6.copyWith(
                        color: index == selectIndex
                            ? KColor.blackbg
                            : KColor.blackbg.withOpacity(0.3)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
