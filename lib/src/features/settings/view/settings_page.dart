import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/textfield/k_search_field.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController search = TextEditingController();
  bool isClicked = false;
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                controller: search,
                readOnly: false,
                hintText: 'Search',
              ),
              const SizedBox(height: 20),
              Text(
                'General',
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.grey,
                ),
              ),
              const SizedBox(height: 16),
              _buildOptions('Country/Region'),
              _buildOptions('Clear search history'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clear app cache',
                    style: KTextStyle.headline7.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  Text(
                    'Clear cache',
                    style: KTextStyle.subtitle5.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.04),
              Text(
                'Support',
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.grey,
                ),
              ),
              const SizedBox(height: 16),
              _buildOptions('Customer service'),
              _buildOptions('Live chat'),
              SizedBox(height: context.screenHeight * 0.02),
              Text(
                'Notifications',
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recieve push notifications',
                    style: KTextStyle.headline7.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  FlutterSwitch(
                    width: 36.0,
                    height: 20.0,
                    toggleSize: 18.0,
                    value: clicked,
                    borderRadius: 15.0,
                    padding: 1.5,
                    activeToggleColor: KColor.appBackground,
                    inactiveToggleColor: KColor.appBackground,
                    activeColor: KColor.blackbg,
                    inactiveColor: KColor.grey,
                    onToggle: (val) {
                      setState(() {
                        clicked = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'System notification',
                    style: KTextStyle.headline7.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  FlutterSwitch(
                    width: 36.0,
                    height: 20.0,
                    toggleSize: 18.0,
                    value: isClicked,
                    borderRadius: 15.0,
                    padding: 1.5,
                    activeToggleColor: KColor.appBackground,
                    inactiveToggleColor: KColor.appBackground,
                    activeColor: KColor.blackbg,
                    inactiveColor: KColor.grey,
                    onToggle: (val) {
                      setState(() {
                        isClicked = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Allow notification of promos and flash deals.',
                style: KTextStyle.subtitle5.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              SizedBox(height: context.screenHeight * 0.04),
              Text(
                'About',
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.grey,
                ),
              ),
              const SizedBox(height: 16),
              _buildOptions('Privacy policy'),
              _buildOptions('Legal'),
              SizedBox(height: context.screenHeight * 0.02),
              Text(
                'Version',
                style: KTextStyle.subtitle5.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '8.9.0',
                style: KTextStyle.subtitle5.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildOptions(option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option,
            style: KTextStyle.headline7.copyWith(
              color: KColor.blackbg,
            ),
          ),
          SvgPicture.asset(
            AssetPath.backArrowIcon,
            height: 16,
          )
        ],
      ),
    );
  }
}
