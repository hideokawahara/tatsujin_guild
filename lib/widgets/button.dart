//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    Key? key,
    required this.width,
    this.isActivate = false,
    this.onTap,
  }) : super(key: key);
  final double width;
  final bool isActivate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null && isActivate) {
          onTap!();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        width: width,
        decoration: BoxDecoration(
          color: buttonColor(
            isActivateValue: isActivate,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        alignment: Alignment.center,
        child: const Text(
          '投稿する',
          style: AppStyles.buttonTextStyle,
        ),
      ),
    );
  }

  Color buttonColor({required isActivateValue}) {
    final Color setColor;
    if (isActivateValue) {
      setColor = AppColors.mainAppColor;
    } else {
      setColor = AppColors.defaultInactiveColor;
    }
    return setColor;
  }
}
