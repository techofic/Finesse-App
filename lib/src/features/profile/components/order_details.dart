import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Order Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ID: #99045677 ",
                style: KTextStyle.headline4.copyWith(
                  color: KColor.blackbg,
                ),
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  Text(
                    "Placed on : ",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  Text(
                    "6 May",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Billing Information",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Mariam Crane",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "+97 4556 7681",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "House No 8, Lane 5, St John Hill City, Toronto",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping Information",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Mariam Crane",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "+97 4556 7681",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "House No 8, Lane 5, St John Hill City, Toronto",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Method",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/success.svg', height: 18),
                          const SizedBox(width: 3),
                          Text(
                            "Payment made via Paypal",
                            style: KTextStyle.subtitle3.copyWith(
                              color: KColor.blackbg.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/logo_paypal.png',height: 24)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Status",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Delivered",
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.selectColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Info",
                    style: KTextStyle.subtitle1.copyWith(
                      color: KColor.blackbg,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                        Image.asset(
                          'assets/images/watch-two.png',
                          height: 49,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hanging Clock',
                              style: KTextStyle.subtitle4
                                  .copyWith(color: KColor.blackbg,
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
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    '\$269.4',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Fee',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    '\$269.4',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: KColor.dividerColor.withOpacity(0.2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    '\$269.4',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.05),
              KButton(
                title: 'Write a Review',
                onTap: () {
                  Navigator.pushNamed(context, '/writeReview');
                },
              ),
              const SizedBox(height: 16),
              KBorderButton(
                title: 'Track Order',
                onTap: () {
                  Navigator.pushNamed(context, '/trackOrder');
                },
              ),

              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
