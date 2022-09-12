//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Pages
import 'package:tatsujin_guild/pages/time_line_page.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//Widgets
import 'package:tatsujin_guild/widgets/logo.dart';
import 'package:tatsujin_guild/widgets/card.dart';
import 'package:tatsujin_guild/widgets/icon.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const Scaffold(
        backgroundColor: AppColors.defaultBackGroundColor,
        body: HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopLogo(
              width: screenWidth,
              height: 200,
            ),
            const SizedBox(
              height: 8,
            ),
            popularPostListSection(context),
            const SizedBox(
              height: 8,
            ),
            // femaleUserListSection(context),
          ],
        ),
      ),
    );
  }

  Widget popularPostListSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const TimeLinePage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  height: 24,
                  width: 24,
                ),
                Text(
                  '昨日の人気のTATSUJINランキング',
                  style: AppStyles.headStyle,
                ),
                ForwardArrowIcon(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Consumer<HomeViewModel>(
            builder: (context, homeModel, child) {
              if (homeModel.postList.isEmpty) {
                return const Center(
                  child: Text('Jokeがありません'),
                );
              } else {
                return ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemCount: homeModel.postList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext listContext, int index) {
                    int rank = index + 1;
                    return HomePostCard(
                      rank: rank,
                      likesCounts: 1000,
                      contents: homeModel.postList[index],
                      authorImage:
                          'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
                      authorName: '投稿者',
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
