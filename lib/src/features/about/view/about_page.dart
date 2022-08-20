import 'package:finesse/components/appbar/appbar.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:finesse/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.appBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KappBar(checkTitle: true, title: 'About Us'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our History',
                  style: KTextStyle.headline2.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices adipiscing sit integer ornare cras massa nulla.',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ),
                Text(
                  'Privacy Policy',
                  style: KTextStyle.headline2.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices adipiscing sit integer ornare cras massa nulla.',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ),
                Text(
                  'Our Shops',
                  style: KTextStyle.headline2.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices adipiscing sit integer ornare cras massa nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices adipiscing sit integer ornare cras massa nulla. ',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ),
                Text(
                  'Our Shops',
                  style: KTextStyle.headline2.copyWith(
                    color: KColor.blackbg,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices adipiscing sit integer ornare cras massa nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices adipiscing sit integer ornare cras massa nulla. ',
                    style: KTextStyle.subtitle3.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  color: KColor.baseBlack.withOpacity(0.1),
                  thickness: 1,
                ),
                Text(
                  '\u00a9 2022 Designed By Finesse',
                  style: KTextStyle.subtitle3.copyWith(
                    color: KColor.blackbg.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
