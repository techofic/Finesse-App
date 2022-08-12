import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// TODO :: Do not use relative imports
// These are confusing
// Use full package imports everywhere like ->
import 'package:finesse/views/components/button/k_button.dart';
import '../../../../components/textfield/k_password_field.dart';
import '../../../../components/textfield/k_phone_field.dart';
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
    // TODO :: Do not use SafeArea over Scaffold, it blocks the system status bar
    // If needed use inside Scaffold
    return Scaffold(
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
                      // TODO :: Maintain design consistency as in UI
                      hintText: 'Enter your phone number here...',
                      // TODO :: Check text case and spelling
                      // using properly formatted words and sentences makes UI more appealing
                      lable: 'Phone',
                    ),
                    const SizedBox(height: 33),
                    // TODO :: Again I would suggest to combine the textfields into one component
                    // and take border/background colors as optional parameters
                    // Check ScoreBee app's TextField for reference
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 12,
                                width: 12,
                                child: Checkbox(
                                  value: isChecked,
                                  // visualDensity: VisualDensity.comfortable,
                                  activeColor: KColor.blackbg,
                                  // TODO :: Always use KColor class for colors
                                  // So that you don't face issues when theming
                                  checkColor: KColor.white,
                                  // TODO :: Note: the UI had a radius on the checkbox
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                  // TODO :: Note: and the checkbox border color was black
                                  // Similarly re check, notice and use all tiny details about the design from UI
                                  side: const BorderSide(color: KColor.black),
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
                                style: KTextStyle.subtitle3.copyWith(color: KColor.blackbg),
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
                            style: KTextStyle.subtitle3.copyWith(color: KColor.blackbg),
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
    );
  }
}
