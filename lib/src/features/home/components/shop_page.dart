import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/card/product_card.dart';
import 'package:finesse/components/textfield/k_search_field.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/home/controllers/shop_controller.dart';
import 'package:finesse/src/features/home/models/shop_data_model.dart';
import 'package:finesse/src/features/home/state/shop_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final shopState = ref.watch(shopProvider);
      final List<Product>? shopData = shopState is ShopSuccessState
          ? shopState.shopDataModel?.products
          : [];
      return Scaffold(
        backgroundColor: KColor.appBackground,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: KappBar(checkTitle: true, title: 'Shop'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: SearchTextField(
                        controller: controller,
                        readOnly: false,
                        hintText: 'Search here...',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: KColor.searchColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          AssetPath.filterIcon,
                          height: 24,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 6.0,
                        childAspectRatio: 9 / 10,
                      ),
                      itemCount: shopData!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          img: shopData[index].productImage,
                          name: shopData[index].productName,
                          genre: shopData[index]
                              .allgroup
                              .groupName
                              .toString()
                              .split('.')
                              .last,
                          offerPrice: shopData[index].sellingPrice.toString(),
                          regularPrice: "",
                          discount: shopData[index].discount.toString(),
                          check: false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
