import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/widget/boleto_info/boleto_info_widget.dart';
import 'package:pay_flow/shared/widget/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/shared/widget/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  // @override
  // initState() {
  //   setState(() {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (__, boletos, _) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInofWidget(size: boletos.length),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Meus Boletos",
                  style: TextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
