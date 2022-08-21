import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/textfield/k_description_field.dart';
import 'package:finesse/components/textfield/k_email_field.dart';
import 'package:finesse/components/textfield/k_phone_field.dart';
import 'package:finesse/components/textfield/k_text_field.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  TextEditingController name = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: KTextStyle.headline2.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Showroom 1',
                  style: KTextStyle.headline5.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/home.svg',
                    color: KColor.blackbg,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '#904, City Centre, 9th floor, Zindabazar, Sylhet',
                      style: KTextStyle.description.copyWith(
                        color: KColor.blackbg.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Showroom 2',
                  style: KTextStyle.headline5.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/home.svg',
                    color: KColor.blackbg,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '#Shop 04, Ground Floor, Elegant Shopping Mall, Zindabazar, Sylhet',
                      style: KTextStyle.description.copyWith(
                        color: KColor.blackbg.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  color: KColor.baseBlack.withOpacity(0.1),
                  thickness: 1,
                ),
              ),
              Text(
                'Phone Number',
                style: KTextStyle.headline2.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/phone.svg',
                    color: KColor.blackbg,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '+88 019 3738 48',
                      style: KTextStyle.description.copyWith(
                        color: KColor.blackbg.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  color: KColor.baseBlack.withOpacity(0.1),
                  thickness: 1,
                ),
              ),
              Text(
                'Email',
                style: KTextStyle.headline2.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/email.svg',
                    color: KColor.blackbg,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'finesse330@gmail.com',
                      style: KTextStyle.description.copyWith(
                        color: KColor.blackbg.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0,bottom: 24),
                child: Divider(
                  color: KColor.baseBlack.withOpacity(0.1),
                  thickness: 1,
                ),
              ),
              Center(
                child: Text(
                  'Tell Us Your Message Here',
                  style: KTextStyle.headline2.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
              SizedBox(height: context.screenHeight*0.06),
              NameTextField(
                controller: name,
                readOnly: false,
                hintText: 'Marwa Saad',
                label: 'Name',
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
                lable: 'Contact',
              ),
              const SizedBox(height: 24),
              DescriptionTextField(
                controller: message,
                readOnly: false,
                checkColor: true,
                hintText: 'Type your message here',
                label: '',
              ),
              SizedBox(height:context.screenHeight*0.05),
              KButton(
                title: 'Send Message',
                onTap: () {
                  Navigator.pushNamed(context, '/checkout');
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
