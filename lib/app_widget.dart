import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/routes.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: AppRoutes.SPLASH,
      routes: {
        AppRoutes.SPLASH: (_) => const SplashPage(),
        AppRoutes.HOME: (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        AppRoutes.LOGIN: (_) => const LoginPage(),
        AppRoutes.BARCODE_SCANNER: (_) => const BarCodeScannerPage(),
        AppRoutes.BARCODE_INSERT_BOLETO: (_) => const InsertBoletoPage(),
      },
    );
  }
}
