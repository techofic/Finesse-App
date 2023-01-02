import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/card/notification_card.dart';
import 'package:finesse/components/shimmer/k_shimmer.dart';
import 'package:finesse/components/textfield/k_search_field.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/notification/controller/notification_controller.dart';
import 'package:finesse/src/features/notification/model/notification_model.dart';
import 'package:finesse/src/features/notification/state/notification_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final notificationState = ref.watch(notificationProvider);
        final List<NotiDetail> notification =
            notificationState is GetNotificationSuccessState ? notificationState.notificationModel!.notiDetails : [];
        return Scaffold(
          backgroundColor: KColor.appBackground,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: KAppBar(
              checkTitle: true,
              dotCheck: true,
              title: 'Notification',
              onTap: () => Navigator.pushNamed(context, '/mainScreen'),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: [
                SearchTextField(
                  callbackFunction: (e) {
                    ref.read(notificationProvider.notifier).fetchNotification();
                  },
                  controller: search,
                  readOnly: false,
                  hintText: 'Search',
                ),
                const SizedBox(height: 24),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                        ),
                        const SizedBox(height: 16),
                        if (notificationState is LoadingState) ...[const KLoading(shimmerHeight: 114)],
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notification.length,
                          itemBuilder: (BuildContext context, int index) {
                            return NotificationCard(
                              msg: notification[index].msg,
                              date: createDate(notification[index].createdAt.toString(), 1),
                              cancel: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              delete: () {
                                if (notificationState is! LoadingState) {
                                  ref.read(notificationProvider.notifier).deleteNotification(
                                        id: notification[index].id.toString(),
                                      );
                                }
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        );
      },
    );
  }

  String createDate(String? date, int? index) {
    List dates = date!.split(" ");
    return dates[index!];
  }
}
