import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/notification/model/notification_model.dart';

class GetNotificationSuccessState extends SuccessState {
  final NotificationModel? notificationModel;

  const GetNotificationSuccessState(this.notificationModel);
}

class DeleteNotificationSuccessState extends SuccessState {
  const DeleteNotificationSuccessState();
}

class UpdateNotificationSuccessState extends SuccessState {
  const UpdateNotificationSuccessState();
}
