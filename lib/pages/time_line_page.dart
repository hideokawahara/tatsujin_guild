//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/time_line_view_model.dart';

//Widgets
import '../widgets/card.dart';
import '../widgets/icon.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimeLineViewModel(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.defaultBackGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.defaultBackGroundColor,
            title: const Text(
              'TATSUJINランキング\n前回のお題：駄洒落',
              style: AppStyles.headStyle,
            ),
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackArrowIcon(),
            ),
            bottom: const TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.wine_bar_sharp,
                    // color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.run_circle,
                    // color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              RankingPageBody(),
              TimeLinePageBody(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black12,
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class RankingPageBody extends StatelessWidget {
  const RankingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeLineViewModel>(
      builder: (context, timeLineModel, child) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            mainAxisExtent: 240,
          ),
          itemCount: timeLineModel.rankingList.length,
          itemBuilder: (context, index) {
            int rank = index + 1;
            return HomePostCard(
              rank: rank,
              likesCounts: 1000,
              contents: timeLineModel.rankingList[index],
              authorImage:
                  'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
              authorName: '投稿者',
            );
          },
          shrinkWrap: true,
        );
      },
    );
  }
}

class TimeLinePageBody extends StatelessWidget {
  const TimeLinePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeLineViewModel>(
      builder: (context, timeLineModel, child) {
        if (timeLineModel.rankingList.isEmpty) {
          return const Center(
            child: Text('投稿がありません'),
          );
        } else {
          return ListView.builder(
            clipBehavior: Clip.none,
            // scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: timeLineModel.rankingList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext listContext, int index) {
              int rank = index + 1;
              return Container(
                height: 200,
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: HomePostCard(
                  rank: rank,
                  likesCounts: 1000,
                  contents: timeLineModel.rankingList[index],
                  authorImage:
                      'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
                  authorName: '投稿者',
                ),
              );
            },
          );
        }
      },
    );
  }
}
