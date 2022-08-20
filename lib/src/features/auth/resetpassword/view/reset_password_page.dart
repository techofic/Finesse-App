import 'package:find_dropdown/find_dropdown.dart';
import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/textfield/k_text_field.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var countriesKey = GlobalKey<FindDropdownState>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reset Password', style: KTextStyle.headline3.copyWith(color: KColor.blackbg),),
                const SizedBox(height: 12),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Ultrices adipiscing sit integer ornare cras massa nulla.',
                    style: KTextStyle.subtitle5.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    )),
                const SizedBox(height: 24),
                NameTextField(
                  controller: email,
                  readOnly: false,
                  hintText: '',
                  label: 'Enter email or phone',
                ),
              ],
            ),
            KButton(
              title: 'Reset Password',
              onTap: () {
                Navigator.pushNamed(context, '/confirmPassword');
              },
            ),
          ],
        ),
      ),
    );
  }
}
