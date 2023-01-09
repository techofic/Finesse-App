import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';
import 'package:finesse/src/features/cart/state/cart_state.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
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
  int mproductId = -1, id = -1;

  Future addCart(
      // {required int mproductId, required int id}
      {required int quantity}) async {
    if (mproductId == -1) return toast('Please select variation first', bgColor: KColor.red);

    state = const LoadingState();

    dynamic responseBody;
    var requestBody = {
      'mproductId': mproductId,
      'id': id,
      'quantity': quantity,
    };

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addCart, requestBody),
      );
      if (responseBody != null) {
        toast("Product added to cart", bgColor: KColor.selectColor);
        // TODO :: Replace cart details success state
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  // Future addCart({required Product product, required String barCode, required int quantity}) async {
  //   state = const LoadingState();
  //   dynamic responseBody;
  //   var requestBody = {
  //     'averageBuyingPrice': product.averageBuyingPrice,
  //     'barCode': barCode,
  //     'brand': product.allbrand.name,
  //     'brandId': product.brandId,
  //     'catName': product.allcategory.catName,
  //     'categoryId': product.categoryId,
  //     'created_at': product.createdAt.toIso8601String(),
  //     'date': "0000-00-00",
  //     'discount': product.discount,
  //     'groupId': product.groupId,
  //     'groupName': product.allgroup.groupName,
  //     'id': product.id,
  //     'images': [],
  //     'img': product.productImage,
  //     'menuId': product.menuId,
  //     'model': product.model,
  //     'mproductId': product.id,
  //     'openingQuantity': product.openingQuantity,
  //     'openingUnitPrice': product.openingUnitPrice,
  //     'productImage': product.productImage,
  //     'productName': product.productName,
  //     'quantity': quantity,
  //     'sellingPrice': product.sellingPrice,
  //     'stock': product.stock,
  //     'unit': "Pcs",
  //     'updated_at': product.updatedAt.toIso8601String(),
  //     'variation': "{\"Color\":\"Blue\",\"Size\":\"M\"}",
  //   };
  //   try {
  //     responseBody = await Network.handleResponse(
  //       await Network.postRequest(API.addCart, requestBody),
  //     );
  //     if (responseBody != null) {
  //       if (responseBody['token'] != null) {
  //         state = const AddWishlistSuccessState();

  //         setValue(isLoggedIn, true);
  //         setValue(token, responseBody['token']);
  //         toast("Product add in wishlist Successful", bgColor: KColor.selectColor);

  //         NavigationService.navigateToReplacement(
  //           CupertinoPageRoute(
  //             builder: (context) => const CartPage(),
  //           ),
  //         );
  //       }
  //     } else {
  //       state = const ErrorState();
  //     }
  //   } catch (error, stackTrace) {
  //     print(error);
  //     print(stackTrace);
  //     state = const ErrorState();
  //   }
  // }

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
    required String id,
    required String quantity,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      'id': id,
      'quantity': quantity,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.updateCart, requestBody),
      );
      if (responseBody != null) {
        totalCart();

        toast("Product delete in wishlist Successful", bgColor: KColor.selectColor);
        state = const DeleteWishlistSuccessState();
      } else {
        state = const ErrorState();
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
    var requestBody = {
      'id': id,
    };

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteCart, requestBody),
      );
      if (responseBody != null) {
        totalCart();

        setValue(token, responseBody['token']);
        toast("Product delete in cart Successful", bgColor: KColor.selectColor);

        state = const DeleteCartSuccessState();
      } else {
        state = const ErrorState();
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
