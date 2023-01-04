import 'package:finesse/components/filter/k_filter.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/src/features/notification/controller/notification_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool status = false;
  bool theme = false;
  Color themeColor = KColor.appBackground;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: themeColor,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(AssetPath.drawerIcon),
          );
        },
      ),
      title: const KFilter(),
      actions: [
        Consumer(
          builder: (context, ref, _) {
            return IconButton(
              onPressed: () {
                if (getBoolAsync(isLoggedIn)) {
                  Navigator.pushNamed(context, '/notification');
                  ref.read(notificationProvider.notifier).fetchNotification();
                } else {
                  Navigator.pushNamed(context, '/login');
                }
              },
              icon: SvgPicture.asset(AssetPath.notificationIcon),
            );
          },
        ),
      ],
    );
  }
}
