import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class KDropdown extends StatefulWidget {
  final String? hint;

  const KDropdown({this.hint, Key? key}) : super(key: key);

  @override
  State<KDropdown> createState() => _KDropdownState();
}

class _KDropdownState extends State<KDropdown> {
  final List<String> _reason = ['sick', 'casual', 'half day']; // Option 2
  String? _selectedReason;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: KColor.searchColor.withOpacity(0.8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            '${widget.hint}',
            style: KTextStyle.subtitle3.copyWith(
              color: KColor.blackbg.withOpacity(0.4),
            ),
          ),
          dropdownColor: KColor.appBackground,
          value: _selectedReason,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: KColor.blackbg,
          ),
          iconSize: 16,
          onChanged: (newValue) {
            setState(() {
              _selectedReason = newValue as String?;
            });
          },
          items: _reason.map(
            (location) {
              return DropdownMenuItem(
                value: location,
                child: Text(
                  location,
                  style: KTextStyle.subtitle3.copyWith(
                    color: KColor.blackbg.withOpacity(0.4),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
