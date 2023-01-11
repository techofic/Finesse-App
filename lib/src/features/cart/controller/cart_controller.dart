import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/product_details/model/product_details_model.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final cartProvider = StateNotifierProvider<CartController, BaseState>(
  (ref) => CartController(ref: ref),
);

/// Controllers
class CartController extends StateNotifier<BaseState> {
  final Ref? ref;
  CartController({this.ref}) : super(const InitialState());

  List<CartModel> cartList = [];
  int subtotal = 0;
  AllVariationProduct? productVariationDetails;

  Future addCart({required int quantity}
      // {required int mproductId, required int id}
      ) async {
    print('productVariationDetails = $productVariationDetails');
    if (productVariationDetails == null) {
      return toast('Please select variation first!', bgColor: KColor.red);
    } else if (productVariationDetails != null && quantity > productVariationDetails!.stock) {
      return toast('Stock limit exceeded!', bgColor: KColor.red);
    }

    state = const LoadingState();

    dynamic responseBody;
    var requestBody = {
      'mproductId': productVariationDetails!.mproductId,
      'id': productVariationDetails!.id,
      'quantity': quantity,
    };

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addCart, requestBody),
      );
      if (responseBody != null) {
        cartList = (responseBody['allCarts'] as List<dynamic>).map((x) => CartModel.fromJson(x)).toList();
        toast("Product added to cart", bgColor: KColor.selectColor);
        state = CartSuccessState(cartList);
        totalCart();
      } else {
        state = CartSuccessState(cartList);
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future cartDetails() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(await Network.getRequest(API.getCart));
      if (responseBody != null) {
        cartList = (responseBody['allCarts'] as List<dynamic>).map((x) => CartModel.fromJson(x)).toList();
        state = CartSuccessState(cartList);
        totalCart();
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }

  Future updateCart({
    required id,
    required quantity,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      // 'mproductId': 121,
      'id': id,
      'quantity': quantity,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.updateCart, requestBody),
      );
      if (responseBody != null) {
        cartList = (responseBody['allCarts'] as List<dynamic>).map((x) => CartModel.fromJson(x)).toList();
        toast("Product quantity updated in cart successfully!", bgColor: KColor.selectColor);
        state = CartSuccessState(cartList);
        totalCart();
      } else {
        state = CartSuccessState(cartList);
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future deleteCart({required String id}) async {
    state = const LoadingState();

    dynamic responseBody;
    var requestBody = {'id': id};

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteCart, requestBody),
      );
      if (responseBody != null) {
        cartList = (responseBody['allCarts'] as List<dynamic>).map((x) => CartModel.fromJson(x)).toList();
        toast("Product removed from cart successfully!", bgColor: KColor.selectColor);
        state = CartSuccessState(cartList);
        totalCart();
      } else {
        state = CartSuccessState(cartList);
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  void totalCart() {
    int total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total += cartList[i].details!.sellingPrice! * cartList[i].quantity!;
    }
    subtotal = total;
    print('subtotal : $subtotal');
  }
}
