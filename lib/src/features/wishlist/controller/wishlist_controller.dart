import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/wishlist/model/wishlist_product_model.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/src/features/wishlist/view/wishlist_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final wishlistProvider = StateNotifierProvider<wishlistController, BaseState>(
  (ref) => wishlistController(ref: ref),
);

/// Controllers
class wishlistController extends StateNotifier<BaseState> {
  final Ref? ref;

  wishlistController({this.ref}) : super(const InitialState());
  WishlistModel? wishlistModel;

  Future addWishlist({
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
              builder: (context) => const WishlistPage(),
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

  Future fetchWishlistProducts() async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.getWishlist),
      );
      if (responseBody != null) {
        wishlistModel = WishlistModel.fromJson(responseBody);
        state = WishlistSuccessState(wishlistModel);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }

  Future deleteWishlist({
    required String id,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'id': id,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteWishlist, requestBody),
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
              builder: (context) => const WishlistPage(),
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
