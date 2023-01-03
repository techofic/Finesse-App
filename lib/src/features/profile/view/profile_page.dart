import 'package:finesse/components/button/k_logout_btn.dart';
import 'package:finesse/components/card/profile_card.dart';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final userState = ref.watch(loginProvider);
        final User? userData = userState is LoginSuccessState ? userState.userModel : null;
        bool checkLogin = getBoolAsync(isLoggedIn, defaultValue: false);
        print(checkLogin.toString());
        return checkLogin
            ? Scaffold(
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
                        if (userState is LoginSuccessState) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userData!.name ?? "",
                                    style: KTextStyle.headline2.copyWith(
                                      color: KColor.blackbg,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    userData.email ?? "",
                                    style: KTextStyle.bodyText1.copyWith(
                                      color: KColor.blackbg.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                                Navigator.pushNamed(context, '/notification');
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
                        KLogoutButton(
                          tap: () => ref.read(loginProvider.notifier).logout(),
                        ),
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
