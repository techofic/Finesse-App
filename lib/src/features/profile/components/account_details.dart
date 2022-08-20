import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Account Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _editProfile('Name','Marwa Saad',(){}),
              _editProfile('Email','marwasaad605@gmail.com',(){}),
              _editProfile('Address','House No 8, Lane 5, St John Hill City, Toronto',(){}),
              _editProfile('Cards Saved','Visa Card :  374883****',(){}),
              _editProfile('Phone Number','+999 677839 33',(){}),
              SizedBox(height: context.screenHeight*0.15),
              KButton(
                title: 'Change Password',
                onTap: () {
                  Navigator.pushNamed(context, '/changePassword');
                },
              ),
              const SizedBox(height: 16),
              KBorderButton(
                title: 'Edit Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/editProfile');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Column _editProfile(title, info, onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: KTextStyle.subtitle1.copyWith(
            color: KColor.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 24),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  info,
                  style: KTextStyle.description.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: onPressed,
                child: SvgPicture.asset('assets/images/edit.svg'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
