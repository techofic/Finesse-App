import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/profile/components/update_profile.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        bool checkLogin = getBoolAsync(loggedIn, defaultValue: false);
        return checkLogin
            ? Scaffold(
                backgroundColor: KColor.appBackground,
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: KAppBar(checkTitle: true, title: 'Account Information'),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UpdateProfile(),
                        KBorderButton(
                          title: 'Go Back',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              )
            : const LoginPage();
      },
    );
  }
}
