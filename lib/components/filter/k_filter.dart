import 'package:finesse/src/features/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_colors.dart';
import '../textfield/k_search_field.dart';

class KFilter extends StatefulWidget {
  final bool? check;

  const KFilter({this.check, Key? key}) : super(key: key);

  @override
  State<KFilter> createState() => _KFilterState();
}

class _KFilterState extends State<KFilter> {
  TextEditingController controller = TextEditingController();
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        InkWell(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return const FilterPage();
            //   },
            // );

            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              context: context,
              isScrollControlled: true,
              builder: (context) => const FilterPage(),
            );
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: KColor.searchColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: isChecked
                  ? SvgPicture.asset('assets/images/searchIcon.svg')
                  : Image.asset('assets/images/filter.png'),
            ),
          ),
        )
      ],
    );
  }
}
