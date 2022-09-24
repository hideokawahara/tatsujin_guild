//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

//Utils
import 'package:tatsujin_guild/utils/set_image.dart';

//Widgets
import 'package:tatsujin_guild/widgets/icon.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key? key,
    required this.path,
    this.radius,
  }) : super(key: key);
  final String? path;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    if (path != null && path!.isNotEmpty) {
      return CircleAvatar(
        backgroundColor: AppColors.mainAppColor,
        backgroundImage: setImage(
          path ?? '',
        )?.image,
        radius: radius,
      );
    } else {
      return CircleAvatar(
        backgroundColor: AppColors.mainAppColor,
        radius: radius,
        child: UserIcon(
          size: radius,
          color: Colors.white,
        ),
      );
    }
  }
}
