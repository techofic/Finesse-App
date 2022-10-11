import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/components/textfield/k_fill_name.dart';
import 'package:finesse/components/textfield/k_fill_phone.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class AddHome extends StatefulWidget {
  const AddHome({Key? key}) : super(key: key);

  @override
  State<AddHome> createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  String? _selectedReason;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
        ),
        const SizedBox(height: 16),
        KFillNormal(
          controller: name,
          readOnly: false,
          label: '',
          hintText: 'Full name',
        ),
        const SizedBox(height: 24),
        Text(
          'Email',
          style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
        ),
        const SizedBox(height: 16),
        KFillNormal(
          controller: email,
          readOnly: false,
          label: '',
          hintText: 'Email',
        ),
        const SizedBox(height: 24),
        Text(
          'Phone Number',
          style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
        ),
        const SizedBox(height: 16),
        KFillPhone(
          controller: phone,
          readOnly: false,
          label: '',
          hintText: 'Phone number',
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KDropdown(hint: 'City',selectedReason: _selectedReason,change: (e){}, data: [],),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Area',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KDropdown(hint: 'Area',selectedReason: _selectedReason,change: (e){}, data: [],),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Zone',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KDropdown(hint: 'Zone',selectedReason: _selectedReason,change: (e){}, data: [],),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Postal Code',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                  ),
                  const SizedBox(height: 16),
                  KFillPhone(
                    controller: postalCode,
                    readOnly: false,
                    label: '',
                    hintText: '3100',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Address',
          style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
        ),
        const SizedBox(height: 16),
        KFillNormal(
          controller: address,
          readOnly: false,
          label: '',
          hintText: 'Address',
        ),
        SizedBox(height:context.screenHeight*0.07),
        KButton(
          title: 'Save',
          onTap: () {
            Navigator.pushNamed(context, '/checkout');
          },
        ),
        const SizedBox(height:16),
        KBorderButton(
          title: 'Set As Default',
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
