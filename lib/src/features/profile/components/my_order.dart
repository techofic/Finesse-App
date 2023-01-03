import 'package:finesse/components/appbar/k_app_bar.dart';
import 'package:finesse/src/features/profile/components/tab/all_order.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: KColor.appBackground,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: KAppBar(checkTitle: true, title: 'My Orders'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Divider(
                    color: KColor.baseBlack.withOpacity(0.1),
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 40,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: KColor.blackbg.withOpacity(0.5),
                      labelStyle: KTextStyle.bodyText1,
                      labelColor: KColor.blackbg,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(right: 24),
                      tabs: const [
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'Order Placed',
                        ),
                        Tab(
                          text: 'Processing',
                        ),
                        Tab(
                          text: 'Shipped',
                        ),
                        Tab(
                          text: 'Delivered',
                        ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                  Divider(
                    color: KColor.baseBlack.withOpacity(0.1),
                    thickness: 1,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            const Expanded(
              child: TabBarView(
                children: [
                  AllOrder(),
                  AllOrder(),
                  AllOrder(),
                  AllOrder(),
                  AllOrder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
