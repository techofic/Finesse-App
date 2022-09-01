import 'package:finesse/components/card/product_card.dart';
import 'package:finesse/src/features/home/controllers/product_category_controller.dart';
import 'package:finesse/src/features/home/models/products_category_model.dart';
import 'package:finesse/src/features/home/state/product_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final featureCategoryState = ref.watch(productCategoryProvider);
        final List<Product>? featureCategory =
            featureCategoryState is ProductCategorySuccessState
                ? featureCategoryState.productsCategory?.featuredProducts
                : [];

        return Column(
          children: [
            SizedBox(
              height: 207,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featureCategory!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    img: featureCategory[index].productImage,
                    name: featureCategory[index].productName,
                    genre: "",
                    offerPrice: featureCategory[index].sellingPrice.toString(),
                    regularPrice: "",
                    discount: featureCategory[index].discount.toString(),
                    check: featureCategory[index].discount.toString()=="0"?false:true,
                    tap: (){
                      Navigator.pushNamed(
                        context,
                        '/productDetails',
                        arguments: {
                          'productName': featureCategory[index].productName,
                          'productGroup': featureCategory[index].allgroup.groupName,
                          'price': featureCategory[index].sellingPrice.toString(),
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
