import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class ExtratosPage extends StatefulWidget {
  const ExtratosPage({Key? key}) : super(key: key);

  @override
  State<ExtratosPage> createState() => _ExtratosPageState();
}

// Todo: colocar o indicador de quantidade total de boletos
class _ExtratosPageState extends State<ExtratosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text('Meus extratos', style: TextStyles.titleBoldHeading)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
              thickness: 1,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}
