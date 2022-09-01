import 'package:banner_carousel/banner_carousel.dart';
import 'package:finesse/src/features/home/controllers/slider_controller.dart';
import 'package:finesse/src/features/home/models/slider_model.dart';
import 'package:finesse/src/features/home/state/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../styles/k_colors.dart';

class KSlider extends StatefulWidget {
  final int? selectSliders;

  const KSlider({this.selectSliders, Key? key}) : super(key: key);

  @override
  State<KSlider> createState() => _KSliderState();
}

class _KSliderState extends State<KSlider> {
  int pageSliders = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final sliderState = ref.watch(sliderProvider);
        final List<MainSlider>? sliderData = sliderState is SliderSuccessState
            ? sliderState.homeSliderModel?.mainSlider
            : [];
        List<BannerModel> bannerList = sliderData!
            .map(
              (entry) => BannerModel(
                imagePath: entry.image,
                id: entry.id.toString(),
              ),
            )
            .toList();
        return Container(
          color: KColor.appBackground,
          child: pageSliders == 1
              ? BannerCarousel.fullScreen(
                  onTap: (index) {
                    Navigator.pushNamed(context, '/shop');
                  },
                  banners: bannerList,
                  customizedIndicators: const IndicatorModel.animation(
                    width: 8,
                    height: 8,
                    spaceBetween: 4,
                    widthAnimation: 30,
                  ),
                  height: 140,
                  borderRadius: 10,
                  activeColor: KColor.blackbg,
                  animation: true,
                  initialPage: 0,
                )
              : BannerCarousel(
                  banners: BannerImages.listProducts,
                  customizedIndicators: const IndicatorModel.animation(
                    width: 8,
                    height: 8,
                    spaceBetween: 4,
                    widthAnimation: 30,
                  ),
                  width: 203,
                  height: 80,
                  activeColor: KColor.blackbg,
                  animation: true,
                  initialPage: 0,
                ),
        );
      },
    );
  }
}

class BannerImages {
  static const String product1 = "assets/images/bag-one.png.png";
  static const String product2 = "assets/images/bag-two.png";
  static const String product3 = "assets/images/bag-three.png";

  static List<BannerModel> listProducts = [
    BannerModel(imagePath: product1, id: "1"),
    BannerModel(imagePath: product2, id: "2"),
    BannerModel(imagePath: product3, id: "3"),
  ];
}
