import 'package:finesse/components/appbar/k_app_bar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final userState = ref.watch(loginProvider);
        final User? userData = userState is LoginSuccessState ? userState.userModel : null;

        return Scaffold(
          backgroundColor: KColor.appBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: KAppBar(checkTitle: true, title: 'Account Details'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _editProfile('Name', userData?.name ?? "", () {}),
                  _editProfile('Email', userData!.email.toString(), () {}),
                  _editProfile('Address', userData.customer.address ?? "Not set yet", () {}),
                  _editProfile('Phone Number', userData.contact.toString(), () {}),
                  SizedBox(height: context.screenHeight * 0.22),
                  KButton(
                    title: 'Change Password',
                    onTap: () {
                      Navigator.pushNamed(context, '/changePassword');
                    },
                  ),
                  const SizedBox(height: 16),
                  KBorderButton(
                    title: 'Edit Profile',
                    onTap: () {
                      Navigator.pushNamed(context, '/editProfile');
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column _editProfile(String title, String info, onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: KTextStyle.subtitle1.copyWith(
            color: KColor.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 24),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  info,
                  style: KTextStyle.description.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
