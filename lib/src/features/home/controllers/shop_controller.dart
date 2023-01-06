import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/home/models/shop_data_model.dart';
import 'package:finesse/src/features/home/state/shop_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final shopProvider = StateNotifierProvider<ShopController, BaseState>(
  (ref) => ShopController(ref: ref),
);

/// Controllers
class ShopController extends StateNotifier<BaseState> {
  final Ref? ref;

  ShopController({this.ref}) : super(const InitialState());
  ShopDataModel? shopDataModel;
  List<ShopDataModel>? searchModel = [];

  Future fetchShopProductList({str, groupId, categoryId}) async {
    state = const LoadingState();
    dynamic responseBody;

    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.shop(str: str, groupId: groupId, categoryId: categoryId)),
      );

      if (responseBody != null) {
        shopDataModel = ShopDataModel.fromJson(responseBody);
        state = ShopSuccessState(shopDataModel);
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
