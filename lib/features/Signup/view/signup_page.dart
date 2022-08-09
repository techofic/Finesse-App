
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../constants/color/app_color.dart';
import '../../../globalComponents/Widgets/Button/custom_button.dart';
import '../../../globalComponents/Widgets/textfield/email_field.dart';
import '../../../globalComponents/Widgets/textfield/password_field.dart';
import '../../../globalComponents/Widgets/textfield/phone_field.dart';
import '../../../globalComponents/Widgets/textfield/search_field.dart';
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
  TextEditingController search = TextEditingController();

  bool isselected = false;
  var selectedColor = blackbg;
  String _verticalGroupValue = "English(United States)";
  final List<String> _status = [
    "English (UK)",
    "Portugues",
    "Espanol",
    "Francais",
    "Turkce",
    "Italiano",
    "Hindi"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor: background,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _languageSetup(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/logo.svg'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  InkWell _languageSetup(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return languageDialogbox();
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _verticalGroupValue,
            style: KTextStyle.subtitle3.copyWith(color: blackbg),
          ),
          SizedBox(width: 8),
          SvgPicture.asset(
            'assets/images/down_arrow.svg',
            color: blackbg,
          )
        ],
      ),
    );
  }
  Dialog languageDialogbox() {
    return Dialog(
      backgroundColor: background,
      insetPadding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 512,
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select language',
                style: KTextStyle.headline3.copyWith(color: blackbg),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 19),
                child: SearchTextField(
                  controller: search,
                  readOnly: false,
                  hintText: 'Search...',
                  lable: 'Search',
                ),
              ),
              RadioGroup<String>.builder(
                direction: Axis.vertical,
                groupValue: _verticalGroupValue,
                horizontalAlignment: MainAxisAlignment.spaceAround,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value!;
                  isselected = !isselected;
                  print(_verticalGroupValue);
                }),
                spacebetween: 50,
                activeColor: isselected?Colors.lightBlue:Colors.orange,
                items: _status,
                textStyle: KTextStyle.dialog.copyWith(
                  color: blackbg.withOpacity(0.6),
                ),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
