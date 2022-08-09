import 'package:finesse/constants/color/app_color.dart';
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:finesse/globalComponents/Widgets/Appbar/k_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../globalComponents/Widgets/Card/product_card.dart';
import '../../../globalComponents/Widgets/Drawer/k_drawer.dart';
import '../../../globalComponents/Widgets/textfield/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  int selectIndex = 0;
  List<String> category = ['All', 'Men’s', 'Women’s', 'Kid’s', 'Beauty'];
  List<String> popularCategory = [
    'TWO QUARTER',
    'KATUA',
    'MOJARIS',
    'KATUA',
    'MOJARIS'
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
        drawer: const Drawer(backgroundColor: blackbg, child: KDrawer()),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: KAppBar(),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _filterSection(),
                const SizedBox(height: 31),
                _categoryHeader('Categories', () {}),
                const SizedBox(height: 16),
                _categorySection(),
                const SizedBox(height: 31),
                _categoryHeader('Popular Right Now', () {}),
                const SizedBox(height: 24),
                _popularCategory(),
                const SizedBox(height: 23),
                _categoryHeader('New Arrivals', () {}),
                const SizedBox(height: 16),
                _NewProducts(),
                const SizedBox(height: 32),
                _newArrival(),
                const SizedBox(height: 32),
                _categoryHeader('Featured Products', () {}),
                const SizedBox(height: 16),
                _featureProducts(),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _NewProducts() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      height: 207,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              //img: Image.asset(newArrivalProducts[index]),
              name: 'Finesse Regular T-Shirt (Black)',
              genre: "",
              offerPrice: "14.90",
              regularPrice: "",
              discount: "-20%",
              check: true,
            );
          }),
    );
  }

  SizedBox _categorySection() {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectIndex = index;
                print("index: $selectIndex");
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: selectIndex == index ? blackbg : searchColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      categoryIcons[index],
                      color: index == selectIndex ? whiteBg : blackbg,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Center(
                    child: Text(
                      '${category[index]}',
                      style: KTextStyle.subtitle6.copyWith(
                          color: index == selectIndex
                              ? blackbg
                              : blackbg.withOpacity(0.3)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
        children: const[
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

  Row _categoryHeader(title, tap) {
    return Row(
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
