import 'package:finesse/views/globalComponents/slider/k_slider.dart';
import 'package:flutter/material.dart';
import '../../../globalComponents/filter/k_filter.dart';
import '../../../styles/k_colors.dart';
import '../../../styles/k_text_style.dart';
import '../components/category_section.dart';
import '../components/featured_products.dart';
import '../components/new_arrivals.dart';
import '../components/popular_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const KFilter(),
                const SizedBox(height: 24),
                const KSlider(),
                const SizedBox(height: 31),
                _categoryHeader('Categories', () {}),
                const CategoryScetion(),
                const SizedBox(height: 31),
                _categoryHeader('Popular Right Now', () {}),
                const SizedBox(height: 8),
                const PopularCategory(),
                const SizedBox(height: 23),
                _categoryHeader('New Arrivals', () {}),
                const NewArrivals(),
                const SizedBox(height: 32),
                _categoryHeader('Featured Products', () {}),
                const FeaturedProducts(),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ),
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
              style: KTextStyle.headline2.copyWith(color: KColor.blackbg),
            ),
            InkWell(
              onTap: tap,
              child: Text(
                'View all',
                style: KTextStyle.subtitle6.copyWith(
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
