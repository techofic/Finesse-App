import 'package:finesse/components/checkedbutton/k_checked_buttton.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCategory extends StatefulWidget {
  const PaymentCategory({Key? key}) : super(key: key);

  @override
  State<PaymentCategory> createState() => _PaymentCategoryState();
}

class _PaymentCategoryState extends State<PaymentCategory> {
  List<String> payment = [
    "PayPal",
    "Visa Card",
    "Master Card",
    "bKash",
    "Cash On Delivery",
  ];
  List<dynamic> paymentIcons = [
    AssetPath.visa,
    AssetPath.visa,
    AssetPath.masterCard,
    AssetPath.bKash,
    AssetPath.cashOnDelivery,
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: payment.length,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: KColor.filterDividerColor,
              border: Border.all(
                color: index == selectedIndex ? KColor.baseBlack : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const KCheckedButton(
                          width: 20,
                          height: 20,
                          radius: 5,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          payment[index],
                          style: KTextStyle.bodyText2.copyWith(
                            color: KColor.baseBlack,
                          ),
                        ),
                      ],
                    ),
                    index == 0
                        ? SvgPicture.asset(AssetPath.editIcon)
                        : Image.asset(
                            paymentIcons[index],
                            height: 30,
                          ),
                  ],
                ),
                if (index == 0) const SizedBox(height: 18),
                if (index == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paypal Email',
                            style: KTextStyle.bodyText1.copyWith(
                              color: KColor.blackbg.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            'mari12346@gmail.com',
                            style: KTextStyle.bodyText1.copyWith(
                              color: KColor.blackbg.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AssetPath.paypal,
                        height: 32,
                      )
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
