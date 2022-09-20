import 'package:finesse/src/features/about/view/about_page.dart';
import 'package:finesse/src/features/auth/login/view/otp_page.dart';
import 'package:finesse/src/features/auth/resetpassword/view/confirm_password.dart';
import 'package:finesse/src/features/auth/resetpassword/view/reset_password_page.dart';
import 'package:finesse/src/features/auth/resetpassword/view/send_code.dart';
import 'package:finesse/src/features/auth/signup/view/signup_page.dart';
import 'package:finesse/src/features/category/category_page.dart';
import 'package:finesse/src/features/category/men_categories.dart';
import 'package:finesse/src/features/checkout/components/add_new_address.dart';
import 'package:finesse/src/features/checkout/components/confirm_order.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/src/features/checkout/components/preview_page.dart';
import 'package:finesse/src/features/checkout/view/checkout_page.dart';
import 'package:finesse/src/features/contact/view/contact_page.dart';
import 'package:finesse/src/features/home/components/shop_page.dart';
import 'package:finesse/src/features/home/views/home_page.dart';
import 'package:finesse/src/features/main_screen.dart';
import 'package:finesse/src/features/notification/view/notification_page.dart';
import 'package:finesse/src/features/product_details/view/product_details.dart';
import 'package:finesse/src/features/profile/components/account_details.dart';
import 'package:finesse/src/features/profile/components/address.dart';
import 'package:finesse/src/features/profile/components/change_password.dart';
import 'package:finesse/src/features/profile/components/dashboard.dart';
import 'package:finesse/src/features/profile/components/edit_profile.dart';
import 'package:finesse/src/features/profile/components/my_order.dart';
import 'package:finesse/src/features/profile/components/order_details.dart';
import 'package:finesse/src/features/profile/components/report_issue.dart';
import 'package:finesse/src/features/profile/components/report_list.dart';
import 'package:finesse/src/features/profile/components/track_order.dart';
import 'package:finesse/src/features/profile/components/write_review.dart';
import 'package:finesse/src/features/settings/view/settings_page.dart';
import 'package:finesse/src/features/wishlist/view/wishlist_page.dart';
import 'package:flutter/material.dart';

import '../src/features/auth/login/view/login_page.dart';
import '../src/features/profile/components/notifications.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case '/otp':
        return MaterialPageRoute(
          builder: (_) => OtpPage(
            phoneNumber: arguments!['phoneNumber'],
            password: arguments['password'],
          ),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignupPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/shop':
        return MaterialPageRoute(
          builder: (_) => const ShopPage(),
        );
      case '/mainScreen':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case '/resetPassword':
        return MaterialPageRoute(
          builder: (_) => ResetPasswordPage(),
        );
      case '/setOtp':
        return MaterialPageRoute(
          builder: (_) => SendCode(
            phoneNumber: arguments!['phoneNumber'],
          ),
        );
      case '/confirmPassword':
        return MaterialPageRoute(
          builder: (_) => ConfirmPasswordPage(
            token: arguments!['token'],
            phoneNumber: arguments['phoneNumber'],
          ),
        );
      case '/notification':
        return MaterialPageRoute(
          builder: (_) => const NotificationPage(),
        );
      case '/category':
        return MaterialPageRoute(
          builder: (_) => const CategoryPage(),
        );
      case '/menCategories':
        return MaterialPageRoute(
          builder: (_) => const MenSection(),
        );
      case '/productDetails':
        return MaterialPageRoute(
          builder: (_) => ProductDetails(
            productName: arguments!['productName'],
            productGroup: arguments['productGroup'],
            price: arguments['price'],
            description: arguments['description'],
            id: arguments['id'],
          ),
        );
      // case '/productInfo':
      //   return MaterialPageRoute(
      //     builder: (_) => ProductDetails(
      //       productName: arguments!['productName'],
      //       productGroup: arguments['productGroup'],
      //       price: arguments['price'],
      //       description: arguments['description'],
      //     ),
      //   );
      // case '/productDescription':
      //   return MaterialPageRoute(
      //     builder: (_) => ProductDetails(
      //       productName: arguments!['productName'],
      //       productGroup: arguments['productGroup'],
      //       price: arguments['price'],
      //       description: arguments['description'],
      //     ),
      //   );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => const Dashboard(),
        );
      case '/myOrder':
        return MaterialPageRoute(
          builder: (_) => const MyOrder(),
        );
      case '/orderDetails':
        return MaterialPageRoute(
          builder: (_) => const OrderDetails(),
        );
      case '/writeReview':
        return MaterialPageRoute(
          builder: (_) => WriteReview(),
        );
      case '/trackOrder':
        return MaterialPageRoute(
          builder: (_) => const TrackOrder(),
        );
      case '/notifications':
        return MaterialPageRoute(
          builder: (_) => const Notifications(),
        );
      case '/addressInfo':
        return MaterialPageRoute(
          builder: (_) => const AddressInfo(),
        );
      case '/accountDetails':
        return MaterialPageRoute(
          builder: (_) => const AccountDetails(),
        );
      case '/changePassword':
        return MaterialPageRoute(
          builder: (_) => const ChangePassword(),
        );
      case '/editProfile':
        return MaterialPageRoute(
          builder: (_) => const EditProfile(),
        );
      case '/reportIssue':
        return MaterialPageRoute(
          builder: (_) => const ReportIssue(),
        );
      case '/reportList':
        return MaterialPageRoute(
          builder: (_) => const ReportList(),
        );
      case '/wishlist':
        return MaterialPageRoute(
          builder: (_) => const WishlistPage(),
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
        );
      case '/payment':
        return MaterialPageRoute(
          builder: (_) => const PaymentPage(),
        );
      case '/preview':
        return MaterialPageRoute(
          builder: (_) => const PreviewPage(),
        );
      case '/confirmOrder':
        return MaterialPageRoute(
          builder: (_) => const ConfirmOrder(),
        );
      case '/checkoutNewAddress':
        return MaterialPageRoute(
          builder: (_) => const AddNewAddress(),
        );
      case '/about':
        return MaterialPageRoute(
          builder: (_) => const AboutPage(),
        );
      case '/contact':
        return MaterialPageRoute(
          builder: (_) => const ContactPage(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
