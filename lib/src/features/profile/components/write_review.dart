import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/components/dialog/k_dialog.dart';
import 'package:finesse/components/dropdown/k_dropdown.dart';
import 'package:finesse/components/textfield/k_description_field.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_divider/text_divider.dart';

class WriteReview extends StatelessWidget {
  WriteReview({Key? key}) : super(key: key);

  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Write Review'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: KColor.appBackground,
                  boxShadow: [
                    BoxShadow(
                      color: KColor.shadowColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                    BoxShadow(
                      color: KColor.shadowColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset:
                          const Offset(-4, -4), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/watch-two.png',
                      height: 49,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hanging Clock',
                          style: KTextStyle.subtitle4.copyWith(
                            color: KColor.blackbg,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$44.90",
                          style: KTextStyle.subtitle1.copyWith(
                            color: KColor.blackbg,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                      child: SvgPicture.asset('assets/images/rating.svg',
                          height: 40),
                    ),
                    Text(
                      'Great!',
                      style: KTextStyle.subtitle3.copyWith(
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
              const KDropdown(
                hint: 'The product was awesome!',
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextDivider.horizontal(
                  color: KColor.blackbg.withOpacity(0.2),
                  thickness: 1,
                  text: Text(
                    'or',
                    style: KTextStyle.subtitle3.copyWith(
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
                    '(20/200)',
                    style: KTextStyle.subtitle3.copyWith(
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
                hintText: 'Type your message here',
                label: 'Write here...',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: KColor.searchColor),
                    child: Center(
                      child: SvgPicture.asset('assets/images/camera.svg'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: KColor.searchColor),
                    child: Center(
                      child: SvgPicture.asset('assets/images/video.svg'),
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
