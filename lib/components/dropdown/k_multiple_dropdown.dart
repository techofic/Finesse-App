import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import '../../../../styles/k_text_style.dart';

// ignore: must_be_immutable
class KMultilevelDropdown extends StatefulWidget {
  final String? hint;
  final String? checkValue;
  final int? id;
  String? changeValue;
  final Function(String value)? change;
  final List<dynamic> data;

  KMultilevelDropdown({
    Key? key,
    this.hint,
    this.id,
    this.change,
    required this.data,
    this.checkValue,
    this.changeValue,
  }) : super(key: key);

  @override
  State<KMultilevelDropdown> createState() => _KMultilevelDropdownState();
}

class _KMultilevelDropdownState extends State<KMultilevelDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: KColor.searchColor.withOpacity(0.8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 9),
          child: DropdownButton<String>(
              key: (widget.changeValue != null) ? Key(widget.changeValue!) : UniqueKey(),
              isExpanded: true,
              hint: Text(
                widget.hint.toString(),
                style: KTextStyle.bodyText1.copyWith(
                  color: KColor.blackbg.withOpacity(0.4),
                ),
              ),
              dropdownColor: KColor.appBackground,
              menuMaxHeight: context.screenHeight * 0.5,
              alignment: AlignmentDirectional.bottomStart,
              value: widget.changeValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: KColor.blackbg,
              ),
              iconSize: 16,
              onChanged: (val) {
                if (widget.change != null) widget.change!(val as String);
              },
              items: widget.data.map(
                (location) {
                  return DropdownMenuItem(
                    value: widget.checkValue,
                    child: Text(
                      location,
                      style: KTextStyle.bodyText1.copyWith(
                        color: KColor.blackbg.withOpacity(0.4),
                      ),
                    ),
                  );
                },
              ).toList()),
        ),
      ),
    );
  }
}
