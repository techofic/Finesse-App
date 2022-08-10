
import 'package:finesse/views/styles/k_colors.dart';
import 'package:flutter/material.dart';

import '../../../globalComponents/card/notification_card.dart';
import '../../../globalComponents/textfield/k_search_field.dart';
import '../../../styles/k_text_style.dart';

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
        backgroundColor: KColor.appBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: KColor.blackbg),
          automaticallyImplyLeading: false,
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: KColor.appBackground,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
              color: Colors.white,
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
                  style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: const [
                        NotificationCard(),
                        SizedBox(height: 8)
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
