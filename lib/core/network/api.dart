import 'package:finesse/service/app_mode.dart';

class API {
  static const LIVEImage =
      'http://mobileapi.scorebee.com/'; // Live Production API URL
  static const TESTImage =
      'http://staginapi.duare.net/'; // Live Staging API URL
  static const LIVE =
      'http://mobileapi.scorebee.com/api/'; // Live Production API URL
  static const TEST = 'https://finesseapi.dreamsgallerybd.com/'; // Live Staging API URL
  static const BASE = AppMode.PRODUCTION_MODE ? LIVE : TEST;
  static const BASEImage = AppMode.PRODUCTION_MODE ? LIVEImage : TESTImage;

  //Slider
  static const slider = 'app/allFrontSliders';

  //products category
  static const productsCategory = 'app/ladingProducts';
  static const category = 'app/allGroups';
  static const shop = 'app/shopPageData?order=id,desc&page=1&groupId=&categoryId=&str=&price=&brandId=&colour=&size';

}
