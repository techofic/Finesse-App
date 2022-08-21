import 'package:finesse/components/card/my_order_card.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllOrder extends StatefulWidget {
  const AllOrder({Key? key}) : super(key: key);

  @override
  State<AllOrder> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                extentRatio: 0.85,
                dismissible: DismissiblePane(
                  onDismissed: () async {},
                ),
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (index) {},
                    backgroundColor: KColor.deleteColor,
                    foregroundColor: Colors.white,
                    icon: Icons.delete_outline_outlined,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  MyOrderCard(isChecked: false),
                ],
              ),
            ),
            Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                extentRatio: 0.85,
                dismissible: DismissiblePane(
                  onDismissed: () async {},
                ),
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (index) {},
                    backgroundColor: KColor.deleteColor,
                    foregroundColor: Colors.white,
                    icon: Icons.delete_outline_outlined,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  MyOrderCard(isChecked: true),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
