import 'package:finesse/constants/color/app_color.dart';
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';

import '../../../globalComponents/Widgets/Card/notifications.dart';
import '../../../globalComponents/Widgets/textfield/search_field.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          iconTheme: IconThemeData(color: blackbg),
          automaticallyImplyLeading: false,
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: background,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: Text(
            'Notifications',
            style: KTextStyle.subtitle1.copyWith(color: blackbg),
          ),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text(
                    'Mark all as read',
                    style: KTextStyle.subtitle3.copyWith(
                      color: blackbg.withOpacity(0.7),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Clear all',
                    style: KTextStyle.subtitle3.copyWith(
                      color: blackbg.withOpacity(0.7),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Settings',
                    style: KTextStyle.subtitle3.copyWith(
                      color: blackbg.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  controller: search,
                  readOnly: false,
                  hintText: 'Search...',
                  lable: 'Search',
                ),
                const SizedBox(height: 24),
                Text(
                  'Today',
                  style: KTextStyle.subtitle1.copyWith(color: blackbg),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        NotificationCard(),
                        const SizedBox(height: 8)
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
