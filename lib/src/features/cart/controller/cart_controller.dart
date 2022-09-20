import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final cartProvider = StateNotifierProvider<cartControllerr, BaseState>(
  (ref) => cartControllerr(ref: ref),
);

/// Controllers
class cartControllerr extends StateNotifier<BaseState> {
  final Ref? ref;

  cartControllerr({this.ref}) : super(const InitialState());
  CartModel? cartModel;

  Future addCart({
    required String id,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'id': id,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addWishlist, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const AddWishlistSuccessState();
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast("Product add in wishlist Successful",
              bgColor: KColor.selectColor);

          NavigationService?.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => ProductInfo(),
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

  Future cartDetails() async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody =
          await Network.handleResponse(await Network.getRequest(API.getCart));
      if (responseBody != null) {
        cartModel = CartModel.fromJson(responseBody);
        state = CartSuccessState(cartModel);
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
    var responseBody;
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
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast("Product delete in wishlist Successful",
              bgColor: KColor.selectColor);

          NavigationService?.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => ProductInfo(),
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
    var responseBody;
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
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast(
            "Product delete in cart Successful",
            bgColor: KColor.selectColor,
          );

          NavigationService?.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => ProductInfo(),
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
}