import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/auth/signup/state/signup_state.dart';
import 'package:finesse/src/features/auth/signup/view/signup_page.dart';
import 'package:finesse/src/features/home/views/home_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final loginProvider = StateNotifierProvider<loginController, BaseState>(
  (ref) => loginController(ref: ref),
);

/// Controllers
class loginController extends StateNotifier<BaseState> {
  final Ref? ref;

  loginController({this.ref}) : super(const InitialState());

  Future login({
    required String phone,
    required String password,
  }) async {
    state = const LoadingState();
    var responseBody;

    var requestBody = {
      'email': phone,
      'password': password,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.login, requestBody),
      );
      if (responseBody != null) {

          state = const LoginSuccessState();
          setValue(loggedIn, true);
          toast("Login Successful", bgColor: KColor.selectColor);

          //ref!.read(initDataProvider).fetchData();

          NavigationService?.navigateToReplacement(
              CupertinoPageRoute(builder: (context) => SignupPage()));

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
