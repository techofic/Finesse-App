import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({Key? key}) : super(key: key);

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  List<Color> colors = [
    KColor.baseBlack,
    KColor.filterColorOne,
    KColor.filterColorTwo,
    KColor.baseBlack,
    KColor.filterColorOne,
    KColor.filterColorTwo,
    KColor.baseBlack,
    KColor.filterColorOne,
    KColor.filterColorTwo,
    KColor.filterColorTwo,
  ];
  int selectColor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: context.screenWidth,
          height: 150,
          child: GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 5 / 4,
            ),
            itemCount: colors.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectColor = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceInOut,
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectColor == index
                          ? KColor.borderColor
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle,
                      ),
                      child: selectColor == index
                          ? Center(
                              child: SvgPicture.asset(
                                'assets/images/right.svg',
                              ),
                            )
                          : Container(),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
