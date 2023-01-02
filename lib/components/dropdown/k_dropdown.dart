import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KDropdown extends StatefulWidget {
  final String? hint;
  final int? id;
  String? selectedReason;
  final Function(String value)? change;
  final List<dynamic> data;

  KDropdown({
    this.hint,
    Key? key,
    required this.data,
    this.selectedReason,
    this.change,
    this.id,
  }) : super(key: key);

  @override
  State<KDropdown> createState() => _KDropdownState();
}

class _KDropdownState extends State<KDropdown> {
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
          child: DropdownButton(
            isExpanded: true,
            hint: Text(
              '${widget.hint}',
              style: KTextStyle.bodyText1.copyWith(
                color: KColor.blackbg.withOpacity(0.4),
              ),
            ),
            dropdownColor: KColor.appBackground,
            menuMaxHeight: context.screenHeight * 0.5,
            alignment: AlignmentDirectional.bottomStart,
            value: widget.selectedReason,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: KColor.blackbg,
            ),
            iconSize: 16,
            onChanged: (val) {
              if (widget.change != null) widget.change!(val as String);
            },
            // onChanged: (newValue) {
            //   setState(() {
            //     widget.selectedReason = newValue as String?;
            //     print('selected item : ${widget.selectedReason}');
            //   });
            // },
            items: widget.data.map(
              (location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(
                    location,
                    style: KTextStyle.bodyText1.copyWith(
                      color: KColor.blackbg.withOpacity(0.4),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
