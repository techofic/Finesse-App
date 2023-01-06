import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Rating extends StatefulWidget {
  final Function()? onRatingUpdate;
  final double initialRating, starHeight;

  const Rating({Key? key, this.initialRating = 0.0, this.starHeight = 20, this.onRatingUpdate}) : super(key: key);

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
          initialRating: widget.initialRating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          unratedColor: KColor.filterDividerColor,
          // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (ctx, index) => SvgPicture.asset(AssetPath.startIcon, height: widget.starHeight, color: KColor.rattingColor),
          onRatingUpdate: (rating) {
            widget.onRatingUpdate!();
          },
        ),
        // const Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10.0),
        //   child: Divider(color: KColor.filterDividerColor),
        // ),
      ],
    );
  }
}
