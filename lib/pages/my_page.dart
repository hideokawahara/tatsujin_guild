//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

//Pages
import 'package:tatsujin_guild/pages/message_edit_page.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

//Utils
import 'package:tatsujin_guild/utils/popup.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/auth_view_model.dart';

//Widgets
import 'package:tatsujin_guild/widgets/icon.dart';
import 'package:tatsujin_guild/widgets/user_avatar.dart';
import 'package:tatsujin_guild/widgets/button.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.defaultBackGroundColor,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: MyPageBody(),
      ),
    );
  }
}

class MyPageBody extends StatelessWidget {
  const MyPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final rootAuthModel = Provider.of<AuthViewModel>(context, listen: false);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: AppColors.mainAppColorDecoration,
                    height: 400,
                    width: screenWidth,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Consumer<AuthViewModel>(
                            builder: (context, authModel, child) {
                              final String? photoPath =
                                  authModel.myData?.mainPhoto;
                              return UserCircleAvatar(
                                path: photoPath,
                                radius: 120,
                              );
                            },
                          ),
                          AddPhotoButton(
                            height: 64,
                            width: 64,
                            iconSize: 32,
                            onTap: () async {
                              File? file =
                                  await showGetImagePopUp(context: context);
                              if (file != null) {
                                rootAuthModel.addMainPhoto(file);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<AuthViewModel>(
                        builder: (context, authModel, child) {
                      final String? name = authModel.myData?.name;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // RankingTag(
                          //   rank: index,
                          // ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                    Consumer<AuthViewModel>(
                      builder: (context, authModel, child) {
                        final String profileMessage =
                            authModel.myData?.profileMessage ?? '';
                        return introductionSection(
                          context: context,
                          profileMessage: profileMessage,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      '投稿',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'なにいれよう？',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.favorite_rounded,
                          color: Colors.redAccent,
                        ),
                        Text(
                          '666',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48,
          ),
          child: IconButton(
            icon: const BackArrowIcon(
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget introductionSection({
    required BuildContext context,
    required String profileMessage,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => const MessageEditPage(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'プロフィール',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            profileMessage,
          )
        ],
      ),
    );
  }
}
