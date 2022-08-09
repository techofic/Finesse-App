import 'package:finesse/constants/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Drawer/k_drawer.dart';

class KAppBar extends StatefulWidget {
  const KAppBar({Key? key}) : super(key: key);

  @override
  State<KAppBar> createState() => _KAppBarState();
}

class _KAppBarState extends State<KAppBar> {
  bool status = false;
  bool theme = false;
  Color themeColor = background;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset('assets/images/drawerIon.svg'),
          );
        }),
        actions: [
          FlutterSwitch(
            width: 36.0,
            height: 20.0,
            toggleSize: 18.0,
            value: status,
            borderRadius: 15.0,
            padding: 2.0,
            activeToggleColor: Colors.white,
            inactiveToggleColor: Colors.white,
            activeColor: const Color(0xFF797979),
            inactiveColor: const Color(0xFF797979),
            activeIcon: const Icon(
              Icons.nightlight_round,
              color: blackbg,
            ),
            inactiveIcon: const Icon(
              Icons.wb_sunny,
              color: blackbg,
            ),
            onToggle: (val) {
              setState(() {
                status = val;
                if (val) {
                  setState(() {
                    theme = !theme;
                    themeColor = blackbg;
                  });
                } else {
                  setState(() {
                    themeColor = background;
                  });
                }
              });
            },
          ),
          const SizedBox(width: 26),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              Navigator.pushNamed(context, '/notification');
            },
            icon: SvgPicture.asset('assets/images/notificationIcon.svg'),
          ),
        ],
      ),
    );
  }
}
