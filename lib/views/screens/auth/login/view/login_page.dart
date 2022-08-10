import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../globalComponents/Button/k_button.dart';
import '../../../../globalComponents/textfield/k_password_field.dart';
import '../../../../globalComponents/textfield/k_phone_field.dart';
import '../../../../styles/k_colors.dart';
import '../../../../styles/k_text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController search = TextEditingController();
  bool isChecked = false;
  bool isselected = false;
  var selectedColor = KColor.blackbg;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/logo.svg'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        'Sign In',
                        style: KTextStyle.headline1.copyWith(
                          color: KColor.blackbg,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      PhoneTextField(
                        controller: phone,
                        readOnly: false,
                        hintText: '999 004 5950',
                        lable: 'phone',
                      ),
                      const SizedBox(height: 33),
                      PasswordTextField(
                        controller: password,
                        hintText: 'Enter your password here...',
                        lable: 'password',
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: Checkbox(
                                    value: isChecked,
                                    // visualDensity: VisualDensity.comfortable,
                                    activeColor: KColor.blackbg,
                                    checkColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  'Remember Password',
                                  style: KTextStyle.subtitle3.copyWith(
                                    color: KColor.blackbg,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/resetPassword');
                            },
                            child: Text(
                              'Forgot password?',
                              style: KTextStyle.subtitle3
                                  .copyWith(color: KColor.blackbg),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      KButton(
                        title: 'Sign In',
                        onTap: () {
                          Navigator.pushNamed(context, '/mainScreen');
                        },
                      ),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'New here?',
                                style: KTextStyle.subtitle3.copyWith(
                                  color: KColor.blackbg.withOpacity(0.4),
                                ),
                              ),
                              TextSpan(
                                text: ' Create Account',
                                style: KTextStyle.subtitle7.copyWith(
                                  color: KColor.blackbg,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
