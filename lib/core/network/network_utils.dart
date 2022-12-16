import 'dart:convert';
import 'package:finesse/constants/shared_preference_constant.dart';
import 'package:finesse/service/navigation_service.dart';
import 'package:finesse/src/features/auth/login/view/login_page.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'api.dart';

class Network {
  static String noInternetMessage = "Check your connection!";

  static getRequest(String endPoint,
      {bool requireToken = true, bool noBaseUrl = false}) async {
    if (await isNetworkAvailable()) {
      Response response;
      var accessToken = getStringAsync(token);
      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      if (requireToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }

      print('\nURL: ${API.base}$endPoint');
      print("Headers: $headers\n");
      if (requireToken) {
        response = await get(
            Uri.parse(noBaseUrl ? endPoint : '${API.base}$endPoint'),
            headers: headers);
      } else {
        response =
            await get(Uri.parse(noBaseUrl ? endPoint : '${API.base}$endPoint'));
      }

      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static postRequest(String endPoint, body, {bool requireToken = true}) async {
    if (await isNetworkAvailable()) {
      var accessToken = getStringAsync(token);
      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      if (requireToken) {
        var header = {"Authorization": "Bearer $accessToken"};
        headers.addAll(header);
      }
      print('\nURL: ${API.base}$endPoint');
      print("Headers: $headers");
      print('Request Body: ${jsonEncode(body)}\n');

      Response response = await post(Uri.parse('${API.base}$endPoint'),
          body: jsonEncode(body), headers: headers);

      //print('Response: $response');
      return response;
    } else {
      throw noInternetMessage;
    }
  }

  static handleResponse(Response response) async {
    if (!await isNetworkAvailable()) {
      toast('No network available');
    } else if (response.statusCode >= 200 && response.statusCode <= 210) {
      print('\nSuccessCode: ${response.statusCode}');
      print('SuccessResponse: ${response.body}\n');
      if (response.body.isNotEmpty) {
        return json.decode(response.body);
      } else {
        return response.body;
      }
    } else {
      print('\nErrorCode: ${response.statusCode}');
      print("ErrorResponse: ${response.body}\n");

      if (response.statusCode == 403) {
        /// Session expired
        toast('Session expired! Login to continue...', bgColor: KColor.red);

        setValue(loggedIn, false);
        NavigationService.navigateToReplacement(
            CupertinoPageRoute(builder: (_) => const LoginPage()));
      } else if (response.statusCode == 422) {
        /// Custom validation message
        toast(
          '${jsonDecode(response.body)['messages'][0]}',
          bgColor: KColor.red,
        );
      } else if (response.statusCode == 429) {
        /// Too many attempts message
        toast(
          '${jsonDecode(response.body)['message']}',
          bgColor: KColor.red,
        );
      } else if (response.statusCode == 402) {
        /// Custom validation message
        toast(
          '${jsonDecode(response.body)['messages']}',
          bgColor: KColor.red,
        );
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        /// Custom message
        if (jsonDecode(response.body)['message'] == "Unauthenticated.") {
          toast('Login to continue...', bgColor: KColor.red);

          // setValue(LOGGED_IN, false);
          // NavigationService.navigateToReplacement(CupertinoPageRoute(builder: (_) => LoginScreen()));
        } else {
          toast('${jsonDecode(response.body)['message']}', bgColor: KColor.red);
        }
        if (jsonDecode(response.body)['unverified'] != null) {
          if (jsonDecode(response.body)['unverified']) {
            if (response.body.isNotEmpty) return json.decode(response.body);
          }
        }
      } else {
        toast('Something went wrong!', bgColor: KColor.red);
      }
    }
  }
}
