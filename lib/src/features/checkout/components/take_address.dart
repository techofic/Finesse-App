import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressPage extends StatefulWidget {
  final int? pageIndex;
  const AddressPage({this.pageIndex,Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Delivery Address',
                style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
              ),
              Container(
                // height: 164,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: KColor.filterDividerColor,
                  border: Border.all(color: KColor.baseBlack),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Home',
                              style: KTextStyle.subtitle4
                                  .copyWith(color: KColor.blackbg),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              alignment: Alignment.center,
                              width: context.screenWidth * 0.2,
                              height: 24,
                              decoration: BoxDecoration(
                                  color: KColor.blackbg,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'Default',
                                style: KTextStyle.subtitle8.copyWith(
                                  color: KColor.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SvgPicture.asset(AssetPath.editIcon),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Mariam Crane',
                      style: KTextStyle.subtitle3.copyWith(
                        color: KColor.blackbg.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Mariam Crane',
                      style: KTextStyle.subtitle3.copyWith(
                        color: KColor.blackbg.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/checkoutNewAddress');
                },
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: KColor.filterDividerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add new address',
                        style: KTextStyle.subtitle3
                            .copyWith(color: KColor.blackbg.withOpacity(0.6)),
                      ),
                      SvgPicture.asset(AssetPath.editIcon),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.2),
          KButton(
            title: 'Proceed to Payment',
            onTap: () {
              setState(() {
                if (widget.pageIndex == 1) const PaymentPage();
              });

              //Navigator.pushNamed(context, '/payment');
            },
          ),
          const SizedBox(height: 16),
          KBorderButton(
            title: 'Go Back',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }
}
