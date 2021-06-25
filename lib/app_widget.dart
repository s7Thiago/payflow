import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/spash/splash_page.dart';
import 'package:payflow/shared/routes.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: AppRoutes.SPLASH,
      routes: {
        AppRoutes.SPLASH: (_) => const SplashPage(),
        AppRoutes.HOME: (_) => const HomePage(),
        AppRoutes.LOGIN: (_) => const LoginPage(),
      },
    );
  }
}
