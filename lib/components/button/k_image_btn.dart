import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class KImageButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  const KImageButton({this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 175,
        decoration: BoxDecoration(
          color: KColor.searchColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/upload.png', height: 24),
            const SizedBox(height: 8),
            Text(
              'Click or drag files here to upload',
              style: KTextStyle.subtitle3.copyWith(
                color: KColor.blackbg.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
