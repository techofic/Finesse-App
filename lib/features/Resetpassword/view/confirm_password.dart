import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/color/app_color.dart';
import '../../../globalComponents/Widgets/Button/custom_border_btn.dart';
import '../../../globalComponents/Widgets/Button/custom_button.dart';
import '../../../globalComponents/Widgets/textfield/fill_password_field.dart';

class ConfirmPasswordPage extends StatefulWidget {
  const ConfirmPasswordPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordPage> createState() => _ConfirmPasswordPageState();
}

class _ConfirmPasswordPageState extends State<ConfirmPasswordPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Reset Password',
              style: KTextStyle.subtitle7.copyWith(
                color: blackbg,
              )),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: blackbg,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New Password',
                      style: KTextStyle.subtitle7.copyWith(color: blackbg)),
                  const SizedBox(height: 16),
                  FillTextFieldPassword(
                    controller: password,
                    hintText: 'Enter your password here...',
                    lable: 'Password',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Confirm New Password',
                    style: KTextStyle.subtitle7.copyWith(color: blackbg),
                  ),
                  const SizedBox(height: 16),
                  FillTextFieldPassword(
                    controller: password,
                    hintText: 'Enter your password here...',
                    lable: 'Password',
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    title: 'Reset',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _resetSuccessful();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomBorderButton(
                    title: 'Go Back',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Dialog _resetSuccessful() {
    return Dialog(
      backgroundColor: background,
      insetPadding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        height: 250,
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/success.svg'),
                const SizedBox(height: 16),
                Text(
                  'Password Reset!',
                  style: KTextStyle.headline3.copyWith(color: blackbg),
                ),
                 SizedBox(
                    height: MediaQuery.of(context).size.height*0.05
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    width:MediaQuery.of(context).size.width,
                    height:54,
                    decoration: BoxDecoration(
                      color: blackbg,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text('Go Back',
                        style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
