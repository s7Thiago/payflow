import 'package:flutter/material.dart';
import 'package:payflow/modules/extratos/extratos_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/routes.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  style: TextStyles.titleRegular,
                  text: 'Olá, ',
                  children: [
                    TextSpan(
                      text: widget.user.name,
                      style: TextStyles.titleBoldBackground,
                    )
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: TextStyles.captionShape,
              ),
              trailing: Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () => authController.clearUser(context),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                          widget.user.photoURL!,
                        ))),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(key: UniqueKey()),
        ExtratosPage(key: UniqueKey()),
      ][controller.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(
                Icons.home,
                color: controller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
            Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () async {
                  await Navigator.pushNamed(context, AppRoutes.BARCODE_SCANNER);
                  setState(() {});
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
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
