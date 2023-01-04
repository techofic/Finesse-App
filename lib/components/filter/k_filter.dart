import 'package:finesse/components/textfield/k_search_field.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/home/components/shop_page.dart';
import 'package:flutter/material.dart';

class KFilter extends StatefulWidget {
  final bool? check;

  const KFilter({this.check, Key? key}) : super(key: key);

  @override
  State<KFilter> createState() => _KFilterState();
}

class _KFilterState extends State<KFilter> {
  TextEditingController controller = TextEditingController();
  bool isChecked = true;
  String? value = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: SearchTextField(
              onTap: () => Navigator.push(context, FadeRoute(page: const ShopPage())),
              controller: controller,
              readOnly: true,
              hintText: 'Search...',
            ),
          ),
        ),
        // const SizedBox(width: 10),
        // InkWell(
        //   onTap: () => Navigator.pushNamed(context, '/shop'),
        //   child: Container(
        //     height: 48,
        //     width: 48,
        //     decoration: BoxDecoration(
        //       color: KColor.searchColor.withOpacity(0.8),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Center(
        //       child: SvgPicture.asset(AssetPath.homeSearchIcon),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
