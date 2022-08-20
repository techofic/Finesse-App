import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class OtherCategory extends StatefulWidget {
  const OtherCategory({Key? key}) : super(key: key);

  @override
  State<OtherCategory> createState() => _OtherCategoryState();
}

class _OtherCategoryState extends State<OtherCategory> {
  List<String> items = [
    "All",
    "Clothing",
    "Grocery",
    "Kid’s",
    "Beauty",
    "Home",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 9.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 8/5,
            ),
            itemCount: items.length,
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
                      duration: const Duration(milliseconds: 600),
                      width: context.screenWidth*0.5,
                      height: 40,
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            color: KColor.filterDividerColor,
          ),
        ),
      ],
    );
  }
}
