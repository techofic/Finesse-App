import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:finesse/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../globalComponents/Appbar/k_appbar.dart';
import '../globalComponents/Drawer/k_drawer.dart';
import 'Home/view/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.appBackground,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: KAppBar(),
          ),
          drawer: const Drawer(child: KDrawer()),
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
          bottomNavigationBar: StyleProvider(
            style: Style(),
            child: ConvexAppBar(
              elevation: 15,
              activeColor: KColor.blackbg,
              backgroundColor: KColor.whiteBackground,
              color: KColor.blackbg,
              height: 55,
              top: -30,
              curveSize: 100,
              curve: Curves.easeInOut,
              style: TabStyle.reactCircle,
              items: [
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/home.svg',
                    color: _currentIndex == 0
                        ? KColor.whiteBackground
                        : KColor.blackbg.withOpacity(0.3),
                    // width: _currentIndex == 0 ? 19:19,
                    // height: _currentIndex == 0 ? 19:19,
                  ),
                  title: "Home",
                ),
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/trolly.svg',
                    color: _currentIndex == 1
                        ? KColor.whiteBackground
                        : KColor.blackbg.withOpacity(0.3),
                  ),
                  title: "Cart",
                ),
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/wishlist.svg',
                    color: _currentIndex == 2
                        ? KColor.whiteBackground
                        : KColor.blackbg.withOpacity(0.3),
                  ),
                  title: "Wishlist",
                ),
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/profile.svg',
                    color: _currentIndex == 3
                        ? KColor.whiteBackground
                        : KColor.blackbg.withOpacity(0.3),
                    height: _currentIndex == 3 ? 19 : 38,
                  ),
                  title: "Account",
                ),
              ],
              onTap: (index) {
                setState(() => _currentIndex = index);
                _pageController.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 19;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 19;

  @override
  TextStyle textStyle(Color color) {
    return KTextStyle.sticker.copyWith(color: KColor.blackbg.withOpacity(0.3));
  }
}
