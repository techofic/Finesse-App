import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPreview extends StatefulWidget {
  final String? id;

  const ProductPreview({this.id, Key? key}) : super(key: key);

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
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final productDetailsState = ref.watch(productDetailsProvider);
      return Column(
        children: [
          Container(
            height: context.screenHeight * 0.25,
            decoration: const BoxDecoration(
                color: KColor.cirColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(-20),
                    bottomRight: Radius.circular(20))),
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
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
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color:
                              index == selectIndex ? KColor.borderColor : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              products[index],
                              height: 52,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        //color: Colors.indigoAccent,
                        width: context.screenWidth * 0.78,
                        height: 247,
                        padding: const EdgeInsets.only(bottom: 15),
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
                            if(index == selectIndex){
                              ref
                                  .read(productDetailsProvider.notifier)
                                  .fetchProductsDetails(
                                widget.id.toString(),
                              );
                            }
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
                if (productDetailsState is ProductDetailsSuccessState) ...[

                ],
              ],
            ),
          ),
        ],
      );
    });
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
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color:
                index == selectIndex ? KColor.borderColor : Colors.transparent,
            width: 1,
          ),
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
