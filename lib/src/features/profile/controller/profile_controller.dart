import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/signup/view/signup_page.dart';
import 'package:finesse/src/features/profile/model/report_model.dart';
import 'package:finesse/src/features/profile/state/profile_state.dart';
import 'package:finesse/src/features/profile/view/profile_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final reportProvider = StateNotifierProvider<reportController, BaseState>(
  (ref) => reportController(ref: ref),
);

final profileProvider = StateNotifierProvider<profileController, BaseState>(
  (ref) => profileController(ref: ref),
);

/// Controllers
class reportController extends StateNotifier<BaseState> {
  final Ref? ref;

  reportController({this.ref}) : super(const InitialState());
  ReportModel? reportModel;

  Future report({
    required String description,
    required String reason,
    required String userId,
    required String orderId,
    required String image,
  }) async {
    state = const LoadingState();
    var responseBody;
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
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast("Add report Successfully", bgColor: KColor.selectColor);

          NavigationService?.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => SignupPage(),
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
    var responseBody;
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

  Future editProfile({
    required String name,
    required String email,
    required String contact,
    required String address,
    required String zoneId,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'name': name,
      'email': email,
      'contact': contact,
      'address': address,
      'zoneId': zoneId,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.editUser, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const EditProfileSuccessState();
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast("Edit user Successfully", bgColor: KColor.selectColor);

          NavigationService?.navigateToReplacement(
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

class profileController extends StateNotifier<BaseState> {
  final Ref? ref;

  profileController({this.ref}) : super(const InitialState());

  Future editProfile({
    required String name,
    required String email,
    required String contact,
    required String address,
    required String zoneId,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'name': name,
      'email': email,
      'contact': contact,
      'address': address,
      'zoneId': zoneId,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.editUser, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const EditProfileSuccessState();
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast("Edit user Successfully", bgColor: KColor.selectColor);

          NavigationService?.navigateToReplacement(
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
