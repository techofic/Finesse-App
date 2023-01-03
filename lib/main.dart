import 'dart:io';

import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/route/route_generator.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/cart/controller/zone_controller.dart';
import 'package:finesse/src/features/home/controllers/category_controller.dart';
import 'package:finesse/src/features/home/controllers/product_category_controller.dart';
import 'package:finesse/src/features/home/controllers/shop_controller.dart';
import 'package:finesse/src/features/home/controllers/slider_controller.dart';
import 'package:finesse/src/features/notification/controller/notification_controller.dart';
import 'package:finesse/src/features/profile/controller/profile_controller.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'src/features/product_details/controller/product_details_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  bool _isLoggedIn = false;

  initData() {
    _isLoggedIn = getBoolAsync(isLoggedIn, defaultValue: false);
    if (_isLoggedIn) ref.read(loginProvider.notifier).userModel;
    ref.read(sliderProvider.notifier).fetchSliderDetails();
    ref.read(productCategoryProvider.notifier).fetchProductsCategoryDetails();
    ref.read(shopProvider.notifier).fetchShopProductList();
    ref.read(categoryProvider.notifier).fetchCategoryDetails();
    ref.read(wishlistProvider.notifier).fetchWishlistProducts();
    ref.read(cartProvider.notifier).cartDetails();
    ref.read(reportProvider.notifier).fetchReports();
    ref.read(notificationProvider.notifier).fetchNotification();
    ref.read(zoneProvider.notifier).allZone();
    ref.read(cityProvider.notifier).allCity();
    ref.read(allBrandsProvider.notifier).fetchAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finesse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      initialRoute: '/mainScreen',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
