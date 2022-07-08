import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_flow/modules/home/home_page.dart';
import 'package:pay_flow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:pay_flow/modules/splash/splash_page.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.background));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      // home: LoginPage(),
      initialRoute: "/splash",
      routes: {
        "/splash": ((context) => SplashPage()),
        "/home": ((context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            )),
        "/login": ((context) => LoginPage()),
        // "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insertBoletos": ((context) => InserirBoletosPage()),
      },
    );
  }
}
