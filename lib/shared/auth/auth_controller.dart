import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  // Encapsula o processo de alteração do usuário logado
  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      saveUser(user);
      // Passing the user data to use on home page
      Navigator.pushReplacementNamed(context, AppRoutes.HOME, arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));

    if (instance.containsKey('user')) {
      final user = instance.get('user') as String;
      setUser(context, UserModel.fromJson(user));
      return;
    } else {
      setUser(context, null);
    }
    return;
  }

  Future<void> clearUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    instance.remove('user');
    setUser(context, null);

    return Future.value();
  }
}
