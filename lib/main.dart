import 'dart:io';

import 'package:finesse/route/route_generator.dart';
import 'package:finesse/src/features/home/controllers/category_controller.dart';
import 'package:finesse/src/features/home/controllers/product_category_controller.dart';
import 'package:finesse/src/features/home/controllers/shop_controller.dart';
import 'package:finesse/src/features/home/controllers/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(sliderProvider.notifier).fetchSliderDetails();
    ref.read(productCategoryProvider.notifier).fetchProductsCategoryDetails();
    ref.read(shopProvider.notifier).fetchShopDetails();
    ref.read(categoryProvider.notifier).fetchCategoryDetails();
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
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
