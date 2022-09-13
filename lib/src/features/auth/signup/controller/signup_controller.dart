import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/auth/signup/state/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final signupProvider = StateNotifierProvider<SignupController, BaseState>(
  (ref) => SignupController(ref: ref),
);

/// Controllers
class SignupController extends StateNotifier<BaseState> {
  final Ref? ref;

  SignupController({this.ref}) : super(const InitialState());

  Future register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String username,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'name': name,
      'email': email,
      'contact': phone,
      'password': password,
      'username': username,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.signup, requestBody),
      );
      print(requestBody);
      if (responseBody != null) {
        state = const SignupSuccessState();
        print("Registration Successful");
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
