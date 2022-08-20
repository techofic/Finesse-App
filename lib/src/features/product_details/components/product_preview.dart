import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPreview extends StatefulWidget {
  const ProductPreview({Key? key}) : super(key: key);

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  final _controller = PageController();

  List<String> products = [
    'assets/images/bag-one.png',
    'assets/images/bag-two.png',
    'assets/images/bag-three.png',
  ];
  List<Color> colors = [
    KColor.baseBlack,
    KColor.filterColorOne,
    KColor.filterColorTwo,
  ];
  int selectIndex = 0;
  int selectColor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.screenHeight * 0.3,
          color: KColor.cirColor,
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _productPreview(index);
                  },
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 258,
                      height: 247,
                      child: PageView(
                        controller: _controller,
                        children: [
                          Image.asset('assets/images/bag-one.png'),
                          Image.asset('assets/images/bag-two.png'),
                          Image.asset('assets/images/bag-three.png'),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        onDotClicked: (index) {
                          setState(() {
                            selectIndex = index;
                            _controller.animateToPage(
                              selectIndex,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        effect: ExpandingDotsEffect(
                          activeDotColor: KColor.blackbg,
                          dotColor: KColor.baseBlack.withOpacity(0.2),
                          dotHeight: 8,
                          dotWidth: 8,
                          radius: 107,
                          spacing: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectColor = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectColor == index
                                ? KColor.borderColor
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                            ),
                            child: selectColor == index
                                ? Center(
                                    child: SvgPicture.asset(
                                      'assets/images/right.svg',
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell _productPreview(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectIndex = index;
          _controller.animateToPage(
            selectIndex,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Container(
        height: 54,
        width: 54,
        margin: const EdgeInsets.only(bottom: 11),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: index == selectIndex
                  ? KColor.borderColor
                  : Colors.transparent,
              width: 1),
        ),
        child: Center(
          child: Image.asset(
            products[index],
            height: 52,
          ),
        ),
      ),
    );
  }
}
