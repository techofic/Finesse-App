import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KAppBar extends StatelessWidget {
  final String? title;
  final String? productCount;
  final bool? checkTitle;
  final bool? dotCheck;
  final bool? checkProductDetails;
  final VoidCallback? onTap;
  final VoidCallback? tap;

  const KAppBar({this.title, this.checkTitle, Key? key, this.dotCheck, this.onTap, this.checkProductDetails, this.tap, this.productCount})
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
              style: dotCheck == true ? KTextStyle.subtitle1.copyWith(color: KColor.blackbg) : KTextStyle.subtitle7.copyWith(color: KColor.blackbg),
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
                  style: KTextStyle.bodyText1.copyWith(
                    color: KColor.blackbg.withOpacity(0.7),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Clear all',
                  style: KTextStyle.bodyText1.copyWith(
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
