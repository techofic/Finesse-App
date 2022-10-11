import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/dialog/k_dialog.dart';
import 'package:finesse/components/textfield/k_fill_name.dart';
import 'package:finesse/components/textfield/k_fill_phone.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/profile/controller/profile_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController cardNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Account Information'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KFillNormal(
                    controller: name,
                    hintText: 'Enter your name here...',
                    label: '',
                    readOnly: false,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Email',
                    style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KFillNormal(
                    controller: email,
                    hintText: 'Enter your email here...',
                    label: '',
                    readOnly: false,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Address',
                    style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KFillNormal(
                    controller: address,
                    hintText: 'Enter your address here...',
                    label: '',
                    readOnly: false,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Phone Number',
                    style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KFillPhone(
                    controller: phone,
                    hintText: 'Enter your phone number here...',
                    label: '',
                    readOnly: false,
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.1),
              Consumer(
                builder: (context, ref, _) {
                  final editProfileState = ref.watch(profileProvider);
                  return KButton(
                    title: editProfileState is LoadingState
                        ? 'Please wait...'
                        : 'Edit Profile',
                    onTap: () {
                      if (editProfileState is! LoadingState) {
                          ref.read(profileProvider.notifier).editProfile(
                            name: name.text,
                            email: email.text,
                            contact: phone.text,
                            address: address.text,
                            zoneId: "",
                          );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              KBorderButton(
                title: 'Go Back',
                onTap: () {
                  Navigator.pop(context);
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
