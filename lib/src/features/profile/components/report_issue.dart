import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/button/k_image_btn.dart';
import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/components/textfield/k_fill_phone.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  TextEditingController id = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle:true,title: 'Report Issue'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Reason*',
                style: KTextStyle.subtitle7.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 16),
              const KDropdown(hint: 'Select a reason'),
              const SizedBox(height: 24),
              Text(
                'Order ID*',
                style: KTextStyle.subtitle7.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 16),
              KFillPhone(
                controller: id,
                readOnly: false,
                label: '',
                hintText: 'Order ID',
              ),
              const SizedBox(height: 24),
              Text(
                'Description*',
                style: KTextStyle.subtitle7.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 16),
              KFillPhone(
                controller: description,
                readOnly: false,
                label: '',
                hintText: 'Description',
              ),
              const SizedBox(height: 16),
              KImageButton(
                onTap: (){},
              ),
              SizedBox(height:context.screenHeight*0.05),
              KButton(
                title: 'Save Changes',
                onTap: () {
                  Navigator.pushNamed(context, '/checkout');
                },
              ),
              const SizedBox(height:16),
              KBorderButton(
                title: 'View Report List',
                onTap: () {
                  Navigator.pushNamed(context, '/reportList');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
