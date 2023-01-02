import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/textfield/k_fill_name.dart';
import 'package:finesse/components/textfield/k_fill_phone.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
import 'package:finesse/src/features/cart/components/get_location.dart';
import 'package:finesse/src/features/profile/controller/profile_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProfile extends StatefulWidget {
  final bool? checkPage;
  const UpdateProfile({Key? key, this.checkPage}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  String? _cities;
  String? _zones;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final editProfileState = ref.watch(profileProvider);
        final userState = ref.watch(loginProvider);
        final User? userData =
            userState is LoginSuccessState ? userState.userModel : null;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _editInformation(
                  'Name',
                  KFillNormal(
                    controller: name,
                    hintText: 'Enter your name here...',
                    label: '',
                    readOnly: false,
                  ),
                ),
                _editInformation(
                  'Email',
                  KFillNormal(
                    controller: email,
                    hintText: 'Enter your email here...',
                    label: '',
                    readOnly: false,
                  ),
                ),
                _editInformation(
                  'Address',
                  KFillNormal(
                    controller: address,
                    hintText: 'Enter your address here...',
                    label: '',
                    readOnly: false,
                  ),
                ),
                _editInformation(
                  'Phone Number',
                  KFillPhone(
                    controller: phone,
                    hintText: 'Enter your phone number here...',
                    label: '',
                    readOnly: false,
                  ),
                ),
                _editInformation(
                  'City',
                  DeliveryAddress(
                    cities: _cities,
                    zones: _zones,
                    checkCities: true,
                  ),
                ),
                _editInformation(
                  'Zone',
                  DeliveryAddress(
                    cities: _cities,
                    zones: _zones,
                    checkCities: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.05),
            KButton(
              title: editProfileState is LoadingState
                  ? 'Please wait...'
                  : 'Edit Profile',
              onTap: () {
                if (editProfileState is! LoadingState) {
                  ref.read(profileProvider.notifier).editProfile(
                        id: userData!.id!,
                        name: name.text,
                        email: email.text,
                        user: userData,
                      );
                }
                Navigator.pushNamed(context, '/accountDetails');

              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Column _editInformation(String title, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
        ),
        const SizedBox(height: 16),
        field,
        const SizedBox(height: 24),
      ],
    );
  }
}
