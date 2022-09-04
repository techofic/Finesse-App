import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/product_details/model/product_details_model.dart';

class ProductDetailsSuccessState extends SuccessState {
  final ProductDetailsModel? productDetailsModel;

  const ProductDetailsSuccessState(this.productDetailsModel);
}
