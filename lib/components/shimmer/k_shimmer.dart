import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KShimmer extends StatelessWidget {
  final double? shimmerHeight;

  const KShimmer({
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
        child: Container(
          height: shimmerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
