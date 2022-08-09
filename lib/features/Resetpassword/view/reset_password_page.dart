import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import '../../../globalComponents/Style/k_text_style.dart';
import '../../../globalComponents/Widgets/Button/custom_button.dart';
import '../../../constants/color/app_color.dart';
import '../../../globalComponents/Widgets/textfield/text_field.dart';

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
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          elevation: 0,
          automaticallyImplyLeading: false,
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
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Reset Password',
                    style: KTextStyle.headline3.copyWith(color: blackbg)
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Ultrices adipiscing sit integer ornare cras massa nulla.',
                    style: KTextStyle.subtitle5.copyWith(color: blackbg.withOpacity(0.6),)
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  StringTextField(
                    controller: email,
                    readOnly: false,
                    hintText: '',
                    lable: 'Enter email or phone',
                  ),

                ],
              ),
              CustomButton(
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
