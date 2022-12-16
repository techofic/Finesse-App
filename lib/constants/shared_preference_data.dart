// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:nb_utils/nb_utils.dart';

class SharedPreferencesHelper {
  var contactValue;
  var nameValue;
  var emailValue;

  contact(String contact) async {
    SharedPreferences.getInstance().then(
      (pref) {
        pref.setString('contact', contact);
        contactValue = pref.getString("contact") ?? "";
      },
    );
  }

  email(String email) async {
    SharedPreferences.getInstance().then(
      (pref) {
        pref.setString('email', email);
        emailValue = pref.getString("email") ?? "";
        // print("local database: $emailValue");
      },
    );
  }

  name(String name) async {
    SharedPreferences.getInstance().then(
      (pref) {
        pref.setString('name', name);
        nameValue = pref.getString("name") ?? "";
        //print("local database: $nameValue");
      },
    );
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }

}
