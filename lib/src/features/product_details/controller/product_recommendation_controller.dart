import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/product_details/model/producr_recommendation_model.dart';
import 'package:finesse/src/features/product_details/state/product_recommendation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final productRecommendationProvider =
    StateNotifierProvider<ProductRecommendationController, BaseState>(
  (ref) => ProductRecommendationController(ref: ref),
);

/// Controllers
class ProductRecommendationController extends StateNotifier<BaseState> {
  final Ref? ref;

  ProductRecommendationController({this.ref}) : super(const InitialState());
  ProductRecommendationModel? productRecommendationModel;

  Future fetchProductsRecommendation(productId) async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.productRecommendation(productId)),
      );
      if (responseBody != null) {
        productRecommendationModel =
            ProductRecommendationModel.fromJson(responseBody);
        state = ProductRecommendationSuccessState(productRecommendationModel);
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
