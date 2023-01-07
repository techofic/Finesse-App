import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/wishlist/model/wishlist_product_model.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final wishlistProvider = StateNotifierProvider<WishlistController, BaseState>(
  (ref) => WishlistController(ref: ref),
);

/// Controllers
class WishlistController extends StateNotifier<BaseState> {
  final Ref? ref;

  WishlistController({this.ref}) : super(const InitialState());
  WishlistModel? wishlistModel;

  Future addWishlist({required String id}) async {
    state = const LoadingState();

    dynamic responseBody;
    var requestBody = {'id': id};

    ref!.read(productDetailsProvider.notifier).productDetailsModel!.product!.isWishlist = true;
    ref!.read(productDetailsProvider.notifier).updateSuccessState();

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addWishlist, requestBody),
      );
      if (responseBody != null) {
        toast("Product added to wishlist successfully!", bgColor: KColor.selectColor);
        state = const AddWishlistSuccessState();
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

    dynamic responseBody;

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

  Future deleteWishlist({required String id}) async {
    state = const LoadingState();

    dynamic responseBody;
    var requestBody = {'id': id};

    if (ref!.read(productDetailsProvider.notifier).productDetailsModel != null) {
      ref!.read(productDetailsProvider.notifier).productDetailsModel!.product!.isWishlist = false;
      ref!.read(productDetailsProvider.notifier).updateSuccessState();
    }

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteWishlist, requestBody),
      );
      if (responseBody != null) {
        toast("Product removed from wishlist successfully", bgColor: KColor.selectColor);
        state = const DeleteWishlistSuccessState();
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
