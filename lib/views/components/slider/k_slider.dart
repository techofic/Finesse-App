import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';

class KSlider extends StatefulWidget {
  const KSlider({Key? key}) : super(key: key);

  @override
  State<KSlider> createState() => _KSliderState();
}

class _KSliderState extends State<KSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.appBackground,
      child: BannerCarousel.fullScreen(
        banners: BannerImages.listBanners,
        customizedIndicators: const IndicatorModel.animation(width: 8, height: 8, spaceBetween: 4, widthAnimation: 30),
        height: 140,
        borderRadius: 10,
        activeColor: KColor.blackbg,
        animation: true,
        initialPage: 0,
      ),
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
