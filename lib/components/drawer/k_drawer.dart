import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/styles/b_style.dart';
import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class KDrawer extends ConsumerWidget {
  const KDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: KColor.blackbg,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'FINESSE',
                    style: KTextStyle.headline1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/mainScreen');
                  },
                  child: Text(
                    'Home',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/shop');
                  },
                  child: Text(
                    'Men',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/shop');
                  },
                  child: Text(
                    'Women',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/shop');
                  },
                  child: Text(
                    'Kids',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  child: Text(
                    'Contact Us',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Text(
                    'About Us',
                    style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.1),
                if (!getBoolAsync(isLoggedIn))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Log In',
                          style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Register',
                          style: KTextStyle.subtitle1.copyWith(color: KColor.whiteBackground),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 70),
            Center(
              child: Column(
                children: [
                  Divider(color: KColor.whiteBackground.withOpacity(0.2), thickness: 1),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri(scheme: 'tel', path: '+8801998685230'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/phoneIcon.svg'),
                        const SizedBox(width: 10),
                        Text(
                          '01998-685230',
                          style: KTextStyle.subtitle1.copyWith(
                            color: KColor.whiteBackground.withOpacity(0.8),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri(scheme: 'mailto', path: 'finessebangladesh@gmail.com'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/emailIcon.svg'),
                        const SizedBox(width: 10),
                        Text(
                          'finessebangladesh@gmail.com',
                          style: KTextStyle.subtitle1.copyWith(
                            fontSize: 14,
                            color: KColor.whiteBackground.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          launchUrlString('https://www.facebook.com/finesselifestyleofficial');
                        },
                        icon: SvgPicture.asset('assets/images/facebookIcon.svg'),
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString('https://www.instagram.com/finesse_lifestyle_bd/');
                        },
                        icon: SvgPicture.asset('assets/images/instaIcon.svg'),
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString('https://www.youtube.com/channel/UCSUcQ8_MuhFzNh4E5BlTR-g');
                        },
                        icon: SvgPicture.asset('assets/images/youtubeIcon.svg'),
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString('https://www.tiktok.com/@finesselifestyle');
                        },
                        icon: SvgPicture.asset('assets/images/tiktokIcon.svg'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
