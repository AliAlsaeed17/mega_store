import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  Future<UserModel> get getUser async {
    try {
      UserModel user = await _getUserData();
      return user;
    } catch (e) {
      print(e.toString());
      return UserModel(id: "0", email: "ERROR");
    }
  }

  setUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cachedUserData, json.encode(user.toJson()));
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = prefs.get(cachedUserData) as String;
    return UserModel.fromJson(json.decode(userData));
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(cachedUserData);
  }
}
