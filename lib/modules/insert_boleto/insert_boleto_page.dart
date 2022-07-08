import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:pay_flow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:pay_flow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/widget/input_text/input_text_widget.dart';
import 'package:pay_flow/shared/widget/set_label_buttons/set_label_buttons.dart';

class InserirBoletosPage extends StatefulWidget {
  final String? barcode;
  const InserirBoletosPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  State<InserirBoletosPage> createState() => _InserirBoletosPageState();
}

class _InserirBoletosPageState extends State<InserirBoletosPage> {
  final controller = InsertBoletoController();
  final authController = AuthController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextcontroller = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 24),
                child: Text(
                  "Preencher os dados do Boletos",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: "Nome do Boleto",
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                      validator: controller.validateName,
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextcontroller,
                      label: "Vencimento do Boleto",
                      // icon: FontAwesomeIcons.timesCircle,
                      icon: Icons.date_range,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                      validator: controller.validateVencimento,
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: "Valor do Boleto",
                      // icon: FontAwesomeIcons.walle,
                      icon: Icons.money,
                      onChanged: (value) {
                        controller.onChange(
                            value: moneyInputTextController.numberValue);
                      },
                      validator: (_) => controller
                          .validateValor(moneyInputTextController.numberValue),
                    ),
                    InputTextWidget(
                      controller: barcodeInputTextController,
                      label: "Codigo do Boleto",
                      // icon: FontAwesomeIcons.barcode,
                      icon: Icons.code_outlined,
                      onChanged: (value) {
                        controller.onChange(barcaode: value);
                      },
                      validator: controller.validateCodigo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () async {
          await controller.cadastrarBoletos();
          // print(authController.currentUser(context));
          // Navigator.pushReplacementNamed(context, "/home",
          //     arguments: authController.currentUser(context) as UserModel);
          // Navigator.pop((context));
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
