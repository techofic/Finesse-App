import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/filter/components/select_color.dart';
import 'package:finesse/src/features/filter/components/main_categories.dart';
import 'package:finesse/src/features/filter/components/other_category.dart';
import 'package:finesse/src/features/filter/components/price_range.dart';
import 'package:finesse/src/features/filter/components/rating.dart';
import 'package:finesse/src/features/filter/components/view.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                SvgPicture.asset(AssetPath.cancelIcon),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style: KTextStyle.headline3
                          .copyWith(color: KColor.blackbg,),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: KColor.blackbg,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10),
            child: Divider(
              color: KColor.dividerColor.withOpacity(0.5),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                _categoryHeader('Main categories', () {}),
                const MainCategory(),
                _categoryHeader('View', () {}),
                const View(),
                _categoryHeader('Price range', () {}),
                const PriceRange(),
                _categoryHeader('Rating', () {}),
                const Rating(),
                _categoryHeader('Category', () {}),
                const OtherCategory(),
                _categoryHeader('Color', () {}),
                const SelectColor(),
                Row(
                  children: [
                    Flexible(
                      child: KBorderButton(
                        title: 'Reset All',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: KButton(
                        title: 'Add Filters',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ],
      ),
    );

  }

  Column _categoryHeader(title, tap) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
            ),
            InkWell(
              onTap: tap,
              child: Text(
                'Reset',
                style: KTextStyle.subtitle6.copyWith(
                  color: KColor.baseBlack.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
