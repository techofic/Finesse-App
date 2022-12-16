import 'package:finesse/components/card/profile_card.dart';
import 'package:finesse/constants/shared_preference_data.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final SharedPreferencesHelper _helper = SharedPreferencesHelper();
  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    name = pref.getString("name") ?? "";
    email = pref.getString("email") ?? "";
  }
  String? name;
  String? email;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: KColor.blackbg.withOpacity(0.4),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    CircleAvatar(
                      radius: 49,
                      child: Image.asset(
                        'assets/images/profile-picture.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 80,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: KColor.blackbg,
                        child: SvgPicture.asset(
                          'assets/images/edit.svg',
                          color: KColor.white,
                          height: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name.toString(),
                        style: KTextStyle.headline2.copyWith(
                          color: KColor.blackbg,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        email.toString(),
                        style: KTextStyle.subtitle3.copyWith(
                          color: KColor.blackbg.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  ProfileCard(
                    title: 'Dashboard',
                    image: 'assets/images/dashboard.png',
                    onPressed: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                  ),
                  ProfileCard(
                    title: 'My Order',
                    image: 'assets/images/my-order.png',
                    onPressed: () {
                      Navigator.pushNamed(context, '/myOrder');
                    },
                  ),
                  ProfileCard(
                    title: 'Notification',
                    image: 'assets/images/notification.png',
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                  ProfileCard(
                    title: 'Address',
                    image: 'assets/images/address.png',
                    onPressed: () {
                      Navigator.pushNamed(context, '/addressInfo');
                    },
                  ),
                  ProfileCard(
                    title: 'Account Details',
                    image: 'assets/images/account.png',
                    onPressed: () {
                      Navigator.pushNamed(context, '/accountDetails');
                    },
                  ),
                  ProfileCard(
                    title: 'Report Issue',
                    image: 'assets/images/report.png',
                    onPressed: () {
                      Navigator.pushNamed(context, '/reportIssue');
                    },
                  ),
                ],
              ),
              Container(
                width: context.screenWidth * 0.37,
                margin: const EdgeInsets.only(top: 20, bottom: 40),
                height: 54,
                decoration: BoxDecoration(
                  color: KColor.blackbg,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logout.png',
                      height: 16,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: KTextStyle.subtitle7.copyWith(
                        color: KColor.appBackground,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
