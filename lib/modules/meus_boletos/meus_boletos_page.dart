import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Meus boletos', style: TextStyles.titleBoldHeading)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            color: AppColors.stroke,
            thickness: 1,
            height: 1,
          ),
        ),
        const BoletoListWidget(),
      ],
    );
  }
}
