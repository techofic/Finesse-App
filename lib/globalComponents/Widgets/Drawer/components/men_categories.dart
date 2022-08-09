
import 'package:banner_carousel/banner_carousel.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:finesse/constants/color/app_color.dart';
import 'package:finesse/globalComponents/Style/k_text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Appbar/k_appbar.dart';
import '../../Card/product_card.dart';
import '../../textfield/search_field.dart';
import '../k_drawer.dart';


class MenSection extends StatefulWidget {
  const MenSection({Key? key}) : super(key: key);

  @override
  State<MenSection> createState() => _MenSectionState();
}

class _MenSectionState extends State<MenSection> {

  TextEditingController search = TextEditingController();
  int selectIndex = 0;
  List<String> category = ['All', 'Men’s', 'Women’s', 'Kid’s', 'Beauty'];
  List<String> popularCategory = [
    'HALF SHOES',
    'BROGUE SHOES',
    'SLEVELESS',
  ];
  List<dynamic> categoryIcons = [
    'assets/images/box.svg',
    'assets/images/box.svg',
    'assets/images/box.svg',
    'assets/images/box.svg',
    'assets/images/box.svg',
  ];

  List<dynamic> newArrivals = [
    'assets/images/mask.png',
    'assets/images/bag.png',
    'assets/images/mask.png',
    'assets/images/bag.png',
    'assets/images/mask.png',
    'assets/images/bag.png',
  ];
  List<dynamic> newArrivalProducts = [
    'assets/images/tshirt.png',
    'assets/images/socks.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
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
                _filterSection(),
                const SizedBox(height: 24),
                Container(
                  color: background,
                  child: BannerCarousel.fullScreen(
                    banners: BannerImages.listBanners,
                    customizedIndicators: IndicatorModel.animation(width: 8, height: 8, spaceBetween: 4, widthAnimation: 30),
                    height: 140,
                    borderRadius: 10,
                    activeColor: blackbg,
                    onTap: (id) => print(id),
                    animation: true,
                    initialPage: 0,
                  ),
                ),
                const SizedBox(height: 31),
                Text(
                  'Men',
                  style: KTextStyle.headline2.copyWith(color: blackbg),
                ),
                const SizedBox(height: 23),

                _popularCategory(),
                const SizedBox(height: 32),

                _categoryHeader('Featured Products', () {}),
                _featureProducts(),


                const SizedBox(height: 32),
                _newArrival(),
                const SizedBox(height: 32),

                Text(
                  'MEN’S CLOTHING & SHOES',
                  style: KTextStyle.headline2.copyWith(color: blackbg),
                ),

                const SizedBox(height: 16),

                Text(
                  textAlign: TextAlign.center,
                  'As a creator, you look for ways to excel and express\n yourself when and where you can, from reaching for\n that last rep to evolving your streetwear style. Log \nmiles or tear down the baseline in men',
                  style: KTextStyle.subtitle3.copyWith(color: Colors.black.withOpacity(0.6)),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ),

      ),
    );
  }


  Column _popularCategory() {
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
                      border: Border.all(color: blackbg.withOpacity(0.7)),
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
        const SizedBox(height: 29),
        SizedBox(
          height: 182,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: popularCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset('assets/images/menProduct.png'),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _newArrival() {
    return Column(
      children: [
        //const SizedBox(height: 24),
        SizedBox(
          height: 242,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: newArrivals.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset(newArrivals[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _featureProducts() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      height: 207,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Mens Baseball Cap',
            genre: "Womens",
            offerPrice: "14.90",
            regularPrice: "",
            discount: "",
            check: false,
          ),
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Plain Loafer',
            genre: "Mens",
            offerPrice: "14.90",
            regularPrice: "\$24.90",
            discount: "-20%",
            check: true,
          ),
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Mens Baseball Cap',
            genre: "Womens",
            offerPrice: "14.90",
            regularPrice: "",
            discount: "",
            check: false,
          ),
          ProductCard(
            //img: Image.asset(newArrivalProducts[index]),
            name: 'Plain Loafer',
            genre: "Mens",
            offerPrice: "14.90",
            regularPrice: "\$24.90",
            discount: "-20%",
            check: true,
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
              style: KTextStyle.headline2.copyWith(color: blackbg),
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

  Row _filterSection() {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: SearchTextField(
            controller: search,
            readOnly: false,
            hintText: 'Search...',
            lable: 'Search',
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              color: searchColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: SvgPicture.asset('assets/images/searchIcon.svg'),
          ),
        )
      ],
    );
  }
}

class BannerImages {
  static const String banner1 =
      "assets/images/slider.png";
  static const String banner2 =
      "assets/images/slider.png";
  static const String banner3 = "assets/images/slider.png";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
  ];
}
