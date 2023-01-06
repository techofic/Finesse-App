import 'package:finesse/service/app_mode.dart';

class API {
  static const liveImage = 'http://mobileapi.scorebee.com/'; // Live Production API URL
  static const testImage = 'http://staginapi.duare.net/'; // Live Staging API URL
  static const live = 'http://mobileapi.scorebee.com/api/'; // Live Production API URL
  static const test = 'https://finesseapi.dreamsgallerybd.com/'; // Live Staging API URL
  static const base = AppMode.PRODUCTION_MODE ? live : test;
  static const baseImage = AppMode.PRODUCTION_MODE ? liveImage : testImage;

  //authentication
  static const signup = 'app/registration';
  static const login = 'app/login';
  static const logout = 'app/logout';
  static const otp = 'app/activeAccount';
  static const sendOtp = 'app/sendActivationCode';
  static const sendPhone = 'app/sendResetMessage';
  static const resetCode = 'app/sendActivationCode';
  static const resetPassword = 'app/reset-password';

  //Slider
  static const slider = 'app/allFrontSliders';

  //products category
  static const productsCategory = 'app/ladingProducts';
  static const category = 'app/allGroups';
  static const allBrand = 'app/AllBrands';

  static shop({str = "", groupId = "", categoryId = ""}) =>
      'app/shopPageData?order=id,desc&page=1&groupId=$groupId&categoryId=$categoryId&str=$str&price=&brandId=&colour=&size';
  // 'app/shopPageData?order=id,desc&page=1&groupId=&categoryId=29&str=&price=&brandId=&colour=&size='

  static productDetails(productId) => 'app/getProductDetails/$productId?isApp=1';

  static productRecommendation(productId) => 'app/relatedProduct/$productId';

  //wishlist
  static const addWishlist = 'app/wishlist';
  static const getWishlist = 'app/wishList';
  static const deleteWishlist = 'app/deleteWishlist';

  //cart
  static const addCart = 'app/cart/app';
  static const getCart = 'app/cart';
  static const updateCart = 'app/cart_update';
  static const deleteCart = 'app/cart_delete';
  static const allCity = 'app/cities';
  static allZone({id = ""}) => 'app/zones/$id';
  static const getPromoCode = 'app/checkCoupon';
  static const getReferralCode = 'app/checkReferralCode';
  static const getGiftVoucher = 'app/checkGiftVoucherCode';

  //notification
  static const getNotification = 'app/getNotiDetails';
  static const updateNotification = 'app/updateNoti';
  static const deleteNotification = 'app/deleteNoti';

  //profile
  static const addReport = 'app/reports';
  static const getReport = 'app/reports?page=1';
  static const editUser = 'app/user/edit';

  //order
  static const addOrder = 'app/orderApp';
  static const getOrder = 'app/order';
  static const deleteOrder = 'app/cancelOrder';
}
