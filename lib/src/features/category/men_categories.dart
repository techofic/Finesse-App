import 'package:finesse/components/appbar/home_app_bar.dart';
import 'package:finesse/components/drawer/k_drawer.dart';
import 'package:finesse/components/filter/k_filter.dart';
import 'package:finesse/components/slider/k_slider.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import '../home/components/featured_products.dart';
import '../home/components/new_arrivals.dart';
import '../home/components/popular_category.dart';

class MenSection extends StatefulWidget {
  const MenSection({Key? key}) : super(key: key);

  @override
  State<MenSection> createState() => _MenSectionState();
}

class _MenSectionState extends State<MenSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: HomeAppBar(),
        ),
        drawer: const Drawer(child: KDrawer()),
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
                Text(
                  'Men',
                  style: KTextStyle.headline2.copyWith(color: KColor.blackbg),
                ),
                const SizedBox(height: 23),
                const PopularCategory(),
                const SizedBox(height: 32),
                _categoryHeader('Featured Products', () {}),
                const FeaturedProducts(),
                const SizedBox(height: 32),
                const NewArrivals(),
                const SizedBox(height: 32),
                Text(
                  'MEN’S CLOTHING & SHOES',
                  style: KTextStyle.headline2.copyWith(color: KColor.blackbg),
                ),
                const SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  'As a creator, you look for ways to excel and express\n yourself when and where you can, from reaching for\n that last rep to evolving your streetwear style. Log \nmiles or tear down the baseline in men',
                  style: KTextStyle.bodyText1.copyWith(color: Colors.black.withOpacity(0.6)),
                ),
                const SizedBox(height: 60),
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
