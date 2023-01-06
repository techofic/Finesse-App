import 'package:finesse/src/features/about/view/about_page.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/src/features/auth/login/view/otp_page.dart';
import 'package:finesse/src/features/auth/resetpassword/view/confirm_password.dart';
import 'package:finesse/src/features/auth/resetpassword/view/reset_password_page.dart';
import 'package:finesse/src/features/auth/resetpassword/view/send_code.dart';
import 'package:finesse/src/features/auth/signup/view/signup_page.dart';
import 'package:finesse/src/features/cart/view/cart_page.dart';
import 'package:finesse/src/features/category/category_page.dart';
import 'package:finesse/src/features/category/men_categories.dart';
import 'package:finesse/src/features/checkout/components/add_new_address.dart';
import 'package:finesse/src/features/checkout/components/confirm_order.dart';
import 'package:finesse/src/features/checkout/components/payment_page.dart';
import 'package:finesse/src/features/checkout/components/preview_page.dart';
import 'package:finesse/src/features/checkout/components/take_address.dart';
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
import 'package:finesse/src/features/profile/components/notifications.dart';
import 'package:finesse/src/features/profile/components/order_details.dart';
import 'package:finesse/src/features/profile/components/report_issue.dart';
import 'package:finesse/src/features/profile/components/report_list.dart';
import 'package:finesse/src/features/profile/components/track_order.dart';
import 'package:finesse/src/features/profile/components/write_review.dart';
import 'package:finesse/src/features/profile/view/profile_page.dart';
import 'package:finesse/src/features/settings/view/settings_page.dart';
import 'package:finesse/src/features/wishlist/view/wishlist_page.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/login':
        return CupertinoPageRoute(
          builder: (_) => const LoginPage(),
        );
      case '/otp':
        return CupertinoPageRoute(
          builder: (_) => OtpPage(
            phoneNumber: arguments!['phoneNumber'],
            password: arguments['password'],
          ),
        );
      case '/signup':
        return CupertinoPageRoute(
          builder: (_) => const SignupPage(),
        );
      case '/home':
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/cart':
        return CupertinoPageRoute(
          builder: (_) => const CartPage(),
        );
      case '/shop':
        return CupertinoPageRoute(
          builder: (_) => const ShopPage(),
        );
      case '/mainScreen':
        return CupertinoPageRoute(
          builder: (_) => const MainScreen(),
        );
      case '/resetPassword':
        return CupertinoPageRoute(
          builder: (_) => const ResetPasswordPage(),
        );
      case '/setOtp':
        return CupertinoPageRoute(
          builder: (_) => SendCode(
            phoneNumber: arguments!['phoneNumber'],
          ),
        );
      case '/confirmPassword':
        return CupertinoPageRoute(
          builder: (_) => ConfirmPasswordPage(
            token: arguments!['token'],
            phoneNumber: arguments['phoneNumber'],
          ),
        );
      case '/notification':
        return CupertinoPageRoute(
          builder: (_) => const NotificationPage(),
        );
      case '/category':
        return CupertinoPageRoute(
          builder: (_) => const CategoryPage(),
        );
      case '/menCategories':
        return CupertinoPageRoute(
          builder: (_) => const MenSection(),
        );
      case '/productDetails':
        return CupertinoPageRoute(
          builder: (_) => ProductDetails(
            productName: arguments!['productName'],
            productGroup: arguments['productGroup'],
            price: arguments['price'],
            description: arguments['description'],
            id: arguments['id'],
          ),
        );
      // case '/productInfo':
      //   return CupertinoPageRoute(
      //     builder: (_) => ProductDetails(
      //       productName: arguments!['productName'],
      //       productGroup: arguments['productGroup'],
      //       price: arguments['price'],
      //       description: arguments['description'],
      //     ),
      //   );
      // case '/productDescription':
      //   return CupertinoPageRoute(
      //     builder: (_) => ProductDetails(
      //       productName: arguments!['productName'],
      //       productGroup: arguments['productGroup'],
      //       price: arguments['price'],
      //       description: arguments['description'],
      //     ),
      //   );
      case '/profile':
        return CupertinoPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case '/dashboard':
        return CupertinoPageRoute(
          builder: (_) => const Dashboard(),
        );
      case '/myOrder':
        return CupertinoPageRoute(
          builder: (_) => const MyOrder(),
        );
      case '/orderDetails':
        return CupertinoPageRoute(
          builder: (_) => const OrderDetails(),
        );
      case '/writeReview':
        return CupertinoPageRoute(
          builder: (_) => const WriteReview(),
        );
      case '/trackOrder':
        return CupertinoPageRoute(
          builder: (_) => const TrackOrder(),
        );
      case '/notifications':
        return CupertinoPageRoute(
          builder: (_) => const Notifications(),
        );
      case '/addressInfo':
        return CupertinoPageRoute(
          builder: (_) => const AddressInfo(),
        );
      case '/accountDetails':
        return CupertinoPageRoute(
          builder: (_) => const AccountDetails(),
        );
      case '/changePassword':
        return CupertinoPageRoute(
          builder: (_) => const ChangePassword(),
        );
      case '/editProfile':
        return CupertinoPageRoute(
          builder: (_) => const EditProfile(),
        );
      case '/reportIssue':
        return CupertinoPageRoute(
          builder: (_) => const ReportIssue(),
        );
      case '/reportList':
        return CupertinoPageRoute(
          builder: (_) => const ReportList(),
        );
      case '/wishlist':
        return CupertinoPageRoute(
          builder: (_) => const WishlistPage(),
        );
      case '/checkout':
        return CupertinoPageRoute(
          builder: (_) => const CheckoutPage(),
        );
      case '/payment':
        return CupertinoPageRoute(
          builder: (_) => const PaymentPage(),
        );
      case '/preview':
        return CupertinoPageRoute(
          builder: (_) => const PreviewPage(),
        );
      case '/confirmOrder':
        return CupertinoPageRoute(
          builder: (_) => const ConfirmOrder(),
        );
      case '/checkoutNewAddress':
        return CupertinoPageRoute(
          builder: (_) => const AddNewAddress(),
        );
      case '/about':
        return CupertinoPageRoute(
          builder: (_) => const AboutPage(),
        );
      case '/contact':
        return CupertinoPageRoute(
          builder: (_) => const ContactPage(),
        );
      case '/settings':
        return CupertinoPageRoute(
          builder: (_) => const SettingPage(),
        );
      case '/addAddress':
        return CupertinoPageRoute(
          builder: (_) => const AddressPage(),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
