import 'package:finesse/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import '../../globalComponents/Appbar/k_appbar.dart';
import '../../globalComponents/Drawer/k_drawer.dart';
import '../../globalComponents/filter/k_filter.dart';
import '../../globalComponents/slider/k_slider.dart';
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
          child: KAppBar(),
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
                  style: KTextStyle.subtitle3
                      .copyWith(color: Colors.black.withOpacity(0.6)),
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
