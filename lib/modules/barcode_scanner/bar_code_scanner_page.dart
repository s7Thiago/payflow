import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Escaneie o código de barras do boleto',
              style: TextStyles.buttonBackground,
            ),
            backgroundColor: Colors.black,
            leading: const BackButton(color: AppColors.background),
          ),
          body: Column(
            children: [
              Expanded(child: Container(color: Colors.black.withOpacity(.6))),
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
              Expanded(child: Container(color: Colors.black.withOpacity(.6))),
            ],
          ),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: 'Inserir código do boleto',
            primaryOnPressed: () {},
            secondaryLabel: 'Adicionar da galeria',
            secondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
