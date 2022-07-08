import 'package:flutter/cupertino.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  BoletoModel model = BoletoModel();
  final formKey = GlobalKey<FormState>();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange(
      {String? name, String? dueDate, double? value, String? barcaode}) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcaode,
    );
  }

  void saveBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList("boletos") ?? <String>[];
      boletos.add(model.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    } catch (a) {}
  }

  Future<void> cadastrarBoletos() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return saveBoleto();
    }
  }
}
