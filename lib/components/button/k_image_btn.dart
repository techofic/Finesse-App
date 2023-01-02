import 'dart:io';

import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class KImageButton extends StatelessWidget {
  final VoidCallback? camera;
  final VoidCallback? gallery;
  final File? img;
  final bool check = false;

  const KImageButton({this.camera, this.gallery, required this.img, required bool check, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              SizedBox(
                height: 120,
                width: context.screenWidth,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Image',
                        style: KTextStyle.subtitle2,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: KColor.timeGreyText.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: camera,
                              icon: Icon(
                                Icons.camera_alt_sharp,
                                color: KColor.blackbg.withOpacity(0.5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: KColor.timeGreyText.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () => gallery,
                              icon: Icon(
                                Icons.image_outlined,
                                color: KColor.blackbg.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      child: Container(
        width: context.screenWidth,
        height: 175,
        decoration: BoxDecoration(
          color: KColor.searchColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: check
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/upload.png', height: 24),
                  const SizedBox(height: 8),
                  Text(
                    'Click or drag files here to upload',
                    style: KTextStyle.bodyText1.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ],
              )
            : Image.file(img!),
      ),
    );
  }
}
