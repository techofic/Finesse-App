import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/product_details/model/all_branda.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductVariation extends StatefulWidget {
  final String? id;

  const ProductVariation({this.id, Key? key}) : super(key: key);

  @override
  State<ProductVariation> createState() => _ProductVariationState();
}

class _ProductVariationState extends State<ProductVariation> {
  List<dynamic> items = ['4', '5', '7', '8'];
  int currentIndex = 0;
  String? _brands;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final brandState = ref.watch(allBrandsProvider);
        final List<Brand> brandData = brandState is AllBrandsSuccessState ? brandState.brandModel!.brands : [];

        // final productDetailsState = ref.watch(productDetailsProvider);
        // final List<Value>? productImageList =
        // productDetailsState is ProductDetailsSuccessState
        //     ? productDetailsState.productDetailsModel?.product.color
        //     : [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Variations',
              style: KTextStyle.headline6.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 24),
            Text(
              'Size',
              style: KTextStyle.subtitle1.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 16),
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: index == currentIndex ? KColor.blackbg.withOpacity(0.8) : KColor.searchColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: KTextStyle.bodyText1.copyWith(
                                color: index == currentIndex ? KColor.whiteBackground : KColor.blackbg.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Brand',
              style: KTextStyle.subtitle1.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 16),
            KDropdown(
              hint: 'Select a Brand',
              selectedReason: _brands,
              data: brandData.map((e) => e.name).toList(),
              change: (value) {
                setState(() {
                  _brands = value;
                });
              },
            ),
            const SizedBox(height: 70),
          ],
        );
      },
    );
  }
}
