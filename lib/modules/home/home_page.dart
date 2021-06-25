import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                      text: 'Thiago',
                      style: TextStyles.titleBoldBackground,
                    )
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: AppColors.primary,
              ),
            ),
            InkWell(
              onTap: () {
                print('button on home');
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
