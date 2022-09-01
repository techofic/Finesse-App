import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/home/models/category_model.dart';

class CategorySuccessState extends SuccessState {
  final CategoryModel? categoryModel;

  const CategorySuccessState(this.categoryModel);
}
