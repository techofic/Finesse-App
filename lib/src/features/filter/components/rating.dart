import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBar.builder(
          initialRating: 2,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          unratedColor: KColor.filterDividerColor,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (ctx, index) => SvgPicture.asset(
              AssetPath.startIcon,
              height: 30,
              color:  KColor.rattingColor
          ),
          onRatingUpdate: (rating) {
            setState(() {
              //selectedRatting = rating as int;
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            color: KColor.filterDividerColor,
          ),
        ),
      ],
    );
  }
}
