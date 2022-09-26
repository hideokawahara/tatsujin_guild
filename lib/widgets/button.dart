//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//Widgest
import 'package:tatsujin_guild/widgets/icon.dart';

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

class AddPhotoButton extends StatelessWidget {
  const AddPhotoButton({
    Key? key,
    this.height,
    this.width,
    this.iconSize,
    required this.onTap,
  }) : super(key: key);
  final double? height;
  final double? width;
  final double? iconSize;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.mainAppColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.settingsBackGroundColor,
            width: 4,
          ),
        ),
        child: AddPhotoIcon(
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String name;
  final Function onPressed;

  const AuthButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.defaultBackGroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.mainAppColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
