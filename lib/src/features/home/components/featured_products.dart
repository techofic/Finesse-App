import 'package:finesse/components/card/product_card.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/home/controllers/product_category_controller.dart';
import 'package:finesse/src/features/home/models/products_category_model.dart';
import 'package:finesse/src/features/home/state/product_category_state.dart';
import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
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
        final wishlistState = ref.watch(wishlistProvider);
        final featureCategoryState = ref.watch(productCategoryProvider);
        final List<Product>? featureCategory =
            featureCategoryState is ProductCategorySuccessState ? featureCategoryState.productsCategory?.featuredProducts : [];

        return Column(
          children: [
            SizedBox(
              height: 300,
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
                    check: featureCategory[index].discount.toString() == "0" ? false : true,
                    tap: () {
                      Navigator.pushNamed(
                        context,
                        '/productDetails',
                        arguments: {
                          'productName': featureCategory[index].productName,
                          'productGroup': featureCategory[index].allgroup.groupName,
                          'price': featureCategory[index].sellingPrice.toString(),
                          'description': featureCategory[index].briefDescription,
                          'id': featureCategory[index].id,
                        },
                      );
                    },
                    pressed: () {
                      if (wishlistState is! LoadingState) {
                        ref.read(wishlistProvider.notifier).addWishlist(
                              id: featureCategory[index].id.toString(),
                            );
                      }
                      ref.read(wishlistProvider.notifier).fetchWishlistProducts();
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
