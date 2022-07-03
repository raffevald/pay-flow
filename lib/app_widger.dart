import 'package:flutter/material.dart';
import 'package:pay_flow/modules/barcode_scacanner/barcode_scanner_page.dart';
import 'package:pay_flow/modules/home/home_page.dart';
import 'package:pay_flow/modules/splash/splash_page.dart';
import 'modules/login/login_page.dart';
// import 'shared/models/user_model.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

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
        "/home": ((context) => HomePage()),
        // "/home": (context) => HomePage(
        //     user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/login": ((context) => LoginPage()),
        "barcodeScanner": ((context) => BarcadodeScannerPage()),
      },
    );
  }
}
