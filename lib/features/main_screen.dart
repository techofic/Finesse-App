import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color/app_color.dart';
import 'Home/view/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: SafeArea(
          child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: const <Widget>[
              HomePage(),
              HomePage(),
              HomePage(),
              HomePage(),
            ],
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          activeColor: blackbg.withOpacity(0.2),
          backgroundColor: whiteBg,
          color: blackbg,
          curveSize: 80,
          height: 70,
          top: -13,
          curve: Curves.easeInOut,
          style: TabStyle.reactCircle,
          items: [
            TabItem(
              icon: _currentIndex == 0? SvgPicture.asset('assets/images/home.svg', color: blackbg):
              SvgPicture.asset('assets/images/home.svg', color: blackbg,height: 10,),
              title: "Home",
            ),
            TabItem(
                icon: SvgPicture.asset('assets/images/trolly.svg',
                    color: blackbg),
                title: "Cart"),
            TabItem(
                icon: SvgPicture.asset(
                  'assets/images/wishlist.svg',
                  height: 20,
                ),
                title: "Wishlist"),
            TabItem(
                icon: SvgPicture.asset(
                  'assets/images/profile.svg',
                  height: 20,
                ),
                title: "Account"),
          ],
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
        ),
      )),
    );
  }
}
