import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:finesse/features/Login/view/login_page.dart';
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color/app_color.dart';
import '../globalComponents/Widgets/Appbar/k_appbar.dart';
import '../globalComponents/Widgets/Drawer/k_drawer.dart';
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
          appBar: PreferredSize(
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
              activeColor: blackbg,
              backgroundColor: whiteBg,
              color: blackbg,
              height: 55,
              top: -30,
              curveSize: 100,
              curve: Curves.easeInOut,
              style: TabStyle.reactCircle,
              items: [
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/home.svg',
                    color:
                        _currentIndex == 0 ? whiteBg : blackbg.withOpacity(0.3),
                    // width: _currentIndex == 0 ? 19:19,
                    // height: _currentIndex == 0 ? 19:19,
                  ),
                  title: "Home",
                ),
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/trolly.svg',
                    color:
                        _currentIndex == 1 ? whiteBg : blackbg.withOpacity(0.3),
                  ),
                  title: "Cart",
                ),
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/wishlist.svg',
                    color:
                        _currentIndex == 2 ? whiteBg : blackbg.withOpacity(0.3),
                  ),
                  title: "Wishlist",
                ),
                TabItem(
                  icon: SvgPicture.asset(
                    'assets/images/profile.svg',
                    color:
                        _currentIndex == 3 ? whiteBg : blackbg.withOpacity(0.3),
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
    return KTextStyle.sticker.copyWith(color: blackbg.withOpacity(0.3));
  }
}
