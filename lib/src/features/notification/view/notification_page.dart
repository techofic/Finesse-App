import 'package:finesse/components/card/notification_card.dart';
import 'package:finesse/components/textfield/k_search_field.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
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
        final List<NotiDetail>? notification =
            notificationState is GetNotificationSuccessState
                ? notificationState.notificationModel!.notiDetails
                : [];
        return Scaffold(
          backgroundColor: KColor.appBackground,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: KColor.blackbg),
            automaticallyImplyLeading: false,
            toolbarHeight: 65,
            elevation: 0,
            backgroundColor: KColor.appBackground,
            leading: IconButton(
              onPressed: () {
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/mainScreen');
              },
              icon: const Icon(Icons.arrow_back),
            ),
            centerTitle: true,
            title: Text(
              'Notifications',
              style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
            ),
            actions: [
              PopupMenuButton(
                color: KColor.appBackground,
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text(
                      'Mark all as read',
                      style: KTextStyle.subtitle3.copyWith(
                        color: KColor.blackbg.withOpacity(0.7),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Clear all',
                      style: KTextStyle.subtitle3.copyWith(
                        color: KColor.blackbg.withOpacity(0.7),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Settings',
                      style: KTextStyle.subtitle3.copyWith(
                        color: KColor.blackbg.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              )
            ],
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
                          style: KTextStyle.subtitle1
                              .copyWith(color: KColor.blackbg),
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notification?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return NotificationCard(
                              msg: notification![index].msg,
                              date: createDate(
                                  notification[index].createdAt.toString(), 1),
                              cancel: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              delete: () {
                                if (notificationState is! LoadingState) {
                                  ref
                                      .read(notificationProvider.notifier)
                                      .deleteNotification(
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
    print(dates[1]);
    return dates[index!];
  }
}
