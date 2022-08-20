import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:finesse/components/appbar/k_appbar.dart';
import 'package:finesse/components/drawer/k_drawer.dart';
import 'package:finesse/src/features/cart/view/cart_page.dart';
import 'package:finesse/src/features/home/view/home_page.dart';
import 'package:finesse/src/features/profile/profile_page.dart';
import 'package:finesse/src/features/wishlist/view/wishlist_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final PageController _pageController = PageController();
  int _currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.appBackground,
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
            children: const [
              HomePage(),
              CartPage(),
              WishlistPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar:
            // TODO :: Try using  one of these packages instead
            // As convex bottom bar doesn't have enough customisation capabilites as our UI requires
            // https://pub.dev/packages/motion_tab_bar_v2
            // https://pub.dev/packages/awesome_bottom_bar inspiredInside

            StyleProvider(
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
                  height: 12,
                  color: _currentIndex == 3
                      ? KColor.whiteBackground
                      : KColor.blackbg.withOpacity(0.3),
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
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconMargin => 10;

  @override
  double get activeIconSize => 10;

  @override
  double get iconSize => 10;

  @override
  TextStyle textStyle(Color color) {
    return KTextStyle.sticker.copyWith(color: KColor.blackbg.withOpacity(0.3));
  }

  @override
  bool get hideEmptyLabel {
    return false;
  }

  @override
  double get layoutSize {
    return activeIconMargin * 4 + activeIconSize;
  }
}
