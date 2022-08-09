
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color/app_color.dart';
import '../../../globalComponents/Widgets/Button/custom_button.dart';
import '../../../globalComponents/Widgets/textfield/email_field.dart';
import '../../../globalComponents/Widgets/textfield/password_field.dart';
import '../../../globalComponents/Widgets/textfield/phone_field.dart';
import '../../../globalComponents/Widgets/textfield/text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor: background,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                   Text(
                    'Create Your Account',
                      style: KTextStyle.headline1.copyWith(color: blackbg)
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: StringTextField(
                          controller: firstName,
                          readOnly: false,
                          hintText: 'First name',
                          lable: 'First name',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: StringTextField(
                          controller: firstName,
                          readOnly: false,
                          hintText: 'Last name',
                          lable: 'Last name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  EmailTextField(
                    controller: email,
                    readOnly: false,
                    hintText: 'Enter your email here...',
                    lable: 'Email',
                  ),
                  const SizedBox(height: 24),
                  MaterialTextField(
                    controller: phone,
                    readOnly: false,
                    hintText: 'Enter your phone number here...',
                    lable: 'Phone Number',
                  ),

                  const SizedBox(height: 24),
                  MaterialTextFieldPassword(
                    controller: password,
                    hintText: 'Enter your password here...',
                    lable: 'Password',
                  ),
                  const SizedBox(height: 24),
                  MaterialTextFieldPassword(
                    controller: confirmPassword,
                    hintText: 'Enter your password here...',
                    lable: 'Confirm Password',
                  ),
                  const SizedBox(height: 24),

                  CustomButton(
                    title: 'Create Account',
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Already a member?',
                            style: TextStyle(
                              fontSize: 14,
                              color: blackbg.withOpacity(0.4),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(text: 'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: blackbg,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
