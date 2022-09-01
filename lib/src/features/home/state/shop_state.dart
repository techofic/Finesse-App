import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/home/models/shop_data_model.dart';

class ShopSuccessState extends SuccessState {
  final ShopDataModel? shopDataModel;

  const ShopSuccessState(this.shopDataModel);
}
