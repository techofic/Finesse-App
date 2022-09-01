import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/home/models/products_category_model.dart';

class ProductCategorySuccessState extends SuccessState {
  final ProductsCategory? productsCategory;

  const ProductCategorySuccessState(this.productsCategory);
}
