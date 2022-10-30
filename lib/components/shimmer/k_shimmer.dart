import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KLoading extends StatelessWidget {
  final double? shimmerHeight;

  const KLoading({
    Key? key,
    this.shimmerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: shimmerHeight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade400,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return Container(
              height: shimmerHeight,
              width: context.screenWidth*0.2,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
}
