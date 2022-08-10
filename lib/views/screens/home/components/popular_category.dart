import 'package:flutter/material.dart';

import '../../../styles/k_colors.dart';
import '../../../styles/k_text_style.dart';

class PopularCategory extends StatefulWidget {
  const PopularCategory({Key? key}) : super(key: key);

  @override
  State<PopularCategory> createState() => _PopularCategoryState();
}

class _PopularCategoryState extends State<PopularCategory> {
  List<String> popularCategory = [
    'TWO QUARTER',
    'KATUA',
    'MOJARIS',
    'KATUA',
    'MOJARIS'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: popularCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    height: 36,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: KColor.blackbg.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      popularCategory[index],
                      style: KTextStyle.subtitle6
                          .copyWith(color: Colors.black.withOpacity(0.7)),
                    )),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 172,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: popularCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset('assets/images/product.png'),
              );
            },
          ),
        ),
      ],
    );
  }
}
