import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/signup/state/signup_state.dart';
import 'package:finesse/src/features/cart/model/promocode_model.dart';
import 'package:finesse/src/features/cart/model/refferralcode_model.dart';
import 'package:finesse/src/features/cart/model/vouchercode_model.dart';
import 'package:finesse/src/features/cart/state/code_state.dart';
import 'package:finesse/src/features/cart/view/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final discountProvider = StateNotifierProvider<discountController, BaseState>(
  (ref) => discountController(ref: ref),
);

/// Controllers
class discountController extends StateNotifier<BaseState> {
  final Ref? ref;

  discountController({this.ref}) : super(const InitialState());
  PromoCodeModel? promoCodeModel;
  ReferralCodeModel? referralCodeModel;
  VoucherCodeModel? voucherCodeModel;

  Future sendPromoCode({
    required String code,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'code': code,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.getPromoCode, requestBody),
      );
      print(requestBody);
      if (responseBody != null) {
        promoCodeModel = PromoCodeModel.fromJson(responseBody);
        state = PromoCodeSuccessState(promoCodeModel);
        print("Send promo code Successful");
        // NavigationService.navigateToReplacement(
        //     CupertinoPageRoute(builder: (context) => const CartPage()));
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future sendCReferralCode({
    required String barCode,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'barCode': barCode,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.getReferralCode, requestBody),
      );
      print(requestBody);
      if (responseBody != null) {
        referralCodeModel = ReferralCodeModel.fromJson(responseBody);
        state = ReferralCodeSuccessState(referralCodeModel);
        print("Send referral code  Successful");
        // NavigationService.navigateToReplacement(
        //     CupertinoPageRoute(builder: (context) => const CartPage()));
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future sendGiftVoucher({
    required String code,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'code': code,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.getGiftVoucher, requestBody),
      );
      print(requestBody);
      if (responseBody != null) {
        state = const SignupSuccessState();
        print("Gift voucher code Successful");
        NavigationService.navigateToReplacement(
            CupertinoPageRoute(builder: (context) => const CartPage()));
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }
}
