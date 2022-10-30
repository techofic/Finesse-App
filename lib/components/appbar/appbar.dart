import 'package:finesse/src/features/wishlist/controller/wishlist_controller.dart';
import 'package:finesse/src/features/wishlist/state/wishlist_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_path.dart';

class KappBar extends StatelessWidget {
  final String? title;
  final String? productCount;
  final bool? checkTitle;
  final bool? dotCheck;
  final bool? checkProductDetails;
  final VoidCallback? onTap;
  final VoidCallback? tap;

  const KappBar(
      {this.title,
      this.checkTitle,
      Key? key,
      this.dotCheck,
      this.onTap,
      this.checkProductDetails,
      this.tap,
      this.productCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColor.appBackground,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: checkTitle == true
          ? Text(
              '$title',
              style: dotCheck == true
                  ? KTextStyle.subtitle1.copyWith(color: KColor.blackbg)
                  : KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
            )
          : Container(),
      elevation: 0,
      leading: dotCheck == true
          ? InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: KColor.blackbg,
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: KColor.blackbg,
              ),
            ),
      actions: [
        if (dotCheck == true)
          PopupMenuButton(
            color: KColor.appBackground,
            position: PopupMenuPosition.under,
            icon: SvgPicture.asset('assets/images/pin.svg'),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text(
                  'Mark all as read',
                  style: KTextStyle.subtitle3.copyWith(
                    color: KColor.blackbg.withOpacity(0.7),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Clear all',
                  style: KTextStyle.subtitle3.copyWith(
                    color: KColor.blackbg.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
