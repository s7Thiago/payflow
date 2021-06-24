import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.shape,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: AppColors.stroke),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        splashColor: AppColors.shape,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: const Border.fromBorderSide(
              BorderSide(color: AppColors.stroke),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Image.asset(AppImages.google),
                    Container(height: 56, width: 1, color: AppColors.stroke)
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    'Entrar com Google',
                    style: TextStyles.buttonGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
