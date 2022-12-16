import 'package:find_dropdown/find_dropdown.dart';
import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/resetpassword/controller/password_reset_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../components/textfield/k_phone_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var countriesKey = GlobalKey<FindDropdownState>();
  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reset Password',
                      style:
                          KTextStyle.headline3.copyWith(color: KColor.blackbg),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Ultrices adipiscing sit integer ornare cras massa nulla.',
                        style: KTextStyle.subtitle5.copyWith(
                          color: KColor.blackbg.withOpacity(0.6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    PhoneTextField(
                      controller: phone,
                      readOnly: false,
                      hintText: 'Enter phone',
                      label: '',
                    ),
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  final authState = ref.watch(resetPasswordProvider);
                  return KButton(
                    title: authState is LoadingState
                        ? 'Please wait...'
                        : 'Reset Password',
                    onTap: () {
                      if (authState is! LoadingState) {
                        if (_formKey.currentState!.validate()) {
                          ref.read(resetPasswordProvider.notifier).sendPhone(
                                phone: phone.text,
                              );
                          Navigator.pushNamed(
                            context,
                            '/setOtp',
                            arguments: {
                              'phoneNumber': phone.text,
                            },
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
