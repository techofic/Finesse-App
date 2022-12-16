import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/notification/model/notification_model.dart';
import 'package:finesse/src/features/notification/state/notification_state.dart';
import 'package:finesse/src/features/product_details/components/product_info.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Providers
final notificationProvider =
    StateNotifierProvider<NotificationController, BaseState>(
  (ref) => NotificationController(ref: ref),
);

/// Controllers
class NotificationController extends StateNotifier<BaseState> {
  final Ref? ref;

  NotificationController({this.ref}) : super(const InitialState());
  NotificationModel? notificationModel;

  Future fetchNotification() async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.getNotification),
      );
      if (responseBody != null) {
        notificationModel = NotificationModel.fromJson(responseBody);
        state = GetNotificationSuccessState(notificationModel);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }

  Future deleteNotification({
    required String id,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'id': id,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.deleteNotification, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const DeleteNotificationSuccessState();
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast(
            "Delete Notification Successfully",
            bgColor: KColor.selectColor,
          );

          NavigationService?.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const ProductInfo(),
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

  Future updateNotification({
    required String id,
  }) async {
    state = const LoadingState();
    var responseBody;
    var requestBody = {
      'id': id,
    };
    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.updateNotification, requestBody),
      );
      if (responseBody != null) {
        if (responseBody['token'] != null) {
          state = const UpdateNotificationSuccessState();
          setValue(loggedIn, true);
          setValue(token, responseBody['token']);
          toast(
            "Update Notification Successfully",
            bgColor: KColor.selectColor,
          );
          NavigationService?.navigateToReplacement(
            CupertinoPageRoute(
              builder: (context) => const ProductInfo(),
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
