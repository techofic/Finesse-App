import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          //margin: const EdgeInsets.only(left: 18,right: 12,top: 12,bottom: 12),
          child: ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (ctx, index) {
              return Slidable(
                key: UniqueKey(),
                endActionPane: ActionPane(
                  extentRatio: 0.85,
                  dismissible: DismissiblePane(
                    onDismissed: () async {},
                  ),
                  motion: const ScrollMotion(),
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
                child: const WishlistCard(isChecked: true),
              );
            },
          ),
        ),
      ),
    );
  }
}
