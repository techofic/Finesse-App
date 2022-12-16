import 'package:finesse/components/dialog/k_confirm_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class NotificationCard extends StatefulWidget {
  final String? msg;
  final String? date;
  final VoidCallback? cancel;
  final VoidCallback? delete;
  const NotificationCard({this.cancel,this.delete,Key? key, this.msg, this.date}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
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
              subMessage:
              'Are you sure you want to delete this product?',
              onCancel: widget.cancel,
              onDelete: widget.delete,
            );
          },
        );

      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        margin: const EdgeInsets.only(bottom: 8),
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
            Image.asset('assets/images/Delete.png',height: 23,),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10,bottom:8,left: 2,right: 2),
        padding: const EdgeInsets.only(left: 20),
        height: 114,
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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: KColor.cirColor.withOpacity(0.6),
              child: Image.asset(
                'assets/images/sound.png',
                height: 22,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      widget.msg.toString(),
                      style: KTextStyle.subtitle3
                          .copyWith(color: KColor.blackbg.withOpacity(0.7)),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.date.toString(),
                    style: KTextStyle.subtitle5
                        .copyWith(color: KColor.blackbg.withOpacity(0.3)),
                  )
                ],
              ),
            ),
            //const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
