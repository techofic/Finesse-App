import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/textfield/k_password_field.dart';
import 'package:finesse/components/textfield/k_phone_field.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetPath.logo),
                      SizedBox(height: context.screenHeight * 0.05),
                      Text(
                        'Sign In',
                        style: KTextStyle.headline1.copyWith(
                          color: KColor.blackbg,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.05),
                      PhoneTextField(
                        controller: phone,
                        readOnly: false,
                        hintText: 'Enter your phone number here...',
                        label: 'Phone',
                      ),
                      const SizedBox(height: 33),
                      // TODO :: Again I would suggest to combine the textfields into one component
                      // and take border/background colors as optional parameters
                      // Check ScoreBee app's TextField for reference
                      PasswordTextField(
                        controller: password,
                        hintText: 'Enter your password here...',
                        label: 'password',
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
                                    checkColor: KColor.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    side: const BorderSide(color: KColor.black),
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                      SharedPreferences.getInstance().then(
                                        (prefs) {
                                          prefs.setBool("remember_me", value!);
                                          prefs.setString('email', phone.text);
                                          prefs.setString(
                                            'password',
                                            password.text,
                                          );
                                        },
                                      );
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
                              style: KTextStyle.subtitle3.copyWith(
                                color: KColor.blackbg,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Consumer(
                        builder: (context, ref, _) {
                          final authState = ref.watch(loginProvider);
                          return KButton(
                            title: authState is LoadingState
                                ? 'Please wait...'
                                : 'Sign In',
                            onTap: () {
                              if (authState is! LoadingState) {
                                if (_formKey.currentState!.validate()) {
                                  ref.read(loginProvider.notifier).login(
                                        phone: phone.text,
                                        password: password.text,
                                      );
                                }
                              }
                              Navigator.pushNamed(context, '/mainScreen');
                            },
                          );
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

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var phoneValue = prefs.getString("email") ?? "";
      var passwordValue = prefs.getString("password") ?? "";
      var rememberMe = prefs.getBool("remember_me") ?? false;
      if (rememberMe) {
        setState(() {
          isChecked = true;
        });
        phone.text = phoneValue;
        password.text = passwordValue;
      }
    } catch (e) {
      print(e);
    }
  }
}
