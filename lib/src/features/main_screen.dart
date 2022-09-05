import 'package:finesse/components/appbar/k_appbar.dart';
import 'package:finesse/components/drawer/k_drawer.dart';
import 'package:finesse/src/features/cart/view/cart_page.dart';
import 'package:finesse/src/features/home/views/home_page.dart';
import 'package:finesse/src/features/profile/profile_page.dart';
import 'package:finesse/src/features/wishlist/view/wishlist_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';


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
              //SettingPage()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 15,
          backgroundColor: KColor.appBackground,
          selectedItemColor: KColor.blackbg.withOpacity(0.5),
          unselectedItemColor: KColor.blackbg.withOpacity(0.5),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              label: 'Wishlist',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        ),
        // TODO :: Try using  one of these packages instead
        // As convex bottom bar doesn't have enough customisation capabilites as our UI requires
        // https://pub.dev/packages/awesome_bottom_bar
        // https://pub.dev/packages/awesome_bottom_bar inspiredInside
      ),
    );
  }
}
