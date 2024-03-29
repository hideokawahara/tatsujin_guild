//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//Pages
import 'package:tatsujin_guild/pages/post_page.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

//Utils
import 'package:tatsujin_guild/utils/check_result.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/time_line_view_model.dart';
import 'package:tatsujin_guild/view_models/master_view_model.dart';

//Widgets
import '../widgets/card.dart';
import '../widgets/icon.dart';
import 'package:tatsujin_guild/widgets/tab_bar.dart';
import 'package:tatsujin_guild/widgets/circular_indicator.dart';

class TimeLinePage extends StatelessWidget {
  TimeLinePage({Key? key}) : super(key: key);
  final List<String> tabContents = const ['ランキング', 'タイムライン'];
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimeLineViewModel(
        postRepository: PostRepositoryImpl(),
      ),
      child: DefaultTabController(
        length: 2,
        child: Container(
          decoration: AppColors.mainAppColorDecoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: AppColors.defaultBackGroundColor,
              title:
                  Consumer<MasterViewModel>(builder: (_, masterModel, child) {
                final String topicText = masterModel.topic ?? "";
                return Text(
                  'TATSUJINランキング\n前回のお題：$topicText',
                  style: AppStyles.titleStyle,
                );
              }),
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const BackArrowIcon(),
              ),
              bottom: DefaultTabBar(
                tabContents: tabContents,
              ),
            ),
            body: Builder(
              builder: (BuildContext newContext) {
                return FutureBuilder<void>(
                  future:
                      Provider.of<TimeLineViewModel>(newContext, listen: false)
                          .fetchInitialAllPosts(),
                  builder: (_, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const DefaultCircularIndicator();
                    }
                    return TabBarView(
                      children: [
                        const RankingPageBody(),
                        TimeLinePageBody(
                          controller: _controller,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            floatingActionButton: Consumer<TimeLineViewModel>(
              builder: (context, timeLineModel, child) {
                if (timeLineModel.isShow) {
                  return FloatingActionButton(
                    backgroundColor: AppColors.mainAppColor,
                    child: const Icon(
                      Icons.add,
                    ),
                    onPressed: () async {
                      Map<String, dynamic>? result =
                          await _showPostsScreen(context);
                      if (isValidResult(
                        result: result,
                        keyValue: 'update',
                      )) {
                        await timeLineModel.fetchInitialAllPosts();
                        await scrollToTop(_controller);
                      }
                    },
                  );
                } else {
                  return FloatingActionButton(
                    backgroundColor: Colors.black12,
                    child: const Icon(
                      Icons.close,
                    ),
                    onPressed: () {},
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _showPostsScreen(BuildContext context) async {
    //Todo: 投稿ページを修正する
    return await showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => Navigator(
        onGenerateRoute: (context) => MaterialPageRoute<PostPage>(
          builder: (context) => const PostPage(),
        ),
      ),
    );
  }

  Future<void> scrollToTop(ScrollController controller) => controller.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
}

class RankingPageBody extends StatelessWidget {
  const RankingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeLineViewModel>(
      builder: (context, timeLineModel, child) {
        if (timeLineModel.rankingList.isEmpty) {
          return const Center(
            child: Text('ランキングがありません'),
          );
        } else {
          return GridView.builder(
            key: const PageStorageKey(0),
            padding: const EdgeInsets.only(
              left: 16,
              top: 24,
              right: 16,
              bottom: 120,
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
              return RankingPostCard(
                rank: rank,
                likesCounts: timeLineModel.rankingList[index].likesCounts,
                contents: timeLineModel.rankingList[index].contents,
                authorImage: timeLineModel.rankingList[index].authorImage,
                authorName: timeLineModel.rankingList[index].authorName,
              );
            },
            shrinkWrap: true,
          );
        }
      },
    );
  }
}

class TimeLinePageBody extends StatelessWidget {
  const TimeLinePageBody({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeLineViewModel>(
      builder: (context, timeLineModel, child) {
        if (timeLineModel.timeLineList.isEmpty) {
          return const Center(
            child: Text('投稿がありません'),
          );
        } else {
          return ListView.builder(
            key: const PageStorageKey(1),
            controller: controller,
            clipBehavior: Clip.none,
            // scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 16,
              top: 24,
              right: 16,
              bottom: 120,
            ),
            itemCount: timeLineModel.timeLineList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext listContext, int index) {
              return Container(
                height: 200,
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: TimeLinePostcard(
                  // rank: rank,
                  likesCounts: timeLineModel.timeLineList[index].likesCounts,
                  contents: timeLineModel.timeLineList[index].contents,
                  authorImage: timeLineModel.timeLineList[index].authorImage,
                  authorName: timeLineModel.timeLineList[index].authorName,
                  isShow: timeLineModel.isShow,
                  addLikeCallback: () {
                    timeLineModel.addLikeCounter();
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
