import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/modules/extract/extract_page.dart';
import 'package:pay_flow/modules/home/home_controller.dart';
import 'package:pay_flow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:pay_flow/shared/models/user_model.dart';
// import 'package:pay_flow/shared/models/boleto_model.dart';
// import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
// import 'package:pay_flow/shared/widget/boleto_list/boleto_list_widget.dart';
// import 'package:pay_flow/shared/widget/boleto_tile/boleto_tile_widget.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  // const HomePage({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeConroller = HomeController();

  final pages = [
    Container(
      // child: BoletoListWidget(),
      child: MeusBoletosPage(),
    ),
    Container(
      child: ExtractPage(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Container(
          height: 200,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Ola, ",
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: widget.user.name,
                      // text: widget.user.name,
                      style: TextStyles.titleBoldBackground,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.user.photoURL!))),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeConroller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                homeConroller.setPage(0);
                setState(() {});
              },
              icon: Icon(
                Icons.home,
                color: homeConroller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, "/barcode_scanner");
                Navigator.pushNamed(context, "/insertBoletos");
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                homeConroller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: homeConroller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
