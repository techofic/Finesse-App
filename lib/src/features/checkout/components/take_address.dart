import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/components/button/k_button.dart';
import 'package:finesse/constants/asset_path.dart';
import 'package:finesse/src/features/auth/login/controller/login_controller.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';
import 'package:finesse/src/features/auth/login/state/login_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/appbar/appbar.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,ref,_){
      final userState = ref.watch(loginProvider);
      final User? userData = userState is LoginSuccessState?
      userState.userModel: null;

      return Scaffold(
        backgroundColor: KColor.appBackground,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: KappBar(checkTitle: true, title: 'Checkout'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/images/stepper_one.svg'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Delivery Address',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
                  ),
                  Container(
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
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                'Default',
                                style: KTextStyle.subtitle8.copyWith(
                                  color: KColor.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          userData?.customer.address ?? "Not set yet",
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
                            style: KTextStyle.subtitle3.copyWith(
                              color: KColor.blackbg.withOpacity(0.6),
                            ),
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
                  Navigator.pushNamed(context, '/payment');
                },
              ),
              KBorderButton(
                title: 'Go Back',
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      );
    },);
  }
}
