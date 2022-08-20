import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/components/card/product_card.dart';
import 'package:finesse/components/textfield/k_search_field.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Shop'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: SearchTextField(
                        controller: controller,
                        readOnly: false,
                        hintText: 'Search...',
                        // TODO :: Check the border radius of this field in UI
                        // TODO :: No need of label here
                        lable: '',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: KColor.searchColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/filter.png',
                          height: 24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 3 / 3,
                    ),
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return const ProductCard(
                        name: 'Mens Baseball Cap',
                        genre: "Womens",
                        offerPrice: "14.90",
                        regularPrice: "",
                        discount: "",
                        check: false,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
