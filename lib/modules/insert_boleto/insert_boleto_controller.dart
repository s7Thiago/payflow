import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode estar vazio' : null;
  String? validateVencimento(String? value) => value?.isEmpty ?? true
      ? 'A data de vencimento não pode estar vazia'
      : null;
  String? validateValor(double? value) =>
      value == 0 ? 'Insira um valor maior que R\$0,00' : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? 'O código do boleto não pode estar vazio' : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  void cadastrarBoleto() {
    final form = formKey.currentState;

    if (form!.validate()) {
      print(model);
    }
  }
}
