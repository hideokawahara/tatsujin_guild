//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({
    Key? key,
    this.width = 400,
    this.height = 200,
  }) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    //Todo: ロゴは暫定版
    return Container(
      width: width,
      height: height,
      decoration: AppColors.mainAppColorDecoration,
      alignment: Alignment.center,
      child: const Text(
        'TATSUJIN GUILD',
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w900,
          decoration: TextDecoration.overline,
          shadows: <Shadow>[
            Shadow(
              color: Colors.grey,
              offset: Offset(2.0, 5.0),
              blurRadius: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
