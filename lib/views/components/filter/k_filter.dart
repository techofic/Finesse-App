import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/k_colors.dart';
import '../textfield/k_search_field.dart';

class KFilter extends StatefulWidget {
  const KFilter({Key? key}) : super(key: key);

  @override
  State<KFilter> createState() => _KFilterState();
}

class _KFilterState extends State<KFilter> {
  TextEditingController controller = TextEditingController();

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
            lable: 'Search',
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              color: KColor.searchColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: SvgPicture.asset('assets/images/searchIcon.svg'),
          ),
        )
      ],
    );
  }
}
