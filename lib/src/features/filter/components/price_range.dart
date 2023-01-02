import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({Key? key}) : super(key: key);

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  List<String> items = [
    "Minimum",
    "Maximum",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 40,
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
                      duration: const Duration(milliseconds: 400),
                      margin: const EdgeInsets.only(right: 16),
                      width: context.screenWidth * 0.44,
                      height: 40,
                      decoration: BoxDecoration(
                        color: index == currentIndex ? Colors.transparent : KColor.searchColor.withOpacity(0.8),
                        border: Border.all(
                          color: index == currentIndex ? KColor.blackbg.withOpacity(0.8) : KColor.searchColor.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              items[index],
                              style: KTextStyle.bodyText1.copyWith(
                                color: KColor.blackbg.withOpacity(0.4),
                              ),
                            ),
                          ],
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
