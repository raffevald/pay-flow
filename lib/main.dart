import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'modules/splash/splash_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: SplashPage(),
    );
  }
}
