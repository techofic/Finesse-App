import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatefulWidget {
  final String? img;
  final String? price;
  const RecommendCard({this.img, this.price, Key? key}) : super(key: key);

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 113,
          margin: const EdgeInsets.only(right: 20, left: 8, top: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: KColor.appBackground,
            boxShadow: [
              BoxShadow(
                color: KColor.shadowColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(4, 4), // changes position of shadow
              ),
              BoxShadow(
                color: KColor.shadowColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(-4, -4), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network('${widget.img}', height: 113, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 6),
          child: Text(
            '৳${widget.price}',
            style: KTextStyle.bodyText2.copyWith(color: KColor.blackbg),
          ),
        ),
      ],
    );
  }
}
