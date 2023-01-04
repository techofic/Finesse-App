import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddToCart extends StatefulWidget {
  int quantity;
  final VoidCallback add;
  final VoidCallback remove;
  final VoidCallback cart;

  AddToCart({
    Key? key,
    this.quantity = 0,
    required this.cart,
    required this.add,
    required this.remove,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  //int widget.quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.12,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: widget.add,
                child: Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    border: Border.all(color: KColor.blackbg, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 16,
                      color: KColor.blackbg,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  widget.quantity.toString(),
                  style: KTextStyle.headline3.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
              ),
              InkWell(
                // When using InkWell check the spalsh effect if its radius matches the container
                borderRadius: BorderRadius.circular(15),
                onTap: widget.remove,
                child: Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    border: Border.all(color: KColor.blackbg, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 16,
                      color: KColor.blackbg,
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: widget.cart,
            child: Container(
              height: 54,
              width: context.screenWidth * 0.45,
              decoration: BoxDecoration(
                color: KColor.blackbg,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Add to cart',
                  style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
