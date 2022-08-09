import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_radio_button/group_radio_button.dart';
import '../../../constants/color/app_color.dart';
import '../../../globalComponents/Widgets/Button/custom_button.dart';
import '../../../globalComponents/Widgets/textfield/password_field.dart';
import '../../../globalComponents/Widgets/textfield/phone_field.dart';
import '../../../globalComponents/Widgets/textfield/search_field.dart';

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
  String _verticalGroupValue = "English(United States)";
  List<String> _status = [
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
          margin: const EdgeInsets.symmetric(horizontal: 12),
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
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text('Login',
                          style: KTextStyle.headline1.copyWith(color: blackbg)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MaterialTextField(
                        controller: phone,
                        readOnly: false,
                        hintText: 'Enter your phone here',
                        lable: 'phone',
                      ),
                      const SizedBox(height: 33),
                      MaterialTextFieldPassword(
                        controller: password,
                        hintText: 'Enter your password here...',
                        lable: 'password',
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: blackbg,
                                checkColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text(
                                'Remember Password',
                                style: KTextStyle.subtitle3.copyWith(
                                  color: blackbg,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/resetPassword');
                            },
                            child: Text(
                              'Forgot password?',
                              style:
                                  KTextStyle.subtitle3.copyWith(color: blackbg),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        title: 'Login',
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
                                  color: blackbg,
                                ),
                              ),
                              TextSpan(
                                text: ' Create Account',
                                style: KTextStyle.subtitle1.copyWith(
                                  color: blackbg,
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
            return Dialog(
              backgroundColor: background,
              insetPadding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                height: 512,
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
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
                          print(_verticalGroupValue);
                        }),
                        spacebetween: 50,
                        activeColor: blackbg,
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
      child: Container(
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
                  print(_verticalGroupValue);
                }),
                spacebetween: 50,
                activeColor: blackbg,
                items: _status,
                textStyle:
                    KTextStyle.dialog.copyWith(color: blackbg.withOpacity(0.6)),
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
