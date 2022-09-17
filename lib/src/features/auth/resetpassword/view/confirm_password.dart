import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/dialog/k_dialog.dart';
import 'package:finesse/components/textfield/k_fill_password_field.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/resetpassword/controller/password_reset_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPasswordPage extends StatefulWidget {
  final String? token;
  final String? phoneNumber;
  const ConfirmPasswordPage({this.token,this.phoneNumber, Key? key}) : super(key: key);

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
        child: KappBar(checkTitle: true, title: 'Reset Password'),
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
                  controller: confirmPassword,
                  hintText: '*************',
                  label: '',
                ),
              ],
            ),
            Consumer(
              builder: (context, ref, _) {
                final authState = ref.watch(resetPasswordProvider);
                return KButton(
                  title: authState is LoadingState ? 'Please wait...' : 'Reset',
                  onTap: () {
                    if (authState is! LoadingState) {
                      ref.read(resetPasswordProvider.notifier).resetPassword(
                            token: widget.token.toString(),
                            password: password.text,
                            confirmPassword: confirmPassword.text,
                            phone: widget.phoneNumber.toString()
                          );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const KDialog(message: 'Password Reset!');
                        },
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
