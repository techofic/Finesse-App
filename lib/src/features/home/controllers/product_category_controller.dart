import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/home/models/products_category_model.dart';
import 'package:finesse/src/features/home/state/product_category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final productCategoryProvider = StateNotifierProvider<ProductCategoryController, BaseState>(
  (ref) => ProductCategoryController(ref: ref),
);

/// Controllers
class ProductCategoryController extends StateNotifier<BaseState> {
  final Ref? ref;
  ProductCategoryController({this.ref}) : super(const InitialState());
  ProductsCategory? productsCategory;

  Future fetchProductsCategoryDetails() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(await Network.getRequest(API.productsCategory));
      if (responseBody != null) {
        productsCategory = ProductsCategory.fromJson(responseBody);
        state = ProductCategorySuccessState(productsCategory);
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
