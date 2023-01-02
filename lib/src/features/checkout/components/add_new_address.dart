import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/src/features/checkout/components/add_home.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  List<String> items = [
    "Home",
    "Office",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(checkTitle: true, title: 'Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a Label',
                style: KTextStyle.subtitle1.copyWith(color: KColor.blackbg),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(right: 16),
                                width: 111,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: index == currentIndex ? KColor.blackbg.withOpacity(0.8) : KColor.searchColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: KTextStyle.bodyText1.copyWith(
                                      color: index == currentIndex ? KColor.whiteBackground : KColor.blackbg.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  /// MAIN BODY
                  if (currentIndex == 0) const AddHome(),
                  //if (currentIndex == 1) const AddOffice(),
                  if (currentIndex == 1) const AddHome(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
