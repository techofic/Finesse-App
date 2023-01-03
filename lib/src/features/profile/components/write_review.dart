import 'dart:io';

import 'package:finesse/components/appbar/k_app_bar.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/card/review_card.dart';
import 'package:finesse/components/dialog/k_dialog.dart';
import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/components/textfield/k_description_field.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_divider/text_divider.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  TextEditingController message = TextEditingController();
  String? _selectedReason;
  var rating = 0.0;
  int selectIndex = 0;
  int selectedRatting = 0;
  int maxLength = 200;
  File? image;
  File? video;

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

  Future pickVideo(ImageSource source) async {
    try {
      final video = await ImagePicker().pickVideo(source: source, maxDuration: const Duration(seconds: 10));
      if (video == null) return;
      final imageTemporary = File(video.path);
      setState(() {
        this.video = imageTemporary;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(checkTitle: true, title: 'Write Review'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReviewCard(),
              SizedBox(height: context.screenHeight * 0.05),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How much did you like the product?',
                      style: KTextStyle.subtitle1.copyWith(
                        color: KColor.blackbg,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 12),
                      child: RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        unratedColor: KColor.filterDividerColor,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, index) => SvgPicture.asset(
                          AssetPath.startIcon,
                          height: 40,
                          color: KColor.rattingColor,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                    ),
                    Text(
                      'Great!',
                      style: KTextStyle.bodyText1.copyWith(
                        color: KColor.blackbg.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.screenHeight * 0.04),
              Text(
                'Share your experience',
                style: KTextStyle.subtitle1.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 16),
              KDropdown(
                hint: 'The product was awesome!',
                selectedReason: _selectedReason,
                change: (e) {},
                data: const [],
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextDivider.horizontal(
                  color: KColor.blackbg.withOpacity(0.2),
                  thickness: 1,
                  text: Text(
                    'or',
                    style: KTextStyle.bodyText1.copyWith(
                      color: KColor.blackbg.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Write a review',
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  Text(
                    '(${message.text.length}/$maxLength)',
                    style: KTextStyle.bodyText1.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DescriptionTextField(
                controller: message,
                readOnly: false,
                checkColor: false,
                hintText: 'Write here...',
                label: '',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  InkWell(
                    onTap: () => pickImage(ImageSource.camera),
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: KColor.searchColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(AssetPath.cameraIcon),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () => pickVideo(ImageSource.camera),
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: KColor.searchColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(AssetPath.recordIcon),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.05),
              KButton(
                title: 'Submit Review',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const KDialog(
                        message: 'Review Submitted!',
                        checkTitle: true,
                        subMessage: 'Thank you for your review.',
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
