import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  List<String> items = [
    "Grid view",
    "List view",
  ];
  List<dynamic> itemsIcon = [
    AssetPath.boxIcon,
    AssetPath.filterIcon,
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
                        color: index == currentIndex
                            ? KColor.blackbg.withOpacity(0.8)
                            : KColor.searchColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              itemsIcon[index],
                              height: 19,
                              color: index == currentIndex
                                  ? KColor.whiteBackground
                                  : KColor.blackbg,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              items[index],
                              style: KTextStyle.subtitle3.copyWith(
                                color: index == currentIndex
                                    ? KColor.whiteBackground
                                    : KColor.blackbg.withOpacity(0.4),
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
