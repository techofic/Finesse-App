import 'package:finesse/src/features/filter/components/rating.dart';
import 'package:finesse/src/features/product_details/controller/product_details_controller.dart';
import 'package:finesse/src/features/product_details/controller/reviews_controller.dart';
import 'package:finesse/src/features/product_details/model/review_model.dart';
import 'package:finesse/src/features/product_details/state/product_details_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ProductReview extends ConsumerWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailsState = ref.watch(productDetailsProvider);
    final productDetails = productDetailsState is ProductDetailsSuccessState ? productDetailsState.productDetailsModel : null;
    final reviewsState = ref.watch(reviewsProvider);
    final List<ReviewModel>? reviewsList = reviewsState is ReviewsSuccessState ? reviewsState.reviewModel : [];

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
                    style: KTextStyle.subtitle7.copyWith(color: KColor.baseBlack),
                  ),
                  TextSpan(
                    text: '(${productDetails!.product!.reviews})',
                    style: KTextStyle.subtitle7.copyWith(
                      color: KColor.baseBlack.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   'View all',
            //   style: KTextStyle.bodyText3.copyWith(
            //     color: KColor.baseBlack.withOpacity(0.3),
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 26),
        reviewsState is ReviewsSuccessState
            ? reviewsList!.isEmpty
                ? const Center(child: Text('No reviews yet!'))
                : ListView.builder(
                    itemCount: reviewsList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: reviewsList[index].user?.name,
                                      style: KTextStyle.bodyText2.copyWith(color: KColor.baseBlack.withOpacity(0.8)),
                                    ),
                                    TextSpan(
                                      text: '  ${DateFormat('d MMM y').format(DateTime.parse(reviewsList[index].createdAt))}',
                                      style: KTextStyle.bodyText1.copyWith(color: KColor.baseBlack.withOpacity(0.4)),
                                    ),
                                  ],
                                ),
                              ),
                              IgnorePointer(
                                child: Rating(starHeight: 20, initialRating: reviewsList[index].rating!.toDouble()),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            reviewsList[index].content ?? '',
                            style: KTextStyle.description.copyWith(color: KColor.blackbg.withOpacity(0.5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Divider(color: KColor.dividerColor.withOpacity(0.1)),
                          ),
                        ],
                      );
                    },
                  )
            : const Center(child: CupertinoActivityIndicator()),
      ],
    );
  }
}
