//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

class DefaultCircularIndicator extends StatelessWidget {
  const DefaultCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.mainAppColor,
        backgroundColor: Colors.white,
      ),
    );
  }
}
