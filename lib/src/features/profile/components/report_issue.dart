import 'dart:io';

import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/textfield/k_fill_name.dart';
import 'package:finesse/components/textfield/k_fill_phone.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
import 'package:finesse/src/features/profile/controller/profile_controller.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  TextEditingController reason = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController description = TextEditingController();
  File? image;
  bool _enabled = true;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final reportState = ref.watch(reportProvider);
        final userState = ref.watch(loginProvider);
        final User? userData =
            userState is LoginSuccessState ? userState.userModel : null;

        return Scaffold(
          backgroundColor: KColor.appBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: KappBar(checkTitle: true, title: 'Report Issue'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  //const KDropdown(hint: 'Select a reason'),
                  KFillNormal(
                    controller: reason,
                    readOnly: false,
                    label: '',
                    hintText: 'Reason',
                  ),
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
                  KFillNormal(
                    controller: description,
                    readOnly: false,
                    label: '',
                    hintText: 'Description',
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      pickImage(ImageSource.camera);
                    },
                    child: Container(
                      width: context.screenWidth,
                      height: 175,
                      decoration: BoxDecoration(
                        color: KColor.searchColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: image == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.cloud_upload_outlined,
                                  size: 24,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Click or drag files here to upload',
                                  style: KTextStyle.subtitle3.copyWith(
                                    color: KColor.blackbg.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            )
                          : Image.file(
                              image!,
                              height: 175,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.05),
                  KButton(
                    title: reportState is LoadingState
                        ? 'Please wait...'
                        : 'Save Changes',
                    onTap: () {
                      if (reportState is! LoadingState) {
                        ref.read(reportProvider.notifier).report(
                              description: description.text,
                              reason: reason.text,
                              orderId: id.text,
                              userId: userData!.id.toString(),
                              image: image.toString(),
                            );
                      }
                      Navigator.pushNamed(context, '/mainScreen');
                    },
                  ),

                  const SizedBox(height: 16),
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
      },
    );
  }
}
