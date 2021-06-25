import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/routes.dart';

class AuthController {
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  // Encapsula o processo de alteração do usuário logado
  void setUser(BuildContext context, var user) {
    if (user != null) {
      _isAuthenticated = true;
      _user = user;
      Navigator.pushReplacementNamed(context, AppRoutes.HOME);
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
    }
  }
}
