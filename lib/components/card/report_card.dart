import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatefulWidget {
  final String? id;
  final String? date;
  final String? reason;
  final String? img;

  const ReportCard({this.id, this.date, this.reason, this.img, Key? key}) : super(key: key);

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      //width: context.screenWidth * 0.9,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ID: ${widget.id} ",
            style: KTextStyle.subtitle1.copyWith(
              color: KColor.blackbg,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Placed on ${widget.date}",
            style: KTextStyle.bodyText1.copyWith(
              color: KColor.blackbg.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "Reason: ",
                style: KTextStyle.bodyText2.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              Text(
                "${widget.reason}",
                style: KTextStyle.bodyText2.copyWith(
                  color: KColor.deleteColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            width: context.screenWidth * 0.9,
            height: 81,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  widget.img.toString(),
                  height: 49,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hanging Clock',
                      style: KTextStyle.bodyText2.copyWith(
                        color: KColor.blackbg,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$44.90",
                          style: KTextStyle.subtitle1.copyWith(
                            color: KColor.blackbg,
                          ),
                        ),
                        SizedBox(width: context.screenWidth * 0.35),
                        Text(
                          "(x2)",
                          style: KTextStyle.description.copyWith(
                            color: KColor.baseBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
