import 'package:finesse/components/card/wishlist_card.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<String> watchName = [
    'Hanging Clock',
    'Atomic Clock',
    'Mechanical Clock',
    'Spring-Driven Clock',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: watchName.length,
            itemBuilder: (ctx, index) {
              return WishlistCard(
                isChecked: true,
                productName: watchName[index],
                cancel: (){
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                delete: (){
                  setState(() {
                    watchName.removeAt(index);
                    Navigator.pop(context);
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
