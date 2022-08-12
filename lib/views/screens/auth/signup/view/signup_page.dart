import 'package:finesse/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../../components/Button/k_button.dart';
import '../../../../components/textfield/k_email_field.dart';
import '../../../../components/textfield/k_password_field.dart';
import '../../../../components/textfield/k_phone_field.dart';
import '../../../../components/textfield/k_search_field.dart';
import '../../../../components/textfield/k_text_field.dart';

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
  var selectedColor = KColor.blackbg;
  String _verticalGroupValue = "English(United States)";
  final List<String> _status = ["English (UK)", "Portuguese", "Espinosa", "Francais", "Turkce", "Italiano", "Hindi"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SelectLanguage(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/logo.svg'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065,
                      ),
                      Text(
                        'Create Your Account',
                        style: KTextStyle.headline1.copyWith(
                          color: KColor.blackbg,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: NameTextField(
                              controller: firstName,
                              readOnly: false,
                              hintText: 'First nameiii',
                              label: 'First name',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: NameTextField(
                              controller: firstName,
                              readOnly: false,
                              hintText: 'Last name',
                              label: 'Last name',
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
                      PhoneTextField(
                        controller: phone,
                        readOnly: false,
                        hintText: 'Enter your phone number here...',
                        lable: 'Phone Number',
                      ),
                      const SizedBox(height: 24),
                      PasswordTextField(
                        controller: password,
                        hintText: 'Enter your password here...',
                        lable: 'Password',
                      ),
                      const SizedBox(height: 24),
                      PasswordTextField(
                        controller: confirmPassword,
                        hintText: 'Enter your password here...',
                        lable: 'Confirm Password',
                      ),
                      const SizedBox(height: 24),
                      KButton(
                        title: 'Create Account',
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Already a member?',
                                style: KTextStyle.subtitle3.copyWith(
                                  color: KColor.blackbg.withOpacity(0.4),
                                ),
                              ),
                              TextSpan(
                                text: ' Login',
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

  // ignore: non_constant_identifier_names
  InkWell _SelectLanguage(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return languageDialogbox();
          },
        );
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _verticalGroupValue,
            style: KTextStyle.subtitle3.copyWith(color: KColor.blackbg),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            'assets/images/down_arrow.svg',
            color: KColor.blackbg,
          )
        ],
      ),
    );
  }

  StatefulBuilder languageDialogbox() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          backgroundColor: KColor.appBackground,
          insetPadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
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
                    style: KTextStyle.headline3.copyWith(color: KColor.blackbg),
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
                    }),
                    spacebetween: 50,
                    activeColor: isselected ? Colors.lightBlue : Colors.orange,
                    items: _status,
                    textStyle: KTextStyle.dialog.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
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
      },
    );
  }
}
