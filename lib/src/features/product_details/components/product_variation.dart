import 'dart:convert';

import 'package:finesse/components/dropdown/k_dropdown_field.dart';
import 'package:finesse/src/features/cart/controller/cart_controller.dart';
import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:finesse/styles/b_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductVariation extends ConsumerStatefulWidget {
  const ProductVariation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductVariationState();
}

class _ProductVariationState extends ConsumerState<ProductVariation> {
  List<TextEditingController> variationControllers = [];

  @override
  Widget build(BuildContext context) {
    final productDetailsState = ref.watch(productDetailsProvider);
    final productDetails = productDetailsState is ProductDetailsSuccessState ? productDetailsState.productDetailsModel : null;

    if (productDetailsState is ProductDetailsSuccessState) {
      print('build if');
      // if (variationControllers.isNotEmpty) variationControllers.clear();
      if (variationControllers.isEmpty) {
        for (int i = 0; i < productDetailsState.productDetailsModel!.allVariation!.length; i++) {
          variationControllers.add(TextEditingController());
        }
        variationControllers = variationControllers.toSet().toList();
      }
    }
    ref.listen(productDetailsProvider, (_, state) {
      print('build listen');
      if (state is ProductDetailsSuccessState) {
        for (int i = 0; i < state.productDetailsModel!.allVariation!.length; i++) {
          variationControllers.add(TextEditingController());
        }
        variationControllers = variationControllers.toSet().toList();
      }
    });

    return productDetailsState is ProductDetailsSuccessState
        ? ListView.builder(
            itemCount: productDetails!.allVariation?.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return KDropdownField(
                title: '${productDetails.allVariation?[index].name}',
                dropdownFieldOptions: productDetails.allVariation![index].values!,
                disabledHint: 'Select ${productDetails.allVariation?[index].name}',
                isDisabled: (index != 0 && index < productDetails.allVariation!.length - 1) && (variationControllers[index - 1].text.isNotEmpty),
                controller: variationControllers[index],
                callbackFunction: () {
                  Map<String, String> variation = {};
                  bool isAvailable = false;

                  if (variationControllers.any((element) => element.text.isNotEmpty)) {
                    for (int i = 0; i < productDetails.allVariation!.length; i++) {
                      variation[productDetails.allVariation![i].name!] = variationControllers[i].text;
                    }
                    print('variation = $variation');
                    print('variation json = ${jsonEncode(variation)}');
                    // print('productDetails.allVariationProduct!.length = ${productDetails.allVariationProduct!.length}');

                    for (int i = 0; i < productDetails.allVariationProduct!.length; i++) {
                      // print(
                      //     '$i ${jsonEncode(variation)} - ${productDetails.allVariationProduct![i].variation} ${jsonEncode(variation) == productDetails.allVariationProduct![i].variation}');
                      if (jsonEncode(variation) == productDetails.allVariationProduct![i].variation) {
                        isAvailable = true;
                        ref.read(cartProvider.notifier).mproductId = productDetails.allVariationProduct![i].mproductId!;
                        ref.read(cartProvider.notifier).id = productDetails.allVariationProduct![i].id!;
                        break;
                      }
                    }
                    if (!isAvailable) toast('Product not available', bgColor: KColor.red);
                  }
                },
                isCallback: true,
                initialValue: productDetails.allVariation![index].values!.firstWhere((element) => !element.isDisabled).value,
                validator: (value) => value.isEmpty ? 'This field is required' : null,
              );
            },
          )
        : const Center(child: CupertinoActivityIndicator());
  }
}

// import 'package:finesse/components/dropdown/k_dropdown.dart';
// import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
// import 'package:finesse/src/features/product_details/model/all_branda.dart';
// import 'package:finesse/src/features/product_details/state/product_details_state.dart';
// import 'package:finesse/styles/k_colors.dart';
// import 'package:finesse/styles/k_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ProductVariation extends StatefulWidget {
//   final String? id;

//   const ProductVariation({this.id, Key? key}) : super(key: key);

//   @override
//   State<ProductVariation> createState() => _ProductVariationState();
// }

// class _ProductVariationState extends State<ProductVariation> {
//   List<dynamic> items = ['4', '5', '7', '8'];
//   int currentIndex = 0;
//   String? _brands;
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, _) {
//         final brandState = ref.watch(allBrandsProvider);
//         final List<Brand> brandData = brandState is AllBrandsSuccessState ? brandState.brandModel!.brands : [];

//         // final productDetailsState = ref.watch(productDetailsProvider);
//         // final List<Value>? productImageList =
//         // productDetailsState is ProductDetailsSuccessState
//         //     ? productDetailsState.productDetailsModel?.product.color
//         //     : [];

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select Variations',
//               style: KTextStyle.headline6.copyWith(color: Colors.black),
//             ),
//             // const SizedBox(height: 24),
//             // Text(
//             //   'Size',
//             //   style: KTextStyle.subtitle1.copyWith(color: Colors.black),
//             // ),
//             // const SizedBox(height: 16),
//             // SizedBox(
//             //   width: double.infinity,
//             //   height: 50,
//             //   child: ListView.builder(
//             //     physics: const NeverScrollableScrollPhysics(),
//             //     itemCount: items.length,
//             //     scrollDirection: Axis.horizontal,
//             //     itemBuilder: (ctx, index) {
//             //       return Column(
//             //         children: [
//             //           InkWell(
//             //             onTap: () {
//             //               setState(() {
//             //                 currentIndex = index;
//             //               });
//             //             },
//             //             child: AnimatedContainer(
//             //               duration: const Duration(milliseconds: 300),
//             //               margin: const EdgeInsets.only(right: 16),
//             //               width: 48,
//             //               height: 48,
//             //               decoration: BoxDecoration(
//             //                 color: index == currentIndex ? KColor.blackbg.withOpacity(0.8) : KColor.searchColor.withOpacity(0.8),
//             //                 borderRadius: BorderRadius.circular(15),
//             //               ),
//             //               child: Center(
//             //                 child: Text(
//             //                   items[index],
//             //                   style: KTextStyle.bodyText1.copyWith(
//             //                     color: index == currentIndex ? KColor.whiteBackground : KColor.blackbg.withOpacity(0.4),
//             //                   ),
//             //                 ),
//             //               ),
//             //             ),
//             //           ),
//             //         ],
//             //       );
//             //     },
//             //   ),
//             // ),
//             // const SizedBox(height: 24),
//             // Text(
//             //   'Brand',
//             //   style: KTextStyle.subtitle1.copyWith(color: Colors.black),
//             // ),
//             // const SizedBox(height: 16),
//             // KDropdown(
//             //   hint: 'Select a Brand',
//             //   selectedReason: _brands,
//             //   data: brandData.map((e) => e.name).toList(),
//             //   change: (value) {
//             //     setState(() {
//             //       _brands = value;
//             //     });
//             //   },
//             // ),
//             const SizedBox(height: 70),
//           ],
//         );
//       },
//     );
//   }
// }
