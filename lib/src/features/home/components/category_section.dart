import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/home/controllers/category_controller.dart';
import 'package:finesse/src/features/home/models/category_model.dart';
import 'package:finesse/src/features/home/state/category_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectIndex = 0;
  List<dynamic> categoryIcons = [
    AssetPath.boxIcon,
    AssetPath.boxIcon,
    AssetPath.boxIcon,
    AssetPath.boxIcon,
    AssetPath.boxIcon,
    AssetPath.boxIcon,
    AssetPath.boxIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final categoryState = ref.watch(categoryProvider);
      final List<Group>? categoryData =
      categoryState is CategorySuccessState
          ? categoryState.categoryModel?.groups
          : [];
      return SizedBox(
        height: 85,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryData!.length,
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
                      categoryData[index].groupName.toString(),
                      style: KTextStyle.subtitle6.copyWith(
                        color: index == selectIndex
                            ? KColor.blackbg
                            : KColor.blackbg.withOpacity(0.3),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },);

  }
}
