import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/auth/signup/state/otp_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final otpProvider = StateNotifierProvider<OtpController, BaseState>(
      (ref) => OtpController(ref: ref),
);

/// Controllers
class OtpController extends StateNotifier<BaseState> {
  final Ref? ref;

  OtpController({this.ref}) : super(const InitialState());

  Future otpSend({
    required String phone,
    required String otp,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'email': phone,
      'token': otp,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.otp, requestBody),
      );
      print(requestBody);
      if (responseBody != null) {
        state = const OtpSuccessState();
        print("Otp send Successful");
        NavigationService.navigateToReplacement(
            CupertinoPageRoute(builder: (context) => const LoginPage()));
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      state = const ErrorState();
    }
  }

  Future otpSendAgain({
    required String phone,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'contact': phone,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.sendOtp, requestBody),
      );
      print(requestBody);
      if (responseBody != null) {
        state = const OtpSuccessState();
        print("Otp send again Successful");
        NavigationService.navigateToReplacement(
            CupertinoPageRoute(builder: (context) => const LoginPage()));
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
