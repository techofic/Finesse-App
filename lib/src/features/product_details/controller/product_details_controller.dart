import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/product_details/model/product_details_model.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final productDetailsProvider =
    StateNotifierProvider<ProductDetailsController, BaseState>(
  (ref) => ProductDetailsController(ref: ref),
);

/// Controllers
class ProductDetailsController extends StateNotifier<BaseState> {
  final Ref? ref;

  ProductDetailsController({this.ref}) : super(const InitialState());
  ProductDetailsModel? productDetailsModel;

  Future fetchProductsDetails(productId) async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.productDetails(productId)),
      );
      if (responseBody != null) {
        productDetailsModel = ProductDetailsModel.fromJson(responseBody);
        state = ProductDetailsSuccessState(productDetailsModel);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }
}
