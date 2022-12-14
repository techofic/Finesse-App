import 'package:finesse/components/button/k_text_button.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/cart/components/cart_total.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../components/appbar/k_app_bar.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(checkTitle: true, title: 'Checkout'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/stepper_three.svg'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: KColor.filterDividerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Info',
                            style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                          ),
                          SvgPicture.asset(AssetPath.editIcon),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hanging Clock (x2)',
                            style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                          ),
                          Text(
                            '\$44.90',
                            style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hanging Clock (x2)',
                            style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                          ),
                          Text(
                            '\$44.90',
                            style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: KColor.filterDividerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping Address',
                                style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                              ),
                              SvgPicture.asset(AssetPath.editIcon),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Mariam Crane',
                            style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            'Mariam Crane',
                            style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Payment',
                        style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Mariam Crane',
                        style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Mariam Crane',
                        style: KTextStyle.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
                CardTotal(),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.03),
            KTextButton(
              title: 'Place Order',
              price: '\$281.8',
              onTap: () {
                Navigator.pushNamed(context, '/confirmOrder');
              },
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
