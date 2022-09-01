import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Ratings & Reviews ',
                    style:
                        KTextStyle.subtitle7.copyWith(color: KColor.baseBlack),
                  ),
                  TextSpan(
                    text: '(230)',
                    style: KTextStyle.subtitle7.copyWith(
                      color: KColor.baseBlack.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'View all',
              style: KTextStyle.subtitle6.copyWith(
                color: KColor.baseBlack.withOpacity(0.3),
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        _buildReviews('Johnathan Cole'),
        _buildReviews('Lynn Gutierrez'),
        _buildReviews('Rosalie Frazier'),
        _buildReviews('Emmett Mcbride'),
      ],
    );
  }

  Column _buildReviews(name) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: name,
                    style: KTextStyle.subtitle4.copyWith(
                      color: KColor.baseBlack.withOpacity(0.8),
                    ),
                  ),
                  TextSpan(
                    text: '  12 May 2022',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.baseBlack.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(AssetPath.ratingIcon),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipi scing elit. Ultrices adipiscing sit integer ornare.',
          style: KTextStyle.description.copyWith(
            color: KColor.blackbg.withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(
            color: KColor.dividerColor.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
