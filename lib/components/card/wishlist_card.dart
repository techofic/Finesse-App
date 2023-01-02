import 'package:cached_network_image/cached_network_image.dart';
import 'package:finesse/components/dialog/k_confirm_dialog.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

// ignore: must_be_immutable
class WishlistCard extends StatefulWidget {
  int? quantity;
  final String? img;
  final bool? isChecked;
  final String? productName;
  final String? group;
  final int? price;
  int? total;
  final VoidCallback? cancel;
  final VoidCallback? delete;
  final VoidCallback? add;

  WishlistCard({
    required this.img,
    this.quantity,
    this.isChecked,
    this.productName,
    this.group,
    this.price,
    this.cancel,
    this.delete,
    this.add,
    this.total,
    Key? key,
  }) : super(key: key);

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      dragStartBehavior: DragStartBehavior.start,
      movementDuration: const Duration(milliseconds: 200),
      resizeDuration: const Duration(milliseconds: 1000),
      onDismissed: (direction) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return KConfirmDialog(
              message: 'Delete product',
              subMessage: 'Are you sure you want to delete this product?',
              onCancel: widget.cancel,
              onDelete: widget.delete,
            );
          },
        );
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          color: KColor.deleteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/Delete.png',
              height: 23,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      child: Stack(
        children: [
          Container(
            //padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 15),
            height: 123,
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
                SizedBox(
                  height: 123,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: '${widget.img}',
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                '${widget.productName}',
                                style: KTextStyle.bodyText1.copyWith(
                                  color: KColor.blackbg,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${widget.group}',
                              style: KTextStyle.caption1.copyWith(
                                color: KColor.blackbg.withOpacity(0.3),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$${widget.price.toString()}",
                              style: KTextStyle.subtitle1.copyWith(
                                color: KColor.blackbg,
                              ),
                            ),
                            widget.isChecked == true ? SizedBox(width: context.screenWidth * 0.32) : SizedBox(width: context.screenWidth * 0.14),
                            widget.isChecked == true
                                ? InkWell(
                                    onTap: widget.add,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: KColor.baseBlack,
                                      child: SvgPicture.asset(
                                        'assets/images/trolly.svg',
                                        color: Colors.white,
                                        height: 19,
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          setState(() {
                                            widget.quantity = (widget.quantity! + 1);
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: KColor.blackbg,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 10,
                                              color: KColor.blackbg,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        child: Text(
                                          widget.quantity.toString(),
                                          style: KTextStyle.headline4.copyWith(
                                            color: KColor.blackbg,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          setState(() {
                                            widget.quantity = (widget.quantity! - 1);
                                            if (widget.quantity! < 0) {
                                              widget.quantity = 0;
                                            }
                                          });
                                          // ref.read(cartProvider.notifier).up;
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: KColor.blackbg, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 10,
                                              color: KColor.blackbg,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
