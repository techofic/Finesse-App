import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../../globalComponents/Button/k_button.dart';
import '../../../../globalComponents/textfield/k_text_field.dart';
import '../../../../styles/k_colors.dart';
import '../../../../styles/k_text_style.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        appBar: AppBar(
          backgroundColor: KColor.appBackground,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: KColor.blackbg,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reset Password',
                      style:
                          KTextStyle.headline3.copyWith(color: KColor.blackbg)),
                  const SizedBox(height: 12),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Ultrices adipiscing sit integer ornare cras massa nulla.',
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
      ),
    );
  }
}
