import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';
import 'package:finesse/src/features/auth/signup/view/signup_page.dart';
import 'package:finesse/src/features/profile/model/report_model.dart';
import 'package:finesse/src/features/profile/state/profile_state.dart';
import 'package:finesse/src/features/profile/view/profile_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final reportProvider = StateNotifierProvider<ReportController, BaseState>(
  (ref) => ReportController(ref: ref),
);

final profileProvider = StateNotifierProvider<ProfileController, BaseState>(
  (ref) => ProfileController(ref: ref),
);

/// Controllers
class ReportController extends StateNotifier<BaseState> {
  final Ref? ref;

  ReportController({this.ref}) : super(const InitialState());
  ReportModel? reportModel;

  Future report({
    required String description,
    required String reason,
    required String userId,
    required String orderId,
    required String image,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      'description': description,
      'reason': reason,
      'userId': userId,
      'orderId': orderId,
      'image': image,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addReport, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const ReportSuccessState();
          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast("Add report Successfully", bgColor: KColor.selectColor);

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const SignupPage(),
            ),
          );
        }
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future fetchReports() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.getReport),
      );
      if (responseBody != null) {
        reportModel = ReportModel.fromJson(responseBody);
        state = FetchReportSuccessState(reportModel);
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

class ProfileController extends StateNotifier<BaseState> {
  final Ref? ref;

  ProfileController({this.ref}) : super(const InitialState());

  User? userModel;

  Future editProfile({
    required int id,
    required String name,
    required String email,
    required User user,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    // Map<String, dynamic> customer = {
    //   "id": user.customer.id,
    //   "userId": user.customer.userId,
    //   "customerName": user.customer.customerName,
    //   "email": user.customer.email,
    //   "zone": "60 feet road",
    //   "facebook": user.customer.facebook,
    //   "instagram": user.customer.instagram,
    //   "cityId": 14,
    //   "areaId": 8375,
    //   "zoneId": 412,
    //   "postCode": null
    // };
    var requestBody = {
      'id': id,
      'name': name,
      'email': email,
      'customer': {
        "id": user.customer.id,
        "userId": user.customer.userId,
        "customerName": user.customer.customerName,
        "email": user.customer.email,
        "zone": "60 feet road",
        "facebook": user.customer.facebook,
        "instagram": user.customer.instagram,
        "cityId": 14,
        "areaId": 8375,
        "zoneId": 412,
        "postCode": null
      }
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.editUser, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const EditProfileSuccessState();
          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast("Edit user Successfully", bgColor: KColor.selectColor);

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const ProfilePage(),
            ),
          );
        }
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

class OrderController extends StateNotifier<BaseState> {
  final Ref? ref;

  OrderController({this.ref}) : super(const InitialState());
  ReportModel? reportModel;

  Future order({
    required int areaId,
    required String billingAddress,
    required String billingArea,
    required String billingCity,
    required String billingZone,
    required int cityId,
    required String contact,
    required String coupon,
    required String date,
    required int dgAmount,
    required int discount,
    required String discountType,
    required String email,
    required int giftVoucherAmount,
    required int giftVoucherCode,
    required int grandTotal,
    required int isDGMoney,
    required int isDifferentShipping,
    required int membershipDiscount,
    required int membershipDiscountAmount,
    required String name,
    required String notes,
    required String paymentType,
    required int postCode,
    required int promoDiscount,
    required int promoDiscountAmount,
    required int referralCode,
    required int referralDiscount,
    required int referralDiscountAmount,
    required int roundAmount,
    required int shippingPrice,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {
      // 'description': description,
      // 'reason': reason,
      // 'userId': userId,
      // 'orderId': orderId,
      // 'image': image,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.addReport, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const ReportSuccessState();
          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast("Add report Successfully", bgColor: KColor.selectColor);

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const SignupPage(),
            ),
          );
        }
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future fetchOrders() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.getOrder),
      );
      if (responseBody != null) {
        reportModel = ReportModel.fromJson(responseBody);
        state = FetchReportSuccessState(reportModel);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }

  Future cancelOrder({
    required int id,
    required int invoiceId,
  }) async {
    state = const LoadingState();
    dynamic responseBody;
    var requestBody = {'id': id, 'invoice_id': invoiceId};
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteOrder, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const OrderSuccessState();
          setValue(isLoggedIn, true);
          setValue(token, responseBody['token']);
          toast("Order Post Successfully", bgColor: KColor.selectColor);

          NavigationService.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const SignupPage(),
            ),
          );
        }
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
