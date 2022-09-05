import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  final String? img;
  final String? productName;
  final String? productGroup;
  final String? price;

  const WishlistPage(
      {this.img, this.productName, this.productGroup, this.price, Key? key})
      : super(key: key);

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
            child: WishlistCard(
              img: widget.img,
              isChecked: true,
              productName: widget.productName,
              cancel: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              delete: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            )),
      ),
    );
  }
}
