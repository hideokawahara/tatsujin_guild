//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

//Widgets
import 'package:tatsujin_guild/widgets/tag.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    Key? key,
    required this.index,
    required this.name,
    required this.profileMessage,
    required this.authorImage,
    required this.contents,
    required this.likeCounts,
  }) : super(key: key);
  final int index;
  final String name;
  final String profileMessage;
  final String authorImage;
  final String contents;
  final int likeCounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.defaultBackGroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: UserDetailsPageBody(
          index: index,
          name: name,
          profileMessage: profileMessage,
          authorImage: authorImage,
          contents: contents,
          likeCounts: likeCounts,
        ),
      ),
    );
  }
}

class UserDetailsPageBody extends StatelessWidget {
  const UserDetailsPageBody({
    Key? key,
    required this.index,
    required this.name,
    required this.profileMessage,
    required this.authorImage,
    required this.contents,
    required this.likeCounts,
  }) : super(key: key);
  final int index;
  final String name;
  final String profileMessage;
  final String authorImage;
  final String contents;
  final int likeCounts;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
                      child: Hero(
                        tag: 'imageHero$index',
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: Image.network(
                            authorImage,
                            fit: BoxFit.cover,
                          ).image,
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Hero(
                          tag: 'rankingHero$index',
                          child: RankingTag(
                            rank: index,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
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
                    Text(
                      contents,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          color: Colors.redAccent,
                        ),
                        Text(
                          '$likeCounts',
                          style: const TextStyle(
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
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
