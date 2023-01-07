import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/product_details/model/review_model.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewsProvider = StateNotifierProvider<ReviewsController, BaseState>(
  (ref) => ReviewsController(ref: ref),
);

class ReviewsController extends StateNotifier<BaseState> {
  final Ref? ref;
  ReviewsController({this.ref}) : super(const InitialState());

  List<ReviewModel> reviewsList = [];

  Future fetchProductReviews(productId) async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.productReviews(productId: productId)),
      );
      if (responseBody != null) {
        reviewsList = (responseBody['reviews'] as List<dynamic>).map((x) => ReviewModel.fromJson(x)).toList();
        state = ReviewsSuccessState(reviewsList);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print('fetchProductReviews() error = $error');
      print(stackTrace);
      state = const ErrorState();
    }
  }
}
