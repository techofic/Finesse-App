import 'package:finesse/components/slider/k_slider.dart';
import 'package:finesse/src/features/home/components/category_section.dart';
import 'package:finesse/src/features/home/components/featured_products.dart';
import 'package:finesse/src/features/home/components/new_arrivals.dart';
import 'package:finesse/src/features/home/components/popular_category.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const KSlider(selectSliders: 1),
              const SizedBox(height: 31),
              _categoryHeader(
                'Categories',
                () => Navigator.pushNamed(context, '/category'),
              ),
              const CategorySection(),
              const SizedBox(height: 31),
              _categoryHeader('Popular Right Now', () {}),
              const SizedBox(height: 8),
              const PopularCategory(),
              const SizedBox(height: 23),
              _categoryHeader('New Arrivals', () {
                Navigator.pushNamed(context, '/shop');
              }, showViewAll: true),
              const NewArrivals(),
              const SizedBox(height: 32),
              _categoryHeader('Featured Products', () {}),
              const FeaturedProducts(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Column _categoryHeader(title, tap, {bool showViewAll = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: KTextStyle.headline2.copyWith(color: KColor.blackbg),
            ),
            if (showViewAll)
              InkWell(
                onTap: tap,
                child: Text(
                  'View all',
                  style: KTextStyle.bodyText3.copyWith(
                    color: Colors.black.withOpacity(0.3),
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
