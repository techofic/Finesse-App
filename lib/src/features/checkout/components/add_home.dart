import 'package:finesse/components/button/k_border_btn.dart';
import 'package:finesse/src/features/profile/components/update_profile.dart';
import 'package:flutter/material.dart';

class AddHome extends StatelessWidget {
  const AddHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UpdateProfile(),
        KBorderButton(
          title: 'Set As Default',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
