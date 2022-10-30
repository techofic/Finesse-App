import 'package:finesse/components/appbar/k_appbar.dart';
import 'package:finesse/components/drawer/k_drawer.dart';
import 'package:finesse/components/navigation/chip_style.dart';
import 'package:finesse/components/navigation/inspired/inspired.dart';
import 'package:finesse/components/navigation/k_navigation_bar.dart';
import 'package:finesse/components/navigation/tab_item.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/cart/view/cart_page.dart';
import 'package:finesse/src/features/home/views/home_page.dart';
import 'package:finesse/src/features/profile/view/profile_page.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/src/features/wishlist/view/wishlist_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final wishlistState = ref.watch(wishlistProvider);
        final cartState = ref.watch(cartProvider);
        bool checkLogin = getBoolAsync(loggedIn, defaultValue: false);
        return Container(
          color: KColor.appBackground,
          child: Scaffold(
            appBar: checkLogin
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(56),
                    child: KAppBar(),
                  )
                : AppBar(backgroundColor: KColor.appBackground, elevation: 0),
            drawer: checkLogin?const Drawer(child: KDrawer()): const Drawer(backgroundColor: KColor.appBackground),
            body: SizedBox.expand(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                  if (wishlistState is! LoadingState) {
                    if(_currentIndex==1)ref.read(cartProvider.notifier).cartDetails();
                    if(_currentIndex==2) ref.read(wishlistProvider.notifier).fetchWishlistProducts();
                    if(_currentIndex==3) ref.read(loginProvider.notifier).userModel;
                  }
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
            bottomNavigationBar: KNavigationBar(
              items: const [
                TabItem(
                  icon: AssetPath.homeBottomIcon,
                  title: 'Home',
                ),
                TabItem(
                  icon: AssetPath.cartBottomIcon,
                  title: 'Cart',
                ),
                TabItem(
                  icon: AssetPath.wishlistBottomIcon,
                  title: 'Wishlist',
                ),
                TabItem(
                  icon: AssetPath.profileBottomIcon,
                  title: 'Account',
                ),
              ],
              backgroundColor: KColor.appBackground,
              color: KColor.black.withOpacity(0.5),
              colorSelected: KColor.white,
              selectedTextColor: KColor.black,
              indexSelected: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.animateToPage(
                  _currentIndex,
                  duration: const Duration(microseconds: 10),
                  curve: Curves.linear,
                );
              },
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.3),
              ),
              iconSize: 24,
              elevation: 15,
              chipStyle: const ChipStyle(
                  convexBridge: true, background: KColor.blackbg),
              itemStyle: ItemStyle.circle,
              animated: true,
            ),
          ),
        );
      },
    );
  }
}
