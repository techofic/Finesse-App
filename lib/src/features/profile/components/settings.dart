import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'Settings'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Column(
          children: const [
          ],
        ),
      ),
    );
  }
}
