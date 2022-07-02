import 'package:flutter/material.dart';
import 'package:pay_flow/modules/home/home_page.dart';
import 'package:pay_flow/modules/splash/splash_page.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      // home: LoginPage(),
      initialRoute: "/splash",
      routes: {
        "/splash": ((context) => const SplashPage()),
        "/home": ((context) => const HomePage()),
        "/login": ((context) => LoginPage())
      },
    );
  }
}
