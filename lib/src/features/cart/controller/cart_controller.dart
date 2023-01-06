import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/cart/view/cart_page.dart';
import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final cartProvider = StateNotifierProvider<CartController, BaseState>(
  (ref) => CartController(ref: ref),
);

/// Controllers
class CartController extends StateNotifier<BaseState> {
  final Ref? ref;

  CartController({this.ref}) : super(const InitialState());
  CartModel? cartModel;
  int subtotal = 0;

  Future addCart({required int mproductId, required int id, required int quantity}) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      'mproductId': mproductId,
      'id': id,
      'quantity': quantity,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addCart, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const AddWishlistSuccessState();

          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast("Product add in wishlist Successful", bgColor: KColor.selectColor);

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        }
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  // Future addCart({required Product product, required String barCode, required int quantity}) async {
  //   state = const LoadingState();
  //   dynamic responseBody;
  //   var requestBody = {
  //     'averageBuyingPrice': product.averageBuyingPrice,
  //     'barCode': barCode,
  //     'brand': product.allbrand.name,
  //     'brandId': product.brandId,
  //     'catName': product.allcategory.catName,
  //     'categoryId': product.categoryId,
  //     'created_at': product.createdAt.toIso8601String(),
  //     'date': "0000-00-00",
  //     'discount': product.discount,
  //     'groupId': product.groupId,
  //     'groupName': product.allgroup.groupName,
  //     'id': product.id,
  //     'images': [],
  //     'img': product.productImage,
  //     'menuId': product.menuId,
  //     'model': product.model,
  //     'mproductId': product.id,
  //     'openingQuantity': product.openingQuantity,
  //     'openingUnitPrice': product.openingUnitPrice,
  //     'productImage': product.productImage,
  //     'productName': product.productName,
  //     'quantity': quantity,
  //     'sellingPrice': product.sellingPrice,
  //     'stock': product.stock,
  //     'unit': "Pcs",
  //     'updated_at': product.updatedAt.toIso8601String(),
  //     'variation': "{\"Color\":\"Blue\",\"Size\":\"M\"}",
  //   };
  //   try {
  //     responseBody = await Network.handleResponse(
  //       await Network.postRequest(API.addCart, requestBody),
  //     );
  //     if (responseBody != null) {
  //       if (responseBody['token'] != null) {
  //         state = const AddWishlistSuccessState();

  //         setValue(isLoggedIn, true);
  //         setValue(token, responseBody['token']);
  //         toast("Product add in wishlist Successful", bgColor: KColor.selectColor);

  //         NavigationService.navigateToReplacement(
  //           CupertinoPageRoute(
  //             builder: (context) => const CartPage(),
  //           ),
  //         );
  //       }
  //     } else {
  //       state = const ErrorState();
  //     }
  //   } catch (error, stackTrace) {
  //     print(error);
  //     print(stackTrace);
  //     state = const ErrorState();
  //   }
  // }

  Future cartDetails() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(await Network.getRequest(API.getCart));
      if (responseBody != null) {
        cartModel = CartModel.fromJson(responseBody);
        state = CartSuccessState(cartModel);
        totalCart();
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }

  Future updateCart({
    required String id,
    required String quantity,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      'id': id,
      'quantity': quantity,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.updateCart, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const DeleteWishlistSuccessState();
          totalCart();
          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast("Product delete in wishlist Successful", bgColor: KColor.selectColor);

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const ProductInfo(),
            ),
          );
        }
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future deleteCart({
    required String id,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      'id': id,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteCart, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const DeleteCartSuccessState();
          totalCart();
          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast(
            "Product delete in cart Successful",
            bgColor: KColor.selectColor,
          );

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const ProductInfo(),
            ),
          );
        }
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  void totalCart() {
    int total = 0;
    for (int i = 0; i < cartModel!.allCarts.length; i++) {
      total += cartModel!.allCarts[i].details!.sellingPrice! * cartModel!.allCarts[i].quantity!;
    }
    subtotal = total;
    print('subtotal : $subtotal');
  }
}
