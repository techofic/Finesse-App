import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/home/models/category_model.dart';
import 'package:finesse/src/features/home/state/category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final categoryProvider = StateNotifierProvider<CategoryController, BaseState>(
  (ref) => CategoryController(ref: ref),
);

/// Controllers
class CategoryController extends StateNotifier<BaseState> {
  final Ref? ref;

  CategoryController({this.ref}) : super(const InitialState());
  CategoryModel? categoryModel;

  Future fetchCategoryDetails() async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody =
          await Network.handleResponse(await Network.getRequest(API.category));
      if (responseBody != null) {
        categoryModel = CategoryModel.fromJson(responseBody);
        state = CategorySuccessState(categoryModel);
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
