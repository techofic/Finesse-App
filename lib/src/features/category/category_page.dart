import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/src/features/home/controllers/category_controller.dart';
import 'package:finesse/src/features/home/models/category_model.dart';
import 'package:finesse/src/features/home/state/category_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectIndex = 0;
  List<String> category = ['All', 'Clothing', 'Grocery', 'Kid’s', 'Beauty', 'Home', 'Men’s Fashion', 'Electronics', 'Outdoor', 'Drugs'];
  List<dynamic> categoryIcons = [
    'assets/images/all.png',
    'assets/images/clothing.png',
    'assets/images/grocery.png',
    'assets/images/kid.png',
    'assets/images/beauty.png',
    'assets/images/home.png',
    'assets/images/mens-fashion.png',
    'assets/images/electronics.png',
    'assets/images/outdoor.png',
    'assets/images/drugs.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final categoryState = ref.watch(categoryProvider);
        final List<Group>? categoryData = categoryState is CategorySuccessState ? categoryState.categoryModel?.groups : [];
        return Scaffold(
          backgroundColor: KColor.appBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: KAppBar(checkTitle: true, title: 'Categories'),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 2 / 3,
              ),
              itemCount: categoryData!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: context.screenWidth * 0.5,
                      height: 113,
                      decoration: BoxDecoration(
                        color: KColor.searchColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          categoryIcons[index],
                          height: 43,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        categoryData[index].groupName.toString(),
                        textAlign: TextAlign.center,
                        style: KTextStyle.headline4.copyWith(
                          color: KColor.blackbg.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
