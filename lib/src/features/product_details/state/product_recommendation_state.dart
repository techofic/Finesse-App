import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/product_details/model/producr_recommendation_model.dart';
import 'package:finesse/src/features/product_details/model/product_details_model.dart';

class ProductRecommendationSuccessState extends SuccessState {
  final ProductRecommendationModel? productRecommendationModel;

  const ProductRecommendationSuccessState(this.productRecommendationModel);
}
