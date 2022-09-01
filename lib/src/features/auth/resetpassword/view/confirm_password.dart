import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/dialog/k_dialog.dart';
import 'package:finesse/components/textfield/k_fill_password_field.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordPage extends StatefulWidget {
  const ConfirmPasswordPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordPage> createState() => _ConfirmPasswordPageState();
}

class _ConfirmPasswordPageState extends State<ConfirmPasswordPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle:true,title: 'Reset Password'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Password',
                  style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
                ),
                const SizedBox(height: 16),
                FillTextFieldPassword(
                  controller: password,
                  hintText: '*************',
                  label: '',
                ),
                const SizedBox(height: 24),
                Text(
                  'Confirm New Password',
                  style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
                ),
                const SizedBox(height: 16),
                FillTextFieldPassword(
                  controller: password,
                  hintText: '*************',
                  label: '',
                ),
              ],
            ),
            Column(
              children: [
                KButton(
                  title: 'Reset',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const KDialog(message: 'Password Reset!');
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                KBorderButton(
                  title: 'Go Back',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
