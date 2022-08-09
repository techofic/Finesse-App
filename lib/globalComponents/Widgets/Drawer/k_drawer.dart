import 'package:finesse/constants/color/app_color.dart';
import 'package:finesse/globalComponents/Style/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blackbg,
      padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 30),
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
                    style: KTextStyle.headline1.copyWith(color: whiteBg),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Home',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/menCategories');
                  },
                  child: Text(
                    'Men',
                    style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Women',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
                const SizedBox(height: 16),
                Text(
                  'Kids',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
                const SizedBox(height: 16),
                Text(
                  'Contact Us',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
                const SizedBox(height: 16),
                Text(
                  'About Us',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
                const SizedBox(height: 80),
                Text(
                  'Log In',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
                const SizedBox(height: 16),
                Text(
                  'Register',
                  style: KTextStyle.subtitle1.copyWith(color: whiteBg),
                ),
              ],
            ),
            const SizedBox(height:70),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    color: whiteBg.withOpacity(0.2),
                    thickness: 1,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/phoneIcon.svg'),
                      const SizedBox(width: 10),
                      Text(
                        '+88 019 3738 48',
                        style: KTextStyle.subtitle1.copyWith(
                          color: whiteBg.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/emailIcon.svg'),
                      const SizedBox(width: 10),
                      Text(
                        'finesse330@gmail.com',
                        style: KTextStyle.subtitle1.copyWith(
                          color: whiteBg.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/facebookIcon.svg'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/instaIcon.svg'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/youtubeIcon.svg'),
                      ),
                      IconButton(
                        onPressed: () {},
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
